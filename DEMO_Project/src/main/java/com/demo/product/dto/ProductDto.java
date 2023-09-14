package com.demo.product.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ProductDto {

	private int productNo;
	private int productDetailNo;
	private int imgNo;
	private String productName;
	private int productPrice;
	private int productStock;
	private String productCategory;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date productCreDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date productModDate;
	
	public ProductDto() {
		super();
	}

	public ProductDto(int productNo, int productDetailNo, int imgNo, String productName, int productPrice,
			int productStock, String productCategory, Date productCreDate, Date productModDate) {
		super();
		this.productNo = productNo;
		this.productDetailNo = productDetailNo;
		this.imgNo = imgNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productStock = productStock;
		this.productCategory = productCategory;
		this.productCreDate = productCreDate;
		this.productModDate = productModDate;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getProductDetailNo() {
		return productDetailNo;
	}

	public void setProductDetailNo(int productDetailNo) {
		this.productDetailNo = productDetailNo;
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
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

	public int getProductStock() {
		return productStock;
	}

	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public Date getProductCreDate() {
		return productCreDate;
	}

	public void setProductCreDate(Date productCreDate) {
		this.productCreDate = productCreDate;
	}

	public Date getProductModDate() {
		return productModDate;
	}

	public void setProductModDate(Date productModDate) {
		this.productModDate = productModDate;
	}

	@Override
	public String toString() {
		return "ProductDto [productNo=" + productNo + ", productDetailNo=" + productDetailNo + ", imgNo=" + imgNo
				+ ", productName=" + productName + ", productPrice=" + productPrice + ", productStock=" + productStock
				+ ", productCategory=" + productCategory + ", productCreDate=" + productCreDate + ", productModDate="
				+ productModDate + "]";
	}

	


	
	
}
