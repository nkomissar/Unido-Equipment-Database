package org.unido.eetdb.common.model;

public class UploadError extends GenericObject 
{
	private long     rowNumber;
	private String   message;
	private UploadItem uploadItem;
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	public long getRowNumber() {
		return rowNumber;
	}
	public void setRowNumber(long rowNumber) {
		this.rowNumber = rowNumber;
	}
	
	public UploadItem getUploadItem() {
		return uploadItem;
	}
	public void setUploadItem(UploadItem uploadItem) {
		this.uploadItem = uploadItem;
	}
	
	
}
