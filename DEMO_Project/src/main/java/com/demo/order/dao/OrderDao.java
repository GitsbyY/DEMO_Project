package com.demo.order.dao;

import java.util.List;
import java.util.Map;

import com.demo.order.dto.OrderDto;

public interface OrderDao {

	List<Map<String, Object>> orderSelectList(int start, int end, String category, String search);

	Map<String, Object> orderDetailSelectOne(int orderNo);

	int orderSelectListTotalCount(String category, String search);
	
	int orderSelectListTotalCount(String category, String search, int sessionMemberNo);

	int orderCancelUpdate(int orderNo);

	int orderCancelInsert(int orderNo);

	int orderConfirmUpdate(int orderNo);
	
	int orderConfirmInsert(int orderNo);

	int cancelSelectListTotalCount(String category, String search);

	int cancelSelectListTotalCountMember(String category, String search, int sessionMemberNo);

	List<Map<String, Object>> cancelSelectList(int start, int end, String category, String search);

	Map<String, Object> orderCancelDetailSelectOne(int orderNo);

	List<Map<String, Object>> orderSelectList(int start, int end, String category, String search, int sessionMemberNo);

	List<Map<String, Object>> cancelSelectListMember(int start, int end, String category, String search,
			int sessionMemberNo);

	void insertOrder(OrderDto orderDto);

	Map<String, Object> selectCartOne(int productNo, int memberNo);






}
