package org.unido.eetdb;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.portlet.PortletException;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.springframework.http.HttpMethod;
import org.springframework.http.client.ClientHttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RequestCallback;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;
import org.unido.eetdb.common.model.ValueBlob;
import org.unido.eetdb.util.BlobResponseExtractor;
import org.unido.eetdb.util.ConfigWrapper;

import com.liferay.portal.kernel.servlet.HttpHeaders;

@Controller
@RequestMapping("view")
public class BlobController 
{

	@ResourceMapping(value = "showBoob")
	public void serveResource(@RequestParam long blobId, ResourceRequest request, ResourceResponse response) 
			throws PortletException, IOException 
	{
		
		
		if (ConfigWrapper.useFiddlerProxy(request))
		{
			
			Properties props = System.getProperties();
			props.put("http.proxyHost", "localhost");
			props.put("http.proxyPort", "8888");
			 
		}
		RestTemplate tmpl = new RestTemplate();
		
		ValueBlob blob = tmpl.getForObject(
				ConfigWrapper.getServUrl(request) + "/blob-meta/{id}",
				ValueBlob.class, blobId);
		
		boolean isInternetExplorer = false;// (userAgent.indexOf("MSIE") > -1);
		String fileName = blob.getName();
		
		try {
		    byte[] fileNameBytes = fileName.getBytes((isInternetExplorer) ? ("windows-1250") : ("utf-8"));
		    String dispositionFileName = "";
		    for (byte b: fileNameBytes) dispositionFileName += (char)(b & 0xff);

			response.addProperty( HttpHeaders.CONTENT_DISPOSITION, "attachment; file-name=\"" + dispositionFileName +"\";");  
		} catch(UnsupportedEncodingException ence) {
		    // ... handle exception ...
		}
		
		response.setContentType(blob.getMimeType()); 
		response.addProperty( HttpHeaders.CACHE_CONTROL, "max-age=3600, must-revalidate");  
		
		tmpl.execute(
					ConfigWrapper.getServUrl(request) + "/blob/"+ blobId, 
					HttpMethod.GET, 
					ACCEPT_CALLBACK, 
					new BlobResponseExtractor(response.getPortletOutputStream()));
		

	}

	private static final RequestCallback ACCEPT_CALLBACK = 
		    new RequestCallback() 
		    {
		        @Override
		        public void doWithRequest ( ClientHttpRequest request ) throws IOException
		        {
		            request.getHeaders().set( "Accept", "application/json" );
		        }

		    };
}


