package com.demo.board.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class InquiryDto {

	private int inquiryNo;
	private int memberNo;
	private String inquiryType;
	private String memberName;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date inquiryCreDate;
	private String inquiryTitle;
	private String inquiryContent;
	private char is_Reply;
	
	public InquiryDto() {
		super();
	}

	public InquiryDto(int inquiryNo, int memberNo, String inquiryType, String memberName, Date inquiryCreDate,
			String inquiryTitle, String inquiryContent, char is_Reply) {
		super();
		this.inquiryNo = inquiryNo;
		this.memberNo = memberNo;
		this.inquiryType = inquiryType;
		this.memberName = memberName;
		this.inquiryCreDate = inquiryCreDate;
		this.inquiryTitle = inquiryTitle;
		this.inquiryContent = inquiryContent;
		this.is_Reply = is_Reply;
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

	public String getInquiryType() {
		return inquiryType;
	}

	public void setInquiryType(String inquiryType) {
		this.inquiryType = inquiryType;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public Date getInquiryCreDate() {
		return inquiryCreDate;
	}

	public void setInquiryCreDate(Date inquiryCreDate) {
		this.inquiryCreDate = inquiryCreDate;
	}

	public String getInquiryTitle() {
		return inquiryTitle;
	}

	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}

	public String getInquiryContent() {
		return inquiryContent;
	}

	public void setInquiryContent(String inquiryContent) {
		this.inquiryContent = inquiryContent;
	}

	public char getIs_Reply() {
		return is_Reply;
	}

	public void setIs_Reply(char is_Reply) {
		this.is_Reply = is_Reply;
	}

	@Override
	public String toString() {
		return "InquiryDto [inquiryNo=" + inquiryNo + ", memberNo=" + memberNo + ", inquiryType=" + inquiryType
				+ ", memberName=" + memberName + ", inquiryCreDate=" + inquiryCreDate + ", inquiryTitle="
				+ inquiryTitle + ", inquiryContent=" + inquiryContent + ", is_Reply=" + is_Reply + "]";
	}

	
	
	
	
}
