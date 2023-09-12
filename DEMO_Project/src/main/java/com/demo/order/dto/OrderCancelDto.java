package com.demo.order.dto;

import java.util.Date;

public class OrderCancelDto {

	private int ono;
	private Date orderCancelDate;
	
	public OrderCancelDto() {
		super();
	}

	public OrderCancelDto(int ono, Date orderCancelDate) {
		super();
		this.ono = ono;
		this.orderCancelDate = orderCancelDate;
	}

	public int getOno() {
		return ono;
	}

	public void setOno(int ono) {
		this.ono = ono;
	}

	public Date getOrderCancelDate() {
		return orderCancelDate;
	}

	public void setOrderCancelDate(Date orderCancelDate) {
		this.orderCancelDate = orderCancelDate;
	}

	@Override
	public String toString() {
		return "OrderProductDto [ono=" + ono + ", orderCancelDate=" + orderCancelDate + "]";
	}

	
	
	
	
}
