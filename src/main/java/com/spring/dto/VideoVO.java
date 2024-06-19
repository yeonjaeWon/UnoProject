package com.spring.dto;

import java.util.Date;

public class VideoVO {
	private int vno;
	private String v_title;
	private String pathupload;
	private String filetype;
	private Date regDate;
	private int dno;
	private String d_label;
	
	
	public int getVno() {
		return vno;
	}
	public void setVno(int vno) {
		this.vno = vno;
	}
	public String getV_title() {
		return v_title;
	}
	public void setV_title(String v_title) {
		this.v_title = v_title;
	}
	public String getPathupload() {
		return pathupload;
	}
	public void setPathupload(String pathupload) {
		this.pathupload = pathupload;
	}
	public String getFiletype() {
		return filetype;
	}
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
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
	
}
