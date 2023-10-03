package com.demo.order.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class OrderDto {

	private int orderNo;
	private int memberNo;
	private int productNo;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date orderDate;
	private String orderRequest;
	private String orderStatus;
	private int productQuantity;
	
	public OrderDto() {
		super();
	}

	public OrderDto(int orderNo, int memberNo, int productNo, Date orderDate, String orderRequest, String orderStatus,
			int productQuantity) {
		super();
		this.orderNo = orderNo;
		this.memberNo = memberNo;
		this.productNo = productNo;
		this.orderDate = orderDate;
		this.orderRequest = orderRequest;
		this.orderStatus = orderStatus;
		this.productQuantity = productQuantity;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderRequest() {
		return orderRequest;
	}

	public void setOrderRequest(String orderRequest) {
		this.orderRequest = orderRequest;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public int getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}

	@Override
	public String toString() {
		return "OrderDto [orderNo=" + orderNo + ", memberNo=" + memberNo + ", productNo=" + productNo + ", orderDate="
				+ orderDate + ", orderRequest=" + orderRequest + ", orderStatus=" + orderStatus + ", productQuantity="
				+ productQuantity + "]";
	}

	
	
	
	

	
}
