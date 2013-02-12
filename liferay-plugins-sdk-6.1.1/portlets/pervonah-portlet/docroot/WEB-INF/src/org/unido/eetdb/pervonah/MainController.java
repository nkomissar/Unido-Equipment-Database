package org.unido.eetdb.pervonah;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

@Controller
@RequestMapping("view")
public class MainController {

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
	public void changePreferences(
			@RequestParam String first,
			@RequestParam String last,
			@RequestParam String company,
			@RequestParam String email,
			@RequestParam(required = false) String time,
			ActionRequest actionRequest) 
	{
	
		System.out.println(first);
		
	}

}
