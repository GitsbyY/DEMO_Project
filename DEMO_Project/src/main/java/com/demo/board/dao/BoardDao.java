package com.demo.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.demo.board.dto.InquiryDto;
import com.demo.board.dto.NoticeDto;
import com.demo.order.dto.OrderDto;

public interface BoardDao {

	Map<String, Object> noticeSelectList(int start, int end);	

	public int noticeSelectTotalCount();

	Map<String, Object> inquirySelectList(int start, int end);

	public int inquirySelectTotalCount();

	public HashMap<String, Object> noticeSelectOne(int no);

	List<Map<String, Object>> fileSelectList(int no);

	public HashMap<String, Object> inquirySelectOne(int no);

	public int inquiryInsertOne(InquiryDto inquiryDto);

	public int noticeInsertOne(NoticeDto noticeDto);

	





}
