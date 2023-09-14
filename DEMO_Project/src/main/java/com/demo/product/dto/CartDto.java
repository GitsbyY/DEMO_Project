package com.demo.product.dto;

public class CartDto {

	private int productNo;
	private int memberNo;
	private String productName;
	private int productPrice;
	private int productQuantity;
	
	public CartDto() {
		super();
	}

	public CartDto(int productNo, int memberNo, String productName, int productPrice, int productQuantity) {
		super();
		this.productNo = productNo;
		this.memberNo = memberNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productQuantity = productQuantity;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}

	@Override
	public String toString() {
		return "CartDto [productNo=" + productNo + ", memberNo=" + memberNo + ", productName=" + productName
				+ ", productPrice=" + productPrice + ", productQuantity=" + productQuantity + "]";
	}

	


	
	
}
