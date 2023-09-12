package com.demo.order.dto;

import java.util.Date;

public class OrderConfirmDto {

	private int ono;
	private Date orderConfirmDate;
	
	public OrderConfirmDto() {
		super();
	}

	public OrderConfirmDto(int ono, Date orderConfirmDate) {
		super();
		this.ono = ono;
		this.orderConfirmDate = orderConfirmDate;
	}

	public int getOno() {
		return ono;
	}

	public void setOno(int ono) {
		this.ono = ono;
	}

	public Date getOrderConfirmDate() {
		return orderConfirmDate;
	}

	public void setOrderConfirmDate(Date orderConfirmDate) {
		this.orderConfirmDate = orderConfirmDate;
	}

	@Override
	public String toString() {
		return "OrderProductDto [ono=" + ono + ", orderConfirmDate=" + orderConfirmDate + "]";
	}

	
	
	
	
}
