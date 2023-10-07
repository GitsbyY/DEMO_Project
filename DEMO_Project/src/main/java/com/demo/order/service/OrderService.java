package com.demo.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.demo.member.dto.MemberDto;
import com.demo.order.dto.OrderDto;


public interface OrderService {

	List<Map<String, Object>> orderSelectList(int start, int end, String category, String search);

	Map<String, Object> orderDetailSelectOne(int orderNo);

	int orderSelectListTotalCount(String category, String search);

	int orderSelectListTotalCount(String category, String search, int sessionMemberNo);
	
	boolean orderCancelUpdate(int orderNo);

	boolean orderConfirmUpdate(int orderNo);

	int cancelSelectListTotalCount(String category, String search);

	int cancelSelectListTotalCountMember(String category, String search, int sessionMemberNo);

	List<Map<String, Object>> cancelSelectList(int start, int end, String category, String search);

	Map<String, Object> orderCancelDetailSelectOne(int orderNo);

	List<Map<String, Object>> orderSelectList(int start, int end, String category, String search, int sessionMemberNo);

	List<Map<String, Object>> cancelSelectListMember(int start, int end, String category, String search,
			int sessionMemberNo);

	boolean insertOrder(OrderDto orderDto);

	Map<String, Object> selectCartOne(int productNo, int memberNo);





}
