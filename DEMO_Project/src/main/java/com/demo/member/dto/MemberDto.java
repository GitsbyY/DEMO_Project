package com.demo.member.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MemberDto {

	private int mno;
	private String id; 
	private String password; 
	private String name;
	private String nickName;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthDate;
	private String Phone;
	private String email;
	private String address;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date joinDate;
	private int emoney;
	private int point;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date modDate;
	
	public MemberDto() {
		super();
	}

	public MemberDto(int mno, String id, String password, String name, String nickName, Date birthDate, String phone,
			String email, String address, Date joinDate, int emoney, int point, Date modDate) {
		super();
		this.mno = mno;
		this.id = id;
		this.password = password;
		this.name = name;
		this.nickName = nickName;
		this.birthDate = birthDate;
		Phone = phone;
		this.email = email;
		this.address = address;
		this.joinDate = joinDate;
		this.emoney = emoney;
		this.point = point;
		this.modDate = modDate;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		Phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public int getEmoney() {
		return emoney;
	}

	public void setEmoney(int emoney) {
		this.emoney = emoney;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Date getModDate() {
		return modDate;
	}

	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}

	@Override
	public String toString() {
		return "MemberDto [mno=" + mno + ", id=" + id + ", password=" + password + ", name=" + name + ", nickName="
				+ nickName + ", birthDate=" + birthDate + ", Phone=" + Phone + ", email=" + email + ", address="
				+ address + ", joinDate=" + joinDate + ", emoney=" + emoney + ", point=" + point + ", modDate="
				+ modDate + "]";
	}

	
	

	
}
