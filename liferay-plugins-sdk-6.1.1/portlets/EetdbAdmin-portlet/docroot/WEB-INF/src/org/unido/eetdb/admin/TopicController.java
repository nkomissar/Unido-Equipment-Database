package org.unido.eetdb.admin;

import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.util.HashMap;
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
import org.unido.eetdb.common.model.Topic;

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
public class TopicController 
{
	@Autowired
	@Qualifier("jsonview")
	private View jsonView;
	
	@RenderMapping(params = "action=doTopicSearch")
	public ModelAndView searchTopic(@RequestParam String query, RenderRequest renderRequest) 
	{

		if (ConfigWrapper.useFiddlerProxy(renderRequest))
		{
			
			Properties props = System.getProperties();
			props.put("http.proxyHost", "localhost"); 
			props.put("http.proxyPort", "8888");
			 
		}
		
		RestTemplate tmpl = new RestTemplate();
		
		Topic[] topics = tmpl.getForObject(
					ConfigWrapper.getServUrl(renderRequest) + "/search-for-topics/{i}", 
					Topic[].class, query);
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("success", Boolean.TRUE);
		data.put("topics", topics);

		return new ModelAndView(jsonView, data);

	}

	@RenderMapping(params = "action=doTopicLoad")
	public ModelAndView loadTopic(@RequestParam long topicId,
			RenderRequest renderRequest) {

		if (ConfigWrapper.useFiddlerProxy(renderRequest))
		{
			
			Properties props = System.getProperties();
			props.put("http.proxyHost", "localhost"); 
			props.put("http.proxyPort", "8888");
			 
		}
		RestTemplate tmpl = new RestTemplate();

		Topic topic = tmpl.getForObject(
				ConfigWrapper.getServUrl(renderRequest) + "/topic/{id};skip_childs=0",
				Topic.class, topicId);

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("success", Boolean.TRUE);
		data.put("topic", topic);

		return new ModelAndView(jsonView, data);

	}
	
	@ActionMapping(params = "action=doTopicPost")
	public void postTopic(ActionRequest request,
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

		Topic readValue = null;
		try {
			readValue = mapper.readValue(strm, Topic.class);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		User user = PortalUtil.getUser(request);
		readValue.setLastUpdatedBy(user.getFullName());
		
		if (ConfigWrapper.useFiddlerProxy(request))
		{
			
			Properties props = System.getProperties();
			props.put("http.proxyHost", "localhost");
			props.put("http.proxyPort", "8888");
			 
		}

		RestTemplate tmpl = new RestTemplate();
		Topic topic;
		if (readValue.getId() == 0) {
			topic = tmpl.postForObject(
					ConfigWrapper.getServUrl(request) + "/topic", readValue,
					Topic.class);
		} else {
			
			String url = ConfigWrapper.getServUrl(request) + "/topic";

			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);
			HttpEntity<Topic> hEntity = new HttpEntity<Topic>(
					readValue, headers);
			
			ResponseEntity<Topic> responseWrapper = tmpl.exchange(url,
					HttpMethod.PUT, hEntity, Topic.class);

			topic = responseWrapper.getBody();

		}

		request.setAttribute("newTopic", topic);
		response.setRenderParameter("action", "returnNewTopic");

	}

	@RenderMapping(params = "action=returnNewTopic")
	public ModelAndView returnNewTopic(RenderRequest request) {

		Topic topic = (Topic) request
				.getAttribute("newTopic");

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("success", Boolean.TRUE);
		data.put("topic", topic);

		return new ModelAndView(jsonView, data);

	}
	
	@ActionMapping(params = "action=doTopicDestroy")
	public void destroyTopic(ActionRequest request,
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

		Topic readValue = null;
		try {
			readValue = mapper.readValue(strm, Topic.class);
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

		String url = ConfigWrapper.getServUrl(request) + "/topic";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<Topic> hEntity = new HttpEntity<Topic>(
				readValue, headers);

		tmpl.exchange(url,HttpMethod.DELETE, hEntity, String.class);

		response.setRenderParameter("action", "reportDestroyTopic");

	}
	
	@RenderMapping(params = "action=reportDestroyTopic")
	public ModelAndView reportDestroy(RenderRequest request) {

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("success", Boolean.TRUE);
		data.put("topic", null);

		return new ModelAndView(jsonView, data);

	}


}