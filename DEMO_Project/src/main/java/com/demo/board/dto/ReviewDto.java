package com.demo.board.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ReviewDto {

	private int reviewNo;
	private int memberNo;
	private int productNo;
	private String reviewTitle;
	private String reviewContent;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reviewCreDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reviewModDate;
	
	public ReviewDto() {
		super();
	}

	public ReviewDto(int reviewNo, int memberNo, int productNo, String reviewTitle, String reviewContent,
			Date reviewCreDate, Date reviewModDate) {
		super();
		this.reviewNo = reviewNo;
		this.memberNo = memberNo;
		this.productNo = productNo;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewCreDate = reviewCreDate;
		this.reviewModDate = reviewModDate;
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

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public Date getReviewCreDate() {
		return reviewCreDate;
	}

	public void setReviewCreDate(Date reviewCreDate) {
		this.reviewCreDate = reviewCreDate;
	}

	public Date getReviewModDate() {
		return reviewModDate;
	}

	public void setReviewModDate(Date reviewModDate) {
		this.reviewModDate = reviewModDate;
	}

	@Override
	public String toString() {
		return "ReviewDto [reviewNo=" + reviewNo + ", memberNo=" + memberNo + ", productNo=" + productNo
				+ ", reviewTitle=" + reviewTitle + ", reviewContent=" + reviewContent + ", reviewCreDate="
				+ reviewCreDate + ", reviewModDate=" + reviewModDate + "]";
	}

	

	


	
	
	
}
