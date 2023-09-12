package com.demo.board.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ReplyDto {

	private int ino;
	private int mno;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date creDate;
	private String name;
	private String title;
	private String content;
	
	public ReplyDto() {
		super();
	}

	public ReplyDto(int ino, int mno, Date creDate, String name, String title, String content) {
		super();
		this.ino = ino;
		this.mno = mno;
		this.creDate = creDate;
		this.name = name;
		this.title = title;
		this.content = content;
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

	public Date getCreDate() {
		return creDate;
	}

	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	@Override
	public String toString() {
		return "ReplyDto [ino=" + ino + ", mno=" + mno + ", creDate=" + creDate + ", name=" + name + ", title=" + title
				+ ", content=" + content + "]";
	}

	
	
	
}
