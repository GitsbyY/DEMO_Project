package com.demo.product.dto;

public class ProductDetailDto {

	private int productDetailNo;
	private int imgNo;
	private String productDetailContent;
	
	public ProductDetailDto() {
		super();
	}

	public ProductDetailDto(int productDetailNo, int imgNo, String productDetailContent) {
		super();
		this.productDetailNo = productDetailNo;
		this.imgNo = imgNo;
		this.productDetailContent = productDetailContent;
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

	public String getProductDetailContent() {
		return productDetailContent;
	}

	public void setProductDetailContent(String productDetailContent) {
		this.productDetailContent = productDetailContent;
	}

	@Override
	public String toString() {
		return "ProductDetailDto [productDetailNo=" + productDetailNo + ", imgNo=" + imgNo + ", productDetailContent="
				+ productDetailContent + "]";
	}

	

	
	
	
	
}
