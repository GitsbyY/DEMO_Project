package com.demo.board.dao;

import java.util.List;
import java.util.Map;

import com.demo.board.dto.NoticeDto;
import com.demo.order.dto.OrderDto;

public interface BoardDao {

	List<Map<String, Object>> customerServiceSelectList();

	Map<String, Object> noticeSelectList(int start, int end);	

	public int noticeSelectTotalCount();

	
	


}
