package com.demo.member.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ChargeDto {

	private int mcno;
	private int mno;
	private int mcAmount;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date mcDate;
	
	public ChargeDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChargeDto(int mcno, int mno, int mcAmount, Date mcDate) {
		super();
		this.mcno = mcno;
		this.mno = mno;
		this.mcAmount = mcAmount;
		this.mcDate = mcDate;
	}
	public int getMcno() {
		return mcno;
	}
	public void setMcno(int mcno) {
		this.mcno = mcno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getMcAmount() {
		return mcAmount;
	}
	public void setMcAmount(int mcAmount) {
		this.mcAmount = mcAmount;
	}
	public Date getMcDate() {
		return mcDate;
	}
	public void setMcDate(Date mcDate) {
		this.mcDate = mcDate;
	}
	@Override
	public String toString() {
		return "ChargeDto [mcno=" + mcno + ", mno=" + mno + ", mcAmount=" + mcAmount + ", mcDate=" + mcDate + "]";
	}
	
	
	
	
}
