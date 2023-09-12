package com.demo.board.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ReviewDto {

	private int rno;
	private int mno;
	private int pno;
	private String title;
	private String content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date creDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date modDate;
	
	public ReviewDto() {
		super();
	}

	public ReviewDto(int rno, int mno, int pno, String title, String content, Date creDate, Date modDate) {
		super();
		this.rno = rno;
		this.mno = mno;
		this.pno = pno;
		this.title = title;
		this.content = content;
		this.creDate = creDate;
		this.modDate = modDate;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
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

	public Date getModDate() {
		return modDate;
	}

	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}

	@Override
	public String toString() {
		return "ReviewDto [rno=" + rno + ", mno=" + mno + ", pno=" + pno + ", title=" + title + ", content=" + content
				+ ", creDate=" + creDate + ", modDate=" + modDate + "]";
	}

	


	
	
	
}
