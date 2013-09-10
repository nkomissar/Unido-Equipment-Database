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
	final long startTime = System.currentTimeMillis();

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

	public UploadInfoBean getStatus() {
		// per looks like 0% - 100%, remove % before submission
		uploadInfoBean.setTotalSize(fileSize / 1024);
		uploadInfoBean.setBytesRead(totalBytesRead / 1024);
		String per = NumberFormat.getPercentInstance().format(
				(double) bytesTransferred / (double) fileSize);
		uploadInfoBean.setPercentage(Integer.parseInt(per.substring(0,
				per.length() - 1)));

		long currentTime = System.currentTimeMillis();
        double seconds = (((double)(currentTime - startTime)) / ((double)1000.0));
        long speed = (long)(((double)totalBytesRead) / ((double)seconds));
        
        double averageSpeed = uploadInfoBean.getAverageSpeed();
        double prevSpeed = uploadInfoBean.getPrevSpeed();
        
        averageSpeed = (((double)(averageSpeed + speed)) / 2.0);
        if (prevSpeed != averageSpeed)
        {
            prevSpeed = averageSpeed;
        }
        
        uploadInfoBean.setAverageSpeed(averageSpeed);
        uploadInfoBean.setPrevSpeed(prevSpeed);
        uploadInfoBean.setCurrentSpeed(speed);
        
        uploadInfoBean.setSecondsLeft((fileSize - totalBytesRead) / speed);
		
		return uploadInfoBean;
	}

	// function called by multipartResolver to notify the change of the upload
	// status
	public void update(long bytesRead, long contentLength, int items) {
		// update bytesTransferred and fileSize (if required) every 5 KB is read
 		long fiveKB = bytesRead / 5120;
 		
 		try 
 		{
 		    Thread.sleep(10);
 		} 
 		catch(InterruptedException ex) 
 		{
 		    Thread.currentThread().interrupt();
 		}
 		
		totalBytesRead = bytesRead;
		if (fiveKBRead == fiveKB) 
		{
			return;
		}

		fiveKBRead = fiveKB;
		bytesTransferred = bytesRead;
		if (fileSize != contentLength) {
			fileSize = contentLength;
		}
	}
}
