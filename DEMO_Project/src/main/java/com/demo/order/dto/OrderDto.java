package com.demo.order.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class OrderDto {

	private int orderNo;
	private int memberNo;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date orderDate;
	private String orderRequest;
	private String orderStatus;
	private int productQuantity;
	
	public OrderDto() {
		super();
	}

	public OrderDto(int orderNo, int memberNo, Date orderDate, String orderRequest, String orderStatus,
			int productQuantity) {
		super();
		this.orderNo = orderNo;
		this.memberNo = memberNo;
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
		return "OrderDto [orderNo=" + orderNo + ", memberNo=" + memberNo + ", orderDate=" + orderDate
				+ ", orderRequest=" + orderRequest + ", orderStatus=" + orderStatus + ", productQuantity="
				+ productQuantity + "]";
	}

	
	
	

	
}
