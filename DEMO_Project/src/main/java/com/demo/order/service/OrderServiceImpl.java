package com.demo.order.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.demo.order.dto.OrderDto;
import com.demo.order.dao.OrderDao;

@Service
public class OrderServiceImpl implements OrderService{
	//bean에 등록하는 것. 객체 생성과 같다.
	
	
	private static final Logger log = LoggerFactory.getLogger(OrderServiceImpl.class);
	@Autowired
	public OrderDao orderDao;
	@Override
	public List<Map<String, Object>> orderSelectList(int start, int end) {
		// TODO Auto-generated method stub
		return orderDao.orderSelectList(start, end);
	}
	
	//주문목록 상세
	@Override
	public Map<String, Object> orderDetailSelectOne(int orderNo) {
		// TODO Auto-generated method stub
		return orderDao.orderDetailSelectOne(orderNo);
	}

	@Override
	public int orderSelectListTotalCount() {
		// TODO Auto-generated method stub
		return orderDao.orderSelectListTotalCount();
	}

	@Override
	public boolean orderCancelUpdate(int orderNo) {
		// TODO Auto-generated method stub
		try {
			orderDao.orderCancelUpdate(orderNo);
			orderDao.orderCancelInsert(orderNo);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}


}
