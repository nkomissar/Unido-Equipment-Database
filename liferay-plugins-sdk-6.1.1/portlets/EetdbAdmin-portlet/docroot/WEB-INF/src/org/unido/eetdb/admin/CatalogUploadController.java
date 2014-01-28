package org.unido.eetdb.admin;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.portlet.RenderRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.servlet.View;
import org.unido.eetdb.admin.util.ConfigWrapper;
import org.unido.eetdb.common.model.UploadError;
import org.unido.eetdb.common.model.UploadItem;

@Controller
@RequestMapping("view")
public class CatalogUploadController 
{
	@Autowired
	@Qualifier("jsonview")
	private View jsonView;

	@RenderMapping(params = "action=getUploadQueue")
	public ModelAndView getUploadQueue(RenderRequest renderRequest) 
	{
 
		if (ConfigWrapper.useFiddlerProxy(renderRequest))
		{
			
			Properties props = System.getProperties();
			props.put("http.proxyHost", "localhost"); 
			props.put("http.proxyPort", "8888");
			 
		}
		
		RestTemplate tmpl = new RestTemplate();
		
		UploadItem[] uploadItems = tmpl.getForObject(
					ConfigWrapper.getServUrl(renderRequest) + "/uploadItems", 
					UploadItem[].class);
		
		/*
		@SuppressWarnings("unchecked")
		Map<String, String>[] uploadItems = (Map<String, String>[]) new Map[3];
		
		Map<String, String> uploadItem = new HashMap<String, String>();
		uploadItem.put("id", "1");
		uploadItem.put("shortName", "First Upload");
		uploadItem.put("fileSize", "25");
		uploadItem.put("fileCls", "JPEG");
		
		uploadItems[0] = uploadItem;

		Map<String, String> uploadItem2 = new HashMap<String, String>();
		uploadItem2.put("id", "2");
		uploadItem2.put("shortName", "Second Upload");
		uploadItem2.put("fileSize", "25");
		uploadItem2.put("fileCls", "JPEG");
		
		uploadItems[1] = uploadItem2;

		Map<String, String> uploadItem3 = new HashMap<String, String>();
		uploadItem3.put("id", "3");
		uploadItem3.put("shortName", "Third Upload");
		uploadItem3.put("fileSize", "25");
		uploadItem3.put("fileCls", "JPEG");
		
		uploadItems[2] = uploadItem3;
		*/
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("success", Boolean.TRUE);
		data.put("uploadQueue", uploadItems);

		return new ModelAndView(jsonView, data);

	}
	
	@RenderMapping(params = "action=getUploadItemDetails")
	public ModelAndView getUploadItemDetails(
			@RequestParam long uploadItemId,
			RenderRequest renderRequest) 
	{
 
		if (ConfigWrapper.useFiddlerProxy(renderRequest))
		{
			
			Properties props = System.getProperties();
			props.put("http.proxyHost", "localhost"); 
			props.put("http.proxyPort", "8888");
			 
		}
		
		RestTemplate tmpl = new RestTemplate();
		
		UploadItem uploadItem = tmpl.getForObject(
					ConfigWrapper.getServUrl(renderRequest) + "/uploadItems/{uploadItemId}", 
					UploadItem.class, uploadItemId);
		
		/*Map<String, String> uploadItem = new HashMap<String, String>();
		uploadItem.put("id", Long.toString(uploadItemId));
		uploadItem.put("fileName", "Upload #" + uploadItemId);
		uploadItem.put("fileSize", "a25");
		uploadItem.put("fileCls", "JPEG");*/

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("success", Boolean.TRUE);
		data.put("uploadItem", uploadItem);

		return new ModelAndView(jsonView, data);

	}
	
	@RenderMapping(params = "action=getUploadItemErrors")
	public ModelAndView getUploadItemErrors(
			@RequestParam long uploadItemId,
			RenderRequest renderRequest) 
	{
 
		if (ConfigWrapper.useFiddlerProxy(renderRequest))
		{
			
			Properties props = System.getProperties();
			props.put("http.proxyHost", "localhost"); 
			props.put("http.proxyPort", "8888");
			 
		}
		
		RestTemplate tmpl = new RestTemplate();
		
		UploadError[] uploadErrors = tmpl.getForObject(
					ConfigWrapper.getServUrl(renderRequest) + "/uploadItems/{uploadItemId}/uploadErrors", 
					UploadError[].class, uploadItemId);
		
		/*Map<String, String> uploadItem = new HashMap<String, String>();
		uploadItem.put("id", Long.toString(uploadItemId));
		uploadItem.put("fileName", "Upload #" + uploadItemId);
		uploadItem.put("fileSize", "a25");
		uploadItem.put("fileCls", "JPEG");*/

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("success", Boolean.TRUE);
		data.put("uploadErrors", uploadErrors);

		return new ModelAndView(jsonView, data);

	}

}
