package com.demo.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.demo.order.dto.OrderDto;


public interface OrderService {

	List<Map<String, Object>> orderSelectList(int start, int end);

	Map<String, Object> orderDetailSelectOne(int orderNo);

	int orderSelectListTotalCount();

	boolean orderCancelUpdate(int orderNo);

	int cancelSelectListTotalCount();

	List<Map<String, Object>> cancelSelectList(int start, int end);

	Map<String, Object> orderCancelDetailSelectOne(int orderNo);


}
