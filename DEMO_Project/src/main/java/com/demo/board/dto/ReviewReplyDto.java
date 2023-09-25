package com.demo.board.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ReviewReplyDto {

	private int reviewReplyNo;
	private int reviewNo;
	private int memberNo;
	private String reviewReplyContent;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reviewReplyCreDate;
	
	public ReviewReplyDto() {
		super();
	}

	public ReviewReplyDto(int reviewReplyNo, int reviewNo, int memberNo, String reviewReplyContent,
			Date reviewReplyCreDate) {
		super();
		this.reviewReplyNo = reviewReplyNo;
		this.reviewNo = reviewNo;
		this.memberNo = memberNo;
		this.reviewReplyContent = reviewReplyContent;
		this.reviewReplyCreDate = reviewReplyCreDate;
	}

	public int getReviewReplyNo() {
		return reviewReplyNo;
	}

	public void setReviewReplyNo(int reviewReplyNo) {
		this.reviewReplyNo = reviewReplyNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getReviewReplyContent() {
		return reviewReplyContent;
	}

	public void setReviewReplyContent(String reviewReplyContent) {
		this.reviewReplyContent = reviewReplyContent;
	}

	public Date getReviewReplyCreDate() {
		return reviewReplyCreDate;
	}

	public void setReviewReplyCreDate(Date reviewReplyCreDate) {
		this.reviewReplyCreDate = reviewReplyCreDate;
	}

	@Override
	public String toString() {
		return "ReviewReplyDto [reviewReplyNo=" + reviewReplyNo + ", reviewNo=" + reviewNo + ", memberNo=" + memberNo
				+ ", reviewReplyContent=" + reviewReplyContent + ", reviewReplyCreDate=" + reviewReplyCreDate + "]";
	}

	
	
	
	
}
