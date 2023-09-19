package com.demo.order.dao;

import java.util.List;
import java.util.Map;

import com.demo.order.dto.OrderDto;

public interface OrderDao {

	List<Map<String, Object>> orderSelectList(int start, int end);

	Map<String, Object> orderDetailSelectOne(int orderNo);

	int orderSelectListTotalCount();

	int orderCancelUpdate(int orderNo);

	int orderCancelInsert(int orderNo);



}
