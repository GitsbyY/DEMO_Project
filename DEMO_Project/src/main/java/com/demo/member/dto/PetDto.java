package com.demo.member.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PetDto {

	private int pno;
	private int mno;
	private String name;
	private String breed;
	private char gender;
	private double weight; 
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date adoptDate;
	private String vac;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date vacDate;
	
	
	public PetDto() {
		super();
		// TODO Auto-generated constructor stub
	}


	public PetDto(int pno, int mno, String name, String breed, char gender, double weight, Date adoptDate, String vac,
			Date vacDate) {
		super();
		this.pno = pno;
		this.mno = mno;
		this.name = name;
		this.breed = breed;
		this.gender = gender;
		this.weight = weight;
		this.adoptDate = adoptDate;
		this.vac = vac;
		this.vacDate = vacDate;
	}


	public int getPno() {
		return pno;
	}


	public void setPno(int pno) {
		this.pno = pno;
	}


	public int getMno() {
		return mno;
	}


	public void setMno(int mno) {
		this.mno = mno;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getBreed() {
		return breed;
	}


	public void setBreed(String breed) {
		this.breed = breed;
	}


	public char getGender() {
		return gender;
	}


	public void setGender(char gender) {
		this.gender = gender;
	}


	public double getWeight() {
		return weight;
	}


	public void setWeight(double weight) {
		this.weight = weight;
	}


	public Date getAdoptDate() {
		return adoptDate;
	}


	public void setAdoptDate(Date adoptDate) {
		this.adoptDate = adoptDate;
	}


	public String getVac() {
		return vac;
	}


	public void setVac(String vac) {
		this.vac = vac;
	}


	public Date getVacDate() {
		return vacDate;
	}


	public void setVacDate(Date vacDate) {
		this.vacDate = vacDate;
	}


	@Override
	public String toString() {
		return "PetDto [pno=" + pno + ", mno=" + mno + ", name=" + name + ", breed=" + breed + ", gender=" + gender
				+ ", weight=" + weight + ", adoptDate=" + adoptDate + ", vac=" + vac + ", vacDate=" + vacDate + "]";
	}


	
	

	
}
