package org.unido.eetdb.pervonah.model;

import java.io.Serializable;
import java.util.Date;

public class pervoClass implements Serializable
{

	private static final long serialVersionUID = 1L;
	
	private String first;
	
	private String last;
	
	private String company;
	
	private String email;
	
	private Date time;

	public String getFirst() {
		return first;
	}

	public void setFirst(String first) {
		this.first = first;
	}

	public String getLast() {
		return last;
	}

	public void setLast(String last) {
		this.last = last;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}
	
	public pervoClass() {}
	
	public pervoClass(String first, String last, String company, String email,
			Date time) {
		super();
		this.first = first;
		this.last = last;
		this.company = company;
		this.email = email;
		this.time = time;
	}
	
	
	
	
}
