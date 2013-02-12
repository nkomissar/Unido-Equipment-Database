package org.unido.eetdb.pervonah;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
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
	public ModelAndView createBlankContactJson() 
	{
	
		return new ModelAndView(jsonView, "response", new pervoClass("first",
				"last", "company", "email", new Date()));
		
	}

	public @ResponseBody
	Map<String, ? extends Object> load(pervoClass myClass) {

		pervoClass pc = new pervoClass("first", "last", "company", "email",
				new Date());
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("success", Boolean.TRUE);
		data.put("data", pc);

		return data;
	}

	@ActionMapping(params = "action=doAjax")
	public @ResponseBody
	Map<String, ? extends Object> uselessFuncName(pervoClass myClass,
			ActionRequest actionRequest) {

		System.out.println("got here");

		return null;

	}

}
