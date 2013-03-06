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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.ClientHttpRequest;
import org.springframework.http.client.ClientHttpRequestFactory;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.servlet.View;
import org.unido.eetdb.admin.util.HttpEntityEnclosingDeleteRequest;
import org.unido.eetdb.common.model.EntityTemplate;

import org.apache.http.client.methods.HttpUriRequest;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.AnnotationIntrospector;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.introspect.JacksonAnnotationIntrospector;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.fasterxml.jackson.module.jaxb.JaxbAnnotationIntrospector;

@Controller
@RequestMapping("view")
public class TemplateController {

	@Autowired
	@Qualifier("jsonview")
	private View jsonView;
	
	@RenderMapping(params = "action=doEntityTemplateList")
	public ModelAndView loadEntityTemplateList() 
	{

		RestTemplate tmpl = new RestTemplate();
		
		EntityTemplate[] templates = tmpl.getForObject("http://localhost:8080/EetdbServices/templates", EntityTemplate[].class);
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("success", Boolean.TRUE);
		data.put("templates", templates);

		return new ModelAndView(jsonView, data);

	}

	@RenderMapping(params = "action=doEntityTemplateLoad")
	public ModelAndView loadEntityTemplate(@RequestParam long entityTemplateId) 
	{

		RestTemplate tmpl = new RestTemplate();
		
		EntityTemplate template = tmpl.getForObject("http://localhost:8080/EetdbServices/template/{id}", EntityTemplate.class, entityTemplateId);
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("success", Boolean.TRUE);
		data.put("template", template);

		return new ModelAndView(jsonView, data);

	}

	@ActionMapping(params = "action=doEntityTemplatePost")
	public void postEntityTemplate(ActionRequest request, ActionResponse response) 
	{

		
	    ObjectMapper mapper = new ObjectMapper();
	    AnnotationIntrospector primary = new JaxbAnnotationIntrospector( TypeFactory.defaultInstance() );
	    AnnotationIntrospector secondary = new JacksonAnnotationIntrospector();
	    AnnotationIntrospector pair = AnnotationIntrospector.pair(primary, secondary);
	    mapper.getDeserializationConfig().with(pair);
	    mapper.getSerializationConfig().with(pair);

		//DateFormat df = new SimpleDateFormat("m d y");
		//mapper.setDateFormat(df);
		
		InputStream strm = null;
		try {
			strm = request.getPortletInputStream();
		} catch (IOException e) {
			e.printStackTrace();
		}
				
		EntityTemplate readValue = null;
		try {
			readValue = mapper.readValue(strm, EntityTemplate.class);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		

		/*Properties props = System.getProperties();
		props.put("http.proxyHost", "localhost");
		props.put("http.proxyPort", "8888");*/
		
		RestTemplate tmpl = new RestTemplate();
		EntityTemplate template;
		if (readValue.getId() == 0) {
			template = tmpl.postForObject("http://localhost:8080/EetdbServices/template", readValue, EntityTemplate.class);
		}
		else 
		{
	        String url = "http://localhost:8080/EetdbServices/template";

	        HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.APPLICATION_JSON);
	        HttpEntity<EntityTemplate> entity = new HttpEntity<EntityTemplate>(readValue, headers);
	        ResponseEntity<EntityTemplate> responseWrapper = tmpl.exchange(url, HttpMethod.PUT, entity, EntityTemplate.class);
	        EntityTemplate resp = responseWrapper.getBody();
	        
	        template = resp;
		}
		
		request.setAttribute("newTemplate", template);
		response.setRenderParameter("action", "returnNewTemplate");

	}
	
	@RenderMapping(params = "action=returnNewTemplate")
	public ModelAndView returnNewEntityTemplate(RenderRequest request) 
	{

		EntityTemplate template = (EntityTemplate)request.getAttribute("newTemplate");
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("success", Boolean.TRUE);
		data.put("template", template);

		return new ModelAndView(jsonView, data);

	}

	@ActionMapping(params = "action=doEntityTemplateDestroy")
	public void destroyEntityTemplate(ActionRequest request, ActionResponse response) 
	{
		
	    ObjectMapper mapper = new ObjectMapper();
	    AnnotationIntrospector primary = new JaxbAnnotationIntrospector( TypeFactory.defaultInstance() );
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
				
		EntityTemplate readValue = null;
		try {
			readValue = mapper.readValue(strm, EntityTemplate.class);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		

		/*Properties props = System.getProperties();
		props.put("http.proxyHost", "localhost");
		props.put("http.proxyPort", "8888");*/
		
		RestTemplate tmpl = new RestTemplate();
		
		tmpl.setRequestFactory(new HttpComponentsClientHttpRequestFactory() {
	        @Override
	        protected HttpUriRequest createHttpUriRequest(HttpMethod httpMethod, URI uri) {
	            if (HttpMethod.DELETE == httpMethod) {
	                return new HttpEntityEnclosingDeleteRequest(uri);
	            }
	            return super.createHttpUriRequest(httpMethod, uri);
	        }
	    });


		String url = "http://localhost:8080/EetdbServices/template";

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        HttpEntity<EntityTemplate> entity = new HttpEntity<EntityTemplate>(readValue, headers);
        ResponseEntity<String> responseWrapper = tmpl.exchange(url, HttpMethod.DELETE, entity, String.class);
        //EntityTemplate resp = responseWrapper.getBody();
        
		
		response.setRenderParameter("action", "reportDestroy");

	}
	
	@RenderMapping(params = "action=reportDestroy")
	public ModelAndView reportDestroy(RenderRequest request) 
	{

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("success", Boolean.TRUE);
		data.put("template", null);

		return new ModelAndView(jsonView, data);

	}
	
}
