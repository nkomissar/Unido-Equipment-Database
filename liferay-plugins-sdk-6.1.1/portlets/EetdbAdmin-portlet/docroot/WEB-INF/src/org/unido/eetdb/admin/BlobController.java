package org.unido.eetdb.admin;

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
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.servlet.View;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.client.RestTemplate;
import org.unido.eetdb.admin.util.ConfigWrapper;
import org.unido.eetdb.admin.util.RoutesProgressListener;
import org.unido.eetdb.admin.util.UploadInfoBean;
import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.ValueBlob;

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
    public void fileUpload(
    				@RequestParam String pid, 
    				@ModelAttribute SpringFileVO springFileVO, 
    				BindingResult bindingResult,
    				ActionRequest request, 
    				ActionResponse response)
	{

		System.out.println("SpringFileController -> fileUpload -> Started");
         
        System.out.println("File Name :"+springFileVO.getFileData().getOriginalFilename());
        System.out.println("File Type :"+springFileVO.getFileData().getContentType());
        System.out.println("Pid :"+pid);
         
        //File data processing logic here 
        springFileVO.setMessage(springFileVO.getFileData().getOriginalFilename() +" is upload successfully");
         
        System.out.println("SpringFileController -> FileUpload -> Completed");
        //sessionStatus.setComplete();
        
        CommonsMultipartFile fileData = springFileVO.getFileData();
        
        
        ValueBlob valueBlob = new ValueBlob();
        valueBlob.setMimeType(fileData.getContentType());
        valueBlob.setName(fileData.getOriginalFilename());
        
		if (ConfigWrapper.useFiddlerProxy(request))
		{
			
			Properties props = System.getProperties();
			props.put("http.proxyHost", "localhost"); 
			props.put("http.proxyPort", "8888");
			 
		}

        RestTemplate tmpl = new RestTemplate();
		String url = ConfigWrapper.getServUrl(request) + "/blob";

		
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		HttpEntity<ValueBlob> hEntity = 
						new HttpEntity<ValueBlob>(new ValueBlob(), headers);
		
		ResponseEntity<String> responseWrapper = 
						tmpl.exchange(url, HttpMethod.POST, hEntity, String.class);
		
		String resp = responseWrapper.getBody();
        
        
        
		
        response.setRenderParameter("action", "uploadResult");
        response.setRenderParameter("pid", pid);
        response.setRenderParameter("success", Boolean.TRUE.toString());

	}

	@RenderMapping(params = "action=uploadResult")
	public String renderUploadResult(
				@RequestParam long pid,
				@RequestParam Boolean success, 
				ModelMap model, 
				RenderRequest request) 
	{


		System.out.println("Render Pid :"+pid);
		
		model.addAttribute("success", success);
		model.addAttribute("pid", pid);

		return "uploadresult";

	}
	
	
	
	@RenderMapping(params="action=getProgress")
	public ModelAndView getProgress(@RequestParam long pid, RenderRequest request)
	{
		Map<String, Object> data = new HashMap<String, Object>();

		RoutesProgressListener xpl = (RoutesProgressListener) request
											.getPortletSession()
											.getAttribute("listener" + pid);

		if (xpl == null)
		{
			data.put("success", Boolean.TRUE);
			data.put("bytes_total", 0);
			data.put("bytes_uploaded", 0);
			data.put("pct_complete", 0);
			data.put("progress_id", pid);
			data.put("speed_now", "0");
			data.put("time_left", "N/A");
		} 
		else
		{
			
		    UploadInfoBean status = xpl.getStatus();
		     
			data.put("success", Boolean.TRUE);
			data.put("bytes_total", status.getTotalSize());
			data.put("bytes_uploaded", status.getBytesRead());
			data.put("pct_complete", status.getPercentage());
			data.put("progress_id", pid);
			data.put("speed_now", status.getCurrentSpeed());
			data.put("speed_avg", status.getAverageSpeed());
			data.put("time_left", status.getSecondsLeft());
		}

		return new ModelAndView(jsonView, data);
	    
	}
}
