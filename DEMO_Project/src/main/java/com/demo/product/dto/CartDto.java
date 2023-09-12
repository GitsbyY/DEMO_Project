package com.demo.product.dto;

public class CartDto {

	private int pno;
	private int mno;
	private String name;
	private int price;
	private int quantity;
	
	public CartDto() {
		super();
	}

	public CartDto(int pno, int mno, String name, int price, int quantity) {
		super();
		this.pno = pno;
		this.mno = mno;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "CartDto [pno=" + pno + ", mno=" + mno + ", name=" + name + ", price=" + price + ", quantity=" + quantity
				+ "]";
	}


	
	
}
