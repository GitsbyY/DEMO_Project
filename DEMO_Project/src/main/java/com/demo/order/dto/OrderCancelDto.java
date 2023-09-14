package com.demo.order.dto;

import java.util.Date;

public class OrderCancelDto {

	private int orderNo;
	private Date orderCancelDate;
	
	public OrderCancelDto() {
		super();
	}

	public OrderCancelDto(int orderNo, Date orderCancelDate) {
		super();
		this.orderNo = orderNo;
		this.orderCancelDate = orderCancelDate;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public Date getOrderCancelDate() {
		return orderCancelDate;
	}

	public void setOrderCancelDate(Date orderCancelDate) {
		this.orderCancelDate = orderCancelDate;
	}

	@Override
	public String toString() {
		return "OrderCancelDto [orderNo=" + orderNo + ", orderCancelDate=" + orderCancelDate + "]";
	}

	

	
	
	
	
}
