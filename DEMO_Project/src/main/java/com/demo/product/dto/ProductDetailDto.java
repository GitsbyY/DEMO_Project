package com.demo.product.dto;

public class ProductDetailDto {

	private int pdno;
	private int ino;
	private String pdContent;
	
	public ProductDetailDto() {
		super();
	}

	public ProductDetailDto(int pdno, int ino, String pdContent) {
		super();
		this.pdno = pdno;
		this.ino = ino;
		this.pdContent = pdContent;
	}

	public int getPdno() {
		return pdno;
	}

	public void setPdno(int pdno) {
		this.pdno = pdno;
	}

	public int getIno() {
		return ino;
	}

	public void setIno(int ino) {
		this.ino = ino;
	}

	public String getPdContent() {
		return pdContent;
	}

	public void setPdContent(String pdContent) {
		this.pdContent = pdContent;
	}

	@Override
	public String toString() {
		return "ProductDetailDto [pdno=" + pdno + ", ino=" + ino + ", pdContent=" + pdContent + "]";
	}

	
	
	
	
}
