package com.demo.order.dto;

public class OrderProductDto {

	private int orderNo;
	private int productNo;
	private String productName;
	private int productQuantity;
	private int productPrice;
	
	public OrderProductDto() {
		super();
	}

	public OrderProductDto(int orderNo, int productNo, String productName, int productQuantity, int productPrice) {
		super();
		this.orderNo = orderNo;
		this.productNo = productNo;
		this.productName = productName;
		this.productQuantity = productQuantity;
		this.productPrice = productPrice;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	@Override
	public String toString() {
		return "OrderProductDto [orderNo=" + orderNo + ", productNo=" + productNo + ", productName=" + productName
				+ ", productQuantity=" + productQuantity + ", productPrice=" + productPrice + "]";
	}

	

	
	

	
}
