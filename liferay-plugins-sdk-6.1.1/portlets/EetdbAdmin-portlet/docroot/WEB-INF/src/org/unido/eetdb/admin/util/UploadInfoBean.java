package org.unido.eetdb.admin.util;

public class UploadInfoBean {
	private long totalSize = 0;
	private long bytesRead = -1;
	private int percentage = 0;
    private double averageSpeed = 0;
    private double prevSpeed = 0;
    private double currentSpeed = 0;
    private long secondsLeft = -1;

	public int getPercentage() {
		return percentage;
	}

	public void setPercentage(int percentage) {
		this.percentage = percentage;
	}

	public long getTotalSize() {
		return totalSize;
	}

	public void setTotalSize(long totalSize) {
		this.totalSize = totalSize;
	}

	public long getBytesRead() {
		return bytesRead;
	}

	public void setBytesRead(long bytesRead) {
		this.bytesRead = bytesRead;
	}

	public double getCurrentSpeed() {
		return currentSpeed;
	}

	public void setCurrentSpeed(double currentSpeed) {
		this.currentSpeed = currentSpeed;
	}

	public double getAverageSpeed() {
		return averageSpeed;
	}

	public void setAverageSpeed(double averageSpeed) {
		this.averageSpeed = averageSpeed;
	}
	
	public double getPrevSpeed() {
		return prevSpeed;
	}

	public void setPrevSpeed(double prevSpeed) {
		this.prevSpeed = prevSpeed;
	}

	public long getSecondsLeft() {
		return secondsLeft;
	}

	public void setSecondsLeft(long secondsLeft) {
		this.secondsLeft = secondsLeft;
	}

}