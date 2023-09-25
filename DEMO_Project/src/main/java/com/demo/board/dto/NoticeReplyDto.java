package com.demo.board.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class NoticeReplyDto {

	private int noticeReplyNo;
	private int noticeNo;
	private int memberNo;
	private String noticeReplyContent;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date noticeReplyCreDate;
	
	public NoticeReplyDto() {
		super();
	}

	public NoticeReplyDto(int noticeReplyNo, int noticeNo, int memberNo, String noticeReplyContent,
			Date noticeReplyCreDate) {
		super();
		this.noticeReplyNo = noticeReplyNo;
		this.noticeNo = noticeNo;
		this.memberNo = memberNo;
		this.noticeReplyContent = noticeReplyContent;
		this.noticeReplyCreDate = noticeReplyCreDate;
	}

	public int getNoticeReplyNo() {
		return noticeReplyNo;
	}

	public void setNoticeReplyNo(int noticeReplyNo) {
		this.noticeReplyNo = noticeReplyNo;
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

	public String getNoticeReplyContent() {
		return noticeReplyContent;
	}

	public void setNoticeReplyContent(String noticeReplyContent) {
		this.noticeReplyContent = noticeReplyContent;
	}

	public Date getNoticeReplyCreDate() {
		return noticeReplyCreDate;
	}

	public void setNoticeReplyCreDate(Date noticeReplyCreDate) {
		this.noticeReplyCreDate = noticeReplyCreDate;
	}

	@Override
	public String toString() {
		return "NoticeReplyDto [noticeReplyNo=" + noticeReplyNo + ", noticeNo=" + noticeNo + ", memberNo=" + memberNo
				+ ", noticeReplyContent=" + noticeReplyContent + ", noticeReplyCreDate=" + noticeReplyCreDate + "]";
	}

	
	
	
}
