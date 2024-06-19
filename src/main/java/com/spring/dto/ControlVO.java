package com.spring.dto;

import java.util.Date;

public class ControlVO {
	private int dno;
	private String d_label;
	private String d_status;
	private Date d_time;
	private String id;
	
	
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	public String getD_label() {
		return d_label;
	}
	public void setD_label(String d_label) {
		this.d_label = d_label;
	}
	public String getD_status() {
		return d_status;
	}
	public void setD_status(String d_status) {
		this.d_status = d_status;
	}
	public Date getD_time() {
		return d_time;
	}
	public void setD_time(Date d_time) {
		this.d_time = d_time;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
