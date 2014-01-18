package org.unido.eetdb.common.model;

public class UploadItem extends GenericObject 
{
    private String      fileName;
    private String      filePath;
    private long        fileSize;
    private String      status;
    
	public String getFileName() 
	{
		return fileName;
	}
	
	public void setFileName(String fileName) 
	{
		this.fileName = fileName;
	}
	
	public String getFilePath() 
	{
		return filePath;
	}
	
	public void setFilePath(String filePath) 
	{
		this.filePath = filePath;
	}
	
	public long getFileSize() 
	{
		return fileSize;
	}
	
	public void setFileSize(long fileSize) 
	{
		this.fileSize = fileSize;
	}
	
	public String getStatus() 
	{
		return status;
	}
	
	public void setStatus(String status) 
	{
		this.status = status;
	}
}
