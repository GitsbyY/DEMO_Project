package com.demo.order.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.order.dao.OrderDao;
import com.demo.order.dto.OrderDto;
import com.demo.product.dao.ProductDao;
import com.demo.product.dto.CartDto;

@Service
public class OrderServiceImpl implements OrderService{
	//bean에 등록하는 것. 객체 생성과 같다.
	
	
	private static final Logger log = LoggerFactory.getLogger(OrderServiceImpl.class);
	@Autowired
	public OrderDao orderDao;
	@Autowired
	public ProductDao productDao;
	@Override
	public List<Map<String, Object>> orderSelectList(int start, int end, String category, String search) {
		// TODO Auto-generated method stub
		return orderDao.orderSelectList(start, end, category, search);
	}
	
	//주문목록 상세
	@Override
	public Map<String, Object> orderDetailSelectOne(int orderNo) {
		// TODO Auto-generated method stub
		return orderDao.orderDetailSelectOne(orderNo);
	}

	@Override
	public int orderSelectListTotalCount(String category, String search) {
		// TODO Auto-generated method stub
		return orderDao.orderSelectListTotalCount(category, search);
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

	@Override
	public boolean orderConfirmUpdate(int orderNo) {
		// TODO Auto-generated method stub
		try {
			orderDao.orderConfirmUpdate(orderNo);
			orderDao.orderConfirmInsert(orderNo);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}


	@Override
	public int cancelSelectListTotalCount(String category, String search) {
		// TODO Auto-generated method stub
		return orderDao.cancelSelectListTotalCount(category, search);
	}

	@Override
	public List<Map<String, Object>> cancelSelectList(int start, int end, String category, String search) {
		// TODO Auto-generated method stub
		return orderDao.cancelSelectList(start, end, category, search);
	}

	@Override
	public Map<String, Object> orderCancelDetailSelectOne(int orderNo) {
		// TODO Auto-generated method stub
		return orderDao.orderCancelDetailSelectOne(orderNo);
	}

	@Override
	public int orderSelectListTotalCount(String category, String search, int sessionMemberNo) {
		// TODO Auto-generated method stub
		return orderDao.orderSelectListTotalCount(category, search, sessionMemberNo);
	}

	@Override
	public List<Map<String, Object>> orderSelectList(int start, int end, String category, String search,
			int sessionMemberNo) {
		// TODO Auto-generated method stub
		return orderDao.orderSelectList(start, end, category, search, sessionMemberNo);
	}

	@Override
	public int cancelSelectListTotalCountMember(String category, String search, int sessionMemberNo) {
		// TODO Auto-generated method stub
		return orderDao.cancelSelectListTotalCountMember(category, search, sessionMemberNo);
	}

	@Override
	public List<Map<String, Object>> cancelSelectListMember(int start, int end, String category, String search,
			int sessionMemberNo) {
		// TODO Auto-generated method stub
		return orderDao.cancelSelectListMember(start, end, category, search, sessionMemberNo);
	}

	@Override
	public boolean insertOrder(OrderDto orderDto) {
		// TODO Auto-generated method stub
		try {
			orderDao.insertOrder(orderDto);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public boolean insertOrderList(List<String> productNos,
			OrderDto orderDto) {
		// TODO Auto-generated method stub
		
		try {
			for (int i = 0; i < productNos.size(); i++) {
				int productNo = Integer.parseInt(productNos.get(i));
				Map <String, Object> map = orderDao.selectCartOne(productNo, orderDto.getMemberNo());
				map.put("PRODUCT_QUANTITY", ((BigDecimal)map.get("PRODUCT_QUANTITY")).intValue());
				orderDto.setProductQuantity((int) map.get("PRODUCT_QUANTITY"));
				System.out.println("productNo: " + productNo);
				orderDto.setProductNo(productNo);
				System.out.println("????" + orderDto);
				orderDao.insertOrder(orderDto);
				productDao.deleteCartOne(productNos.get(i), orderDto.getMemberNo());
			}
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
			
	}


}
