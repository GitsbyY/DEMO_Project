package com.demo.product.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ProductDto {

	private int pno;
	private int pdno;
	private int ino;
	private String name;
	private int price;
	private int stock;
	private String category;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date creDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date modDate;
	
	public ProductDto() {
		super();
	}

	public ProductDto(int pno, int pdno, int ino, String name, int price, int stock, String category, Date creDate,
			Date modDate) {
		super();
		this.pno = pno;
		this.pdno = pdno;
		this.ino = ino;
		this.name = name;
		this.price = price;
		this.stock = stock;
		this.category = category;
		this.creDate = creDate;
		this.modDate = modDate;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
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

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Date getCreDate() {
		return creDate;
	}

	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}

	public Date getModDate() {
		return modDate;
	}

	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}

	@Override
	public String toString() {
		return "ProductDto [pno=" + pno + ", pdno=" + pdno + ", ino=" + ino + ", name=" + name + ", price=" + price
				+ ", stock=" + stock + ", category=" + category + ", creDate=" + creDate + ", modDate=" + modDate + "]";
	}


	
	
}
