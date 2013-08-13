package org.unido.eetdb.admin;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
@RequestMapping("view")
public class BlobController {
    
	
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
}
