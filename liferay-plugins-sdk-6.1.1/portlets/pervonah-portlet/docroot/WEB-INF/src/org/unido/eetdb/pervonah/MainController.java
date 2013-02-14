package org.unido.eetdb.pervonah;

import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.AnnotationIntrospector;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.xc.JaxbAnnotationIntrospector;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;
import org.springframework.web.servlet.View;
import org.unido.eetdb.pervonah.model.pervoClass;

@Controller
@RequestMapping("view")
public class MainController {

	@Autowired
	@Qualifier("jsonview")
	private View jsonView;

	@RenderMapping
	public String setModelAndView() {
		return "page1";
	}

	@RenderMapping(params = "action=showPage2")
	public String showPage2() {
		return "page2";
	}

	@ActionMapping(params = "action=doAction")
	public void doAction(ActionResponse response) {

		System.out.println("Congratulations, you just did something.");

		response.setRenderParameter("action", "showPage2");

	}

	@ActionMapping(params = "action=doSimpleForm")
	public void changePreferences(@RequestParam String first,
			@RequestParam String last, @RequestParam String company,
			@RequestParam String email,
			@RequestParam(required = false) String time,
			ActionRequest actionRequest) {

		System.out.println(first);

	}

	@RenderMapping(params = "action=doAjaxLoad")
	public ModelAndView createBlankContactJson(pervoClass myClass) {

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("success", Boolean.TRUE);
		data.put("data", new pervoClass("first", "last", "company", "email",
				new Date()));

		return new ModelAndView(jsonView, data);

	}

	@ResourceMapping(value = "doAjaxPost")
	public void uselessFuncName(ResourceRequest request,
			ResourceResponse response) {

		System.out.println("got here");

		ObjectMapper mapper = new ObjectMapper();
		AnnotationIntrospector introspector = new JaxbAnnotationIntrospector();
		mapper.getDeserializationConfig().withAnnotationIntrospector(introspector);
		mapper.getSerializationConfig().withAnnotationIntrospector(introspector);

		DateFormat df = new SimpleDateFormat("m d y");
		mapper.setDateFormat(df);
		
		InputStream strm = null;
		try {
			strm = request.getPortletInputStream();
		} catch (IOException e) {
			e.printStackTrace();
		}
				
		pervoClass readValue = null;
		try {
			readValue = mapper.readValue(strm, pervoClass.class);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("success", Boolean.TRUE);
		data.put("data", new pervoClass("first", "last", "company", "email",
				new Date()));

		// return new ModelAndView(jsonView, data);

	}

}
