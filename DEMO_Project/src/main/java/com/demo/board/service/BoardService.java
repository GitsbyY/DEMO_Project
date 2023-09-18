package com.demo.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.demo.board.dto.NoticeDto;
import com.demo.order.dto.OrderDto;


public interface BoardService {
		
	List<Map<String, Object>> customerServiceSelectList();

	public int noticeSelectTotalCount();

	Map<String, Object> noticeSelectList(int start, int end);


	
}
