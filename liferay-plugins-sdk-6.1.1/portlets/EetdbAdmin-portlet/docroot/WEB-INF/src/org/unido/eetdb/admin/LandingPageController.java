package org.unido.eetdb.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.servlet.View;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
@RequestMapping("view")
public class LandingPageController 
{

	@Autowired
	@Qualifier("jsonview")
	private View jsonView;
	
	@RenderMapping
	public String showLandingPage()
	{
		return "landingpage";
	}
	
   @ModelAttribute("springFileVO")
    public SpringFileVO getCommandObject() 
    {
        System.out.println("SpringFileController -> getCommandObject -> Building VO");
        return new SpringFileVO();
    }
}
