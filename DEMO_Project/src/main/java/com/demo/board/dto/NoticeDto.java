package com.demo.board.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class NoticeDto {

	private int noticeNo;
	private int memberNo;
	private String noticeTitle;
	private String noticeContent;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date noticeCreDate;
	
	public NoticeDto() {
		super();
	}

	public NoticeDto(int noticeNo, int memberNo, String noticeTitle, String noticeContent, Date noticeCreDate) {
		super();
		this.noticeNo = noticeNo;
		this.memberNo = memberNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeCreDate = noticeCreDate;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getNoticeCreDate() {
		return noticeCreDate;
	}

	public void setNoticeCreDate(Date noticeCreDate) {
		this.noticeCreDate = noticeCreDate;
	}

	@Override
	public String toString() {
		return "NoticeDto [noticeNo=" + noticeNo + ", memberNo=" + memberNo + ", noticeTitle=" + noticeTitle
				+ ", noticeContent=" + noticeContent + ", noticeCreDate=" + noticeCreDate + "]";
	}

	


	
	
}
