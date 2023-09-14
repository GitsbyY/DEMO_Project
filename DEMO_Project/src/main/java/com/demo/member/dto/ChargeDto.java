package com.demo.member.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ChargeDto {

	private int chargeNo;
	private int memberNo;
	private int chagrgeAmount;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date chargeDate;
	
	public ChargeDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ChargeDto(int chargeNo, int memberNo, int chagrgeAmount, Date chargeDate) {
		super();
		this.chargeNo = chargeNo;
		this.memberNo = memberNo;
		this.chagrgeAmount = chagrgeAmount;
		this.chargeDate = chargeDate;
	}

	public int getChargeNo() {
		return chargeNo;
	}

	public void setChargeNo(int chargeNo) {
		this.chargeNo = chargeNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getChagrgeAmount() {
		return chagrgeAmount;
	}

	public void setChagrgeAmount(int chagrgeAmount) {
		this.chagrgeAmount = chagrgeAmount;
	}

	public Date getChargeDate() {
		return chargeDate;
	}

	public void setChargeDate(Date chargeDate) {
		this.chargeDate = chargeDate;
	}

	@Override
	public String toString() {
		return "ChargeDto [chargeNo=" + chargeNo + ", memberNo=" + memberNo + ", chagrgeAmount=" + chagrgeAmount
				+ ", chargeDate=" + chargeDate + "]";
	}
	
	
	
	
	
	
}
