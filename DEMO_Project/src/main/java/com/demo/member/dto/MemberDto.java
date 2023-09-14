package com.demo.member.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MemberDto {

	private int memberNo;
	private String memberId; 
	private String memberPassword; 
	private String memberName;
	private String memberNickName;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date memberBirthDate;
	private String memberPhone;
	private String memberEmail;
	private String memberAddress;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date memberJoinDate;
	private int memberEmoney;
	private int memberPoint;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date memberModDate;
	
	public MemberDto() {
		super();
	}

	public MemberDto(int memberNo, String memberId, String memberPassword, String memberName, String memberNickName,
			Date memberBirthDate, String memberPhone, String memberEmail, String memberAddress, Date memberJoinDate,
			int memberEmoney, int memberPoint, Date memberModDate) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPassword = memberPassword;
		this.memberName = memberName;
		this.memberNickName = memberNickName;
		this.memberBirthDate = memberBirthDate;
		this.memberPhone = memberPhone;
		this.memberEmail = memberEmail;
		this.memberAddress = memberAddress;
		this.memberJoinDate = memberJoinDate;
		this.memberEmoney = memberEmoney;
		this.memberPoint = memberPoint;
		this.memberModDate = memberModDate;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPassword() {
		return memberPassword;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberNickName() {
		return memberNickName;
	}

	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}

	public Date getMemberBirthDate() {
		return memberBirthDate;
	}

	public void setMemberBirthDate(Date memberBirthDate) {
		this.memberBirthDate = memberBirthDate;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public Date getMemberJoinDate() {
		return memberJoinDate;
	}

	public void setMemberJoinDate(Date memberJoinDate) {
		this.memberJoinDate = memberJoinDate;
	}

	public int getMemberEmoney() {
		return memberEmoney;
	}

	public void setMemberEmoney(int memberEmoney) {
		this.memberEmoney = memberEmoney;
	}

	public int getMemberPoint() {
		return memberPoint;
	}

	public void setMemberPoint(int memberPoint) {
		this.memberPoint = memberPoint;
	}

	public Date getMemberModDate() {
		return memberModDate;
	}

	public void setMemberModDate(Date memberModDate) {
		this.memberModDate = memberModDate;
	}

	@Override
	public String toString() {
		return "MemberDto [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPassword=" + memberPassword
				+ ", memberName=" + memberName + ", memberNickName=" + memberNickName + ", memberBirthDate="
				+ memberBirthDate + ", memberPhone=" + memberPhone + ", memberEmail=" + memberEmail + ", memberAddress="
				+ memberAddress + ", memberJoinDate=" + memberJoinDate + ", memberEmoney=" + memberEmoney
				+ ", memberPoint=" + memberPoint + ", memberModDate=" + memberModDate + "]";
	}

	
	
	

	
}
