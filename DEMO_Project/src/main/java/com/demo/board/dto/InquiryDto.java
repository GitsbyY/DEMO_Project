package com.demo.board.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class InquiryDto {

	private int ino;
	private int mno;
	private String type;
	private String name;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date creDate;
	private String title;
	private String content;
	private char is_Reply;
	
	public InquiryDto() {
		super();
	}

	public InquiryDto(int ino, int mno, String type, String name, Date creDate, String title, String content,
			char is_Reply) {
		super();
		this.ino = ino;
		this.mno = mno;
		this.type = type;
		this.name = name;
		this.creDate = creDate;
		this.title = title;
		this.content = content;
		this.is_Reply = is_Reply;
	}

	public int getIno() {
		return ino;
	}

	public void setIno(int ino) {
		this.ino = ino;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getCreDate() {
		return creDate;
	}

	public void setCreDate(Date creDate) {
		this.creDate = creDate;
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

	public char getIs_Reply() {
		return is_Reply;
	}

	public void setIs_Reply(char is_Reply) {
		this.is_Reply = is_Reply;
	}

	@Override
	public String toString() {
		return "InquiryDto [ino=" + ino + ", mno=" + mno + ", type=" + type + ", name=" + name + ", creDate=" + creDate
				+ ", title=" + title + ", content=" + content + ", is_Reply=" + is_Reply + "]";
	}


	
	
	
}
