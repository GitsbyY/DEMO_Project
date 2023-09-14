package com.demo.order.dto;

import java.util.Date;

public class OrderConfirmDto {

	private int orderNo;
	private Date orderConfirmDate;
	
	public OrderConfirmDto() {
		super();
	}

	public OrderConfirmDto(int orderNo, Date orderConfirmDate) {
		super();
		this.orderNo = orderNo;
		this.orderConfirmDate = orderConfirmDate;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public Date getOrderConfirmDate() {
		return orderConfirmDate;
	}

	public void setOrderConfirmDate(Date orderConfirmDate) {
		this.orderConfirmDate = orderConfirmDate;
	}

	@Override
	public String toString() {
		return "OrderConfirmDto [orderNo=" + orderNo + ", orderConfirmDate=" + orderConfirmDate + "]";
	}

	

	
	
	
	
}
