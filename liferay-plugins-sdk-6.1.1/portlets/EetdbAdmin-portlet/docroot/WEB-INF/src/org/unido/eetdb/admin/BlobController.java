package org.unido.eetdb.admin;

import java.util.HashMap;
import java.util.Map;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.servlet.View;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.unido.eetdb.admin.util.RoutesProgressListener;
import org.unido.eetdb.admin.util.UploadInfoBean;

@Controller
@RequestMapping("view")
public class BlobController {
    
	@Autowired
	@Qualifier("jsonview")
	private View jsonView;
	
    @ModelAttribute("springFileVO")
    public SpringFileVO getCommandObject() 
    {
        System.out.println("SpringFileController -> getCommandObject -> Building VO");
        return new SpringFileVO();
    }
    
	@ActionMapping(params="formAction=fileUpload")
    public void fileUpload(@ModelAttribute SpringFileVO springFileVO, BindingResult bindingResult,
            ActionRequest request, ActionResponse response, SessionStatus sessionStatus){
        System.out.println("SpringFileController -> fileUpload -> Started");
         
        System.out.println("File Name :"+springFileVO.getFileData().getOriginalFilename());
        System.out.println("File Type :"+springFileVO.getFileData().getContentType());
         
        //File data processing logic here 
        springFileVO.setMessage(springFileVO.getFileData().getOriginalFilename() +" is upload successfully");
         
        System.out.println("SpringFileController -> FileUpload -> Completed");
        sessionStatus.setComplete();
    }
	
	@ActionMapping(params="formAction=getProgress")
	public ModelAndView getProgress(String pid, ActionRequest request)
	{
	    RoutesProgressListener xpl = (RoutesProgressListener) request.getPortletSession().getAttribute("listener" + pid);
	    UploadInfoBean status = xpl.getStatus();
	    /*if (xpl.) {
	        request.getSession().removeAttribute("ProgressListener_" + key);
	    }*/
	    
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("success", Boolean.TRUE);
		data.put("pct", status.getPercentage());

		return new ModelAndView(jsonView, data);
	    
	}
}
