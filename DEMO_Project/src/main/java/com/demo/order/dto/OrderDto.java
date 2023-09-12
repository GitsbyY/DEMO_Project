package com.demo.order.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class OrderDto {

	private int ono;
	private int mno;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date orderDate;
	private String request;
	private String status;
	private int totalPrice;
	
	public OrderDto() {
		super();
	}

	public OrderDto(int ono, int mno, Date orderDate, String request, String status, int totalPrice) {
		super();
		this.ono = ono;
		this.mno = mno;
		this.orderDate = orderDate;
		this.request = request;
		this.status = status;
		this.totalPrice = totalPrice;
	}

	public int getOno() {
		return ono;
	}

	public void setOno(int ono) {
		this.ono = ono;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "OrderDto [ono=" + ono + ", mno=" + mno + ", orderDate=" + orderDate + ", request=" + request
				+ ", status=" + status + ", totalPrice=" + totalPrice + "]";
	}

	
	

	
}
