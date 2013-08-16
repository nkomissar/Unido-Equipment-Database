package org.unido.eetdb.admin.util;

import java.text.NumberFormat;
import org.apache.commons.fileupload.ProgressListener;

public class RoutesProgressListener implements ProgressListener {

	private static long bytesTransferred = 0;
	private static long fileSize = -100;
	private long totalBytesRead = 0;
	private long fiveKBRead = -1;
	private UploadInfoBean uploadInfoBean = null;

	public RoutesProgressListener() {
		uploadInfoBean = new UploadInfoBean();
	}

	// function called from javascript to retrive the status of the upload
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
		totalBytesRead = bytesRead;
		if (fiveKBRead == fiveKB) {
			return;
		}
		fiveKBRead = fiveKB;
		bytesTransferred = bytesRead;
		if (fileSize != contentLength) {
			fileSize = contentLength;
		}
	}
}
