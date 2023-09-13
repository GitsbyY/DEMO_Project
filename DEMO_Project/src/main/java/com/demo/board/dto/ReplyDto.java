package com.demo.board.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ReplyDto {

	private int inquiryNo;
	private int memberNo;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date replyCreDate;
	private String memberName;
	private String replyTitle;
	private String replyContent;
	
	public ReplyDto() {
		super();
	}

	public ReplyDto(int inquiryNo, int memberNo, Date replyCreDate, String memberName, String replyTitle,
			String replyContent) {
		super();
		this.inquiryNo = inquiryNo;
		this.memberNo = memberNo;
		this.replyCreDate = replyCreDate;
		this.memberName = memberName;
		this.replyTitle = replyTitle;
		this.replyContent = replyContent;
	}

	public int getInquiryNo() {
		return inquiryNo;
	}

	public void setInquiryNo(int inquiryNo) {
		this.inquiryNo = inquiryNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public Date getReplyCreDate() {
		return replyCreDate;
	}

	public void setReplyCreDate(Date replyCreDate) {
		this.replyCreDate = replyCreDate;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getReplyTitle() {
		return replyTitle;
	}

	public void setReplyTitle(String replyTitle) {
		this.replyTitle = replyTitle;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	@Override
	public String toString() {
		return "ReplyDto [inquiryNo=" + inquiryNo + ", memberNo=" + memberNo + ", replyCreDate=" + replyCreDate
				+ ", memberName=" + memberName + ", replyTitle=" + replyTitle + ", replyContent=" + replyContent + "]";
	}

	

	
	
	
}
