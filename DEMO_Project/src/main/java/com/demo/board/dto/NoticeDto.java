package com.demo.board.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class NoticeDto {

	private int nno;
	private int mno;
	private String title;
	private String content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date creDate;
	
	public NoticeDto() {
		super();
	}

	public NoticeDto(int nno, int mno, String title, String content, Date creDate) {
		super();
		this.nno = nno;
		this.mno = mno;
		this.title = title;
		this.content = content;
		this.creDate = creDate;
	}

	public int getNno() {
		return nno;
	}

	public void setNno(int nno) {
		this.nno = nno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreDate() {
		return creDate;
	}

	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}

	@Override
	public String toString() {
		return "NoticeDto [nno=" + nno + ", mno=" + mno + ", title=" + title + ", content=" + content + ", creDate="
				+ creDate + "]";
	}


	
	
}
