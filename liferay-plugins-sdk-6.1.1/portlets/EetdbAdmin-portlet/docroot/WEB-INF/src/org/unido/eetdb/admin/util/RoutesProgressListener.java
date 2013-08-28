package org.unido.eetdb.admin.util;

import java.text.NumberFormat;
import org.apache.commons.fileupload.ProgressListener;

public class RoutesProgressListener implements ProgressListener {

	private long bytesTransferred = 0;
	private long fileSize = -100;
	private long totalBytesRead = 0;
	private long fiveKBRead = -1;
	private UploadInfoBean uploadInfoBean = null;
	private String pId;

	public RoutesProgressListener() {
		uploadInfoBean = new UploadInfoBean();
	}
	
	public void setPid(String pid)
	{
		pId = pid;
	}
	public String getPid()
	{
		return pId;
	}

	// function called from javascript to retrieve the status of the upload
	public UploadInfoBean getStatus() {
		// per looks like 0% - 100%, remove % before submission
		uploadInfoBean.setTotalSize(fileSize / 1024);
		uploadInfoBean.setBytesRead(totalBytesRead / 1024);
		String per = NumberFormat.getPercentInstance().format(
				(double) bytesTransferred / (double) fileSize);
		uploadInfoBean.setPercentage(Integer.parseInt(per.substring(0,
				per.length() - 1)));
		return uploadInfoBean;
	}

	// function called by multipartResolver to notify the change of the upload
	// status
	public void update(long bytesRead, long contentLength, int items) {
		// update bytesTransferred and fileSize (if required) every 5 KB is read
 		long fiveKB = bytesRead / 5120;
        //System.out.println("Got bytes for pid :"+pId + " bytesRead:" + bytesRead);
 		
 		try {
 		    Thread.sleep(100);
 		} catch(InterruptedException ex) {
 		    Thread.currentThread().interrupt();
 		}
 		
		totalBytesRead = bytesRead;
		if (fiveKBRead == fiveKB) {
			return;
		}
        System.out.println("Got segment for pid :"+pId + " segments:" + fiveKB);

		fiveKBRead = fiveKB;
		bytesTransferred = bytesRead;
		if (fileSize != contentLength) {
			fileSize = contentLength;
		}
	}
}
