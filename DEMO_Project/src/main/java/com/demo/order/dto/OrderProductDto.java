package com.demo.order.dto;

public class OrderProductDto {

	private int ono;
	private int pno;
	private String name;
	private int quantity;
	private int price;
	
	public OrderProductDto() {
		super();
	}

	public OrderProductDto(int ono, int pno, String name, int quantity, int price) {
		super();
		this.ono = ono;
		this.pno = pno;
		this.name = name;
		this.quantity = quantity;
		this.price = price;
	}

	public int getOno() {
		return ono;
	}

	public void setOno(int ono) {
		this.ono = ono;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "OrderProductDto [ono=" + ono + ", pno=" + pno + ", name=" + name + ", quantity=" + quantity + ", price="
				+ price + "]";
	}

	
	

	
}
