package org.unido.eetdb.admin;

import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.RenderRequest;

import org.apache.http.client.methods.HttpUriRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.servlet.View;
import org.unido.eetdb.admin.util.ConfigWrapper;
import org.unido.eetdb.admin.util.HttpEntityEnclosingDeleteRequest;
import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.EntityProperty;
import org.unido.eetdb.common.model.EntitySearchResult;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.AnnotationIntrospector;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.introspect.JacksonAnnotationIntrospector;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.fasterxml.jackson.module.jaxb.JaxbAnnotationIntrospector;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.model.User;
import com.liferay.portal.util.PortalUtil;

@Controller
@RequestMapping("view")
public class EntityController 
{
	@Autowired
	@Qualifier("jsonview")
	private View jsonView;
	
	@RenderMapping(params = "action=doEntitySearch")
	public ModelAndView searchEntity(@RequestParam String query, RenderRequest renderRequest) 
	{

		if (ConfigWrapper.useFiddlerProxy(renderRequest))
		{
			
			Properties props = System.getProperties();
			props.put("http.proxyHost", "localhost"); 
			props.put("http.proxyPort", "8888");
			 
		}
		
		RestTemplate tmpl = new RestTemplate();
		
		EntitySearchResult[] entities = tmpl.getForObject(
					ConfigWrapper.getServUrl(renderRequest) + "/search-for-entities/{i}", 
					EntitySearchResult[].class, query);
		/*
		EntitySearchResult[] entities = new EntitySearchResult[1]
		entities[0] = new EntitySearchResult();
		entities[0].setEntityId("55");
		entities[0].setEntityName("Mock name");
		*/
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("success", Boolean.TRUE);
		data.put("entities", entities);

		return new ModelAndView(jsonView, data);

	}

	@RenderMapping(params = "action=doEntityLoad")
	public ModelAndView loadEntity(@RequestParam long entityId,
			RenderRequest renderRequest) {

		if (ConfigWrapper.useFiddlerProxy(renderRequest))
		{
			
			Properties props = System.getProperties();
			props.put("http.proxyHost", "localhost"); 
			props.put("http.proxyPort", "8888");
			 
		}
		RestTemplate tmpl = new RestTemplate();

		Entity entity = tmpl.getForObject(
				ConfigWrapper.getServUrl(renderRequest) + "/entity/{id};skip_childs=0",
				Entity.class, entityId);

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("success", Boolean.TRUE);
		data.put("entity", entity);

		return new ModelAndView(jsonView, data);

	}
	
	@ActionMapping(params = "action=doEntityPost")
	public void postEntity(ActionRequest request,
			ActionResponse response) throws PortalException, SystemException {

		ObjectMapper mapper = new ObjectMapper();
		AnnotationIntrospector primary = new JaxbAnnotationIntrospector(
				TypeFactory.defaultInstance());
		AnnotationIntrospector secondary = new JacksonAnnotationIntrospector();
		AnnotationIntrospector pair = AnnotationIntrospector.pair(primary,
				secondary);
		mapper.getDeserializationConfig().with(pair);
		mapper.getSerializationConfig().with(pair);

		InputStream strm = null;
		try {
			strm = request.getPortletInputStream();
		} catch (IOException e) {
			e.printStackTrace();
		}

		Entity readValue = null;
		try {
			readValue = mapper.readValue(strm, Entity.class);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		User user = PortalUtil.getUser(request);
		readValue.setLastUpdatedBy(user.getFullName());
		
		Iterator<EntityProperty> itr = readValue.getProperties().iterator();
		
		while(itr.hasNext())
		{
			EntityProperty prop = itr.next();
			prop.setLastUpdatedBy(user.getFullName());
		}
		
		if (ConfigWrapper.useFiddlerProxy(request))
		{
			
			Properties props = System.getProperties();
			props.put("http.proxyHost", "localhost");
			props.put("http.proxyPort", "8888");
			 
		}

		RestTemplate tmpl = new RestTemplate();
		Entity entity;
		if (readValue.getId() == 0) {
			entity = tmpl.postForObject(
					ConfigWrapper.getServUrl(request) + "/entity", readValue,
					Entity.class);
		} else {
			String url = ConfigWrapper.getServUrl(request) + "/entity";

			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);
			HttpEntity<Entity> hEntity = new HttpEntity<Entity>(
					readValue, headers);
			ResponseEntity<Entity> responseWrapper = tmpl.exchange(url,
					HttpMethod.PUT, hEntity, Entity.class);
			Entity resp = responseWrapper.getBody();

			entity = resp;
		}

		request.setAttribute("newEntity", entity);
		response.setRenderParameter("action", "returnNewEntity");

	}

	@RenderMapping(params = "action=returnNewEntity")
	public ModelAndView returnNewEntity(RenderRequest request) {

		Entity entity = (Entity) request
				.getAttribute("newEntity");

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("success", Boolean.TRUE);
		data.put("entity", entity);

		return new ModelAndView(jsonView, data);

	}
	
	@ActionMapping(params = "action=doEntityDestroy")
	public void destroyEntity(ActionRequest request,
			ActionResponse response) {

		ObjectMapper mapper = new ObjectMapper();
		AnnotationIntrospector primary = new JaxbAnnotationIntrospector(TypeFactory.defaultInstance());
		AnnotationIntrospector secondary = new JacksonAnnotationIntrospector();
		AnnotationIntrospector pair = AnnotationIntrospector.pair(primary, secondary);
		mapper.getDeserializationConfig().with(pair);
		mapper.getSerializationConfig().with(pair);

		InputStream strm = null;
		try {
			strm = request.getPortletInputStream();
		} catch (IOException e) {
			e.printStackTrace();
		}

		Entity readValue = null;
		try {
			readValue = mapper.readValue(strm, Entity.class);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		if (ConfigWrapper.useFiddlerProxy(request))
		{
			
			Properties props = System.getProperties();
			props.put("http.proxyHost", "localhost");
			props.put("http.proxyPort", "8888");
			 
		}

		RestTemplate tmpl = new RestTemplate();

		tmpl.setRequestFactory(new HttpComponentsClientHttpRequestFactory() {
			@Override
			protected HttpUriRequest createHttpUriRequest(
					HttpMethod httpMethod, URI uri) {
				if (HttpMethod.DELETE == httpMethod) {
					return new HttpEntityEnclosingDeleteRequest(uri);
				}
				return super.createHttpUriRequest(httpMethod, uri);
			}
		});

		String url = ConfigWrapper.getServUrl(request) + "/entity";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<Entity> hEntity = new HttpEntity<Entity>(
				readValue, headers);
		//ResponseEntity<String> responseWrapper = 
		tmpl.exchange(url,HttpMethod.DELETE, hEntity, String.class);
		// EntityTemplate resp = responseWrapper.getBody();

		response.setRenderParameter("action", "reportDestroyEntity");

	}
	
	@RenderMapping(params = "action=reportDestroyEntity")
	public ModelAndView reportDestroy(RenderRequest request) {

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("success", Boolean.TRUE);
		data.put("entity", null);

		return new ModelAndView(jsonView, data);

	}


}