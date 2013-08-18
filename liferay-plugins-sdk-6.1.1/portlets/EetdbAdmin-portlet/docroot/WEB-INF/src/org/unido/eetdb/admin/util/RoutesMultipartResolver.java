package org.unido.eetdb.admin.util;

import java.util.List;

import javax.portlet.ActionRequest;
import javax.portlet.PortletSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.portlet.PortletFileUpload;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.portlet.multipart.CommonsPortletMultipartResolver;
import org.springframework.web.portlet.multipart.DefaultMultipartActionRequest;
import org.springframework.web.portlet.multipart.MultipartActionRequest;

public class RoutesMultipartResolver extends CommonsPortletMultipartResolver {

	private ProgressListener progressListener;

	public void setProgressListener(ProgressListener progressListener) {
		this.progressListener = progressListener;
	}

	public MultipartActionRequest resolveMultipart(
			ActionRequest request) throws MultipartException {
		
		String pid = request.getParameter("pid");
		
		String encoding = determineEncoding(request);
		FileUpload fileUpload = prepareFileUpload(encoding);
		
		RoutesProgressListener listener = new RoutesProgressListener();
		PortletSession session = request.getPortletSession();
		
		session.setAttribute("listener" + pid, listener);
		
		if (progressListener != null) {
			//fileUpload.setProgressListener(progressListener);
			fileUpload.setProgressListener(listener);
		}
		try {
			List<FileItem> fileItems = ((PortletFileUpload) fileUpload)
					.parseRequest(request);
			MultipartParsingResult parsingResult = parseFileItems(fileItems,
					encoding);
			return new DefaultMultipartActionRequest(request,
					parsingResult.getMultipartFiles(),
					parsingResult.getMultipartParameters(),
					parsingResult.getMultipartParameterContentTypes());
		} catch (FileUploadBase.SizeLimitExceededException ex) {
			throw new MaxUploadSizeExceededException(fileUpload.getSizeMax(),
					ex);
		} catch (FileUploadException ex) {
			throw new MultipartException(
					"Could not parse multipart servlet request", ex);
		}
	}
}