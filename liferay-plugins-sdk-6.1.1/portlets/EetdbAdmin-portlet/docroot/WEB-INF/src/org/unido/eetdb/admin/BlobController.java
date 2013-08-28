package org.unido.eetdb.admin;

import java.util.HashMap;
import java.util.Map;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.RenderRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.servlet.View;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.unido.eetdb.admin.util.RoutesProgressListener;
import org.unido.eetdb.admin.util.UploadInfoBean;
import org.unido.eetdb.common.model.Entity;

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
    public void fileUpload(@RequestParam String pid, @ModelAttribute SpringFileVO springFileVO, BindingResult bindingResult,
            ActionRequest request, ActionResponse response, SessionStatus sessionStatus){
        System.out.println("SpringFileController -> fileUpload -> Started");
         
        System.out.println("File Name :"+springFileVO.getFileData().getOriginalFilename());
        System.out.println("File Type :"+springFileVO.getFileData().getContentType());
        System.out.println("Pid :"+pid);
         
        //File data processing logic here 
        springFileVO.setMessage(springFileVO.getFileData().getOriginalFilename() +" is upload successfully");
         
        System.out.println("SpringFileController -> FileUpload -> Completed");
        //sessionStatus.setComplete();
		
        response.setRenderParameter("action", "uploadResult");
        response.setRenderParameter("pid", pid);

	}

	@RenderMapping(params = "action=uploadResult")
	public String renderUploadResult(@RequestParam long pid, ModelMap model, RenderRequest request) {

		//Map<String, Object> data = new HashMap<String, Object>();
		//data.put("success", Boolean.TRUE);
        System.out.println("Render Pid :"+pid);
	
		
		model.addAttribute("success", Boolean.TRUE);
		model.addAttribute("pid", pid);


		return "uploadresult";

	}
	
	
	
	@RenderMapping(params="action=getProgress")
	public ModelAndView getProgress(@RequestParam long pid, RenderRequest request)
	{
		Map<String, Object> data = new HashMap<String, Object>();

		RoutesProgressListener xpl = (RoutesProgressListener) request.getPortletSession().getAttribute("listener" + pid);

		if (xpl == null)
		{
			data.put("success", Boolean.TRUE);
		} 
		else
		{
		    UploadInfoBean status = xpl.getStatus();
		    /*if (xpl.) {
		        request.getSession().removeAttribute("ProgressListener_" + key);
		    }*/
		     
			data.put("success", Boolean.TRUE);
			data.put("bytes_total", status.getTotalSize());
			data.put("bytes_uploaded", status.getBytesRead());
			data.put("pct_complete", status.getPercentage());
			data.put("progress_id", pid);
			data.put("speed_now", "1");
			data.put("time_left", "10");
		}

		return new ModelAndView(jsonView, data);
	    
	}
}
