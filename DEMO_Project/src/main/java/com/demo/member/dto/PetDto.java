package com.demo.member.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.RequestParam;

public class PetDto {

	private int petNo;
	private int memberNo;
	private String petName;
	private String petBreed;
	private char petGender;
	private double petWeight; 
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date petAdoptDate;
	private String petVac;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date petVacDate;
	
	
	public PetDto() {
		super();
		// TODO Auto-generated constructor stub
	}


	public PetDto(int petNo, int memberNo, String petName, String petBreed, char petGender, double petWeight,
			Date petAdoptDate, String petVac, Date petVacDate) {
		super();
		this.petNo = petNo;
		this.memberNo = memberNo;
		this.petName = petName;
		this.petBreed = petBreed;
		this.petGender = petGender;
		this.petWeight = petWeight;
		this.petAdoptDate = petAdoptDate;
		this.petVac = petVac;
		this.petVacDate = petVacDate;
	}


	public int getPetNo() {
		return petNo;
	}


	public void setPetNo(int petNo) {
		this.petNo = petNo;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public String getPetName() {
		return petName;
	}


	public void setPetName(String petName) {
		this.petName = petName;
	}


	public String getPetBreed() {
		return petBreed;
	}


	public void setPetBreed(String petBreed) {
		this.petBreed = petBreed;
	}


	public char getPetGender() {
		return petGender;
	}


	public void setPetGender(char petGender) {
		this.petGender = petGender;
	}


	public double getPetWeight() {
		return petWeight;
	}


	public void setPetWeight(double petWeight) {
		this.petWeight = petWeight;
	}


	public Date getPetAdoptDate() {
		return petAdoptDate;
	}


	public void setPetAdoptDate(Date petAdoptDate) {
		this.petAdoptDate = petAdoptDate;
	}


	public String getPetVac() {
		return petVac;
	}


	public void setPetVac(String petVac) {
		this.petVac = petVac;
	}


	public Date getPetVacDate() {
		return petVacDate;
	}


	public void setPetVacDate(Date petVacDate) {
		this.petVacDate = petVacDate;
	}


	@Override
	public String toString() {
		return "PetDto [petNo=" + petNo + ", memberNo=" + memberNo + ", petName=" + petName + ", petBreed=" + petBreed
				+ ", petGender=" + petGender + ", petWeight=" + petWeight + ", petAdoptDate=" + petAdoptDate
				+ ", petVac=" + petVac + ", petVacDate=" + petVacDate + "]";
	}


	


	
	

	
}
