package org.unido.eetdb.admin;

import java.util.HashMap;
import java.util.Map;

import javax.portlet.RenderRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.servlet.View;
import org.unido.eetdb.admin.util.ConfigWrapper;
import org.unido.eetdb.common.model.ValueType;

@Controller
@RequestMapping("view")
public class ValueTypeController {
	
	@Autowired
	@Qualifier("jsonview")
	private View jsonView;

	@RenderMapping(params = "action=doValueTypeList")
	public ModelAndView loadEntityTemplateList(RenderRequest renderRequest) {

		RestTemplate tmpl = new RestTemplate();

		ValueType[] vtypes = tmpl.getForObject(
				ConfigWrapper.getServUrl(renderRequest) + "/value-types",
				ValueType[].class);
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("success", Boolean.TRUE);
		data.put("data", vtypes);

		return new ModelAndView(jsonView, data);

	}

}
