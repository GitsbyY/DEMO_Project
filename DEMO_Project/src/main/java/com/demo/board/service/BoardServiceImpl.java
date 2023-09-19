package com.demo.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.demo.board.dao.BoardDao;
import com.demo.board.dto.InquiryDto;
import com.demo.board.dto.NoticeDto;
import com.demo.util.FileUtils;

@Service
public class BoardServiceImpl implements BoardService{
	//bean에 등록하는 것. 객체 생성과 같다.
	
	
	private static final Logger log = LoggerFactory.getLogger(BoardServiceImpl.class);
	@Autowired
	public BoardDao boardDao;
	
	/*
	 * @Override public List<Map<String, Object>> customerServiceSelectList() { //
	 * TODO Auto-generated method stub return boardDao.customerServiceSelectList();
	 * }
	 */
	@Override
	public int noticeSelectTotalCount() {
		// TODO Auto-generated method stub
		return boardDao.noticeSelectTotalCount();
	}
	@Override
	public Map<String, Object> noticeSelectList(int start, int end) {
		// TODO Auto-generated method stub
		return boardDao.noticeSelectList(start, end);
	}
	@Override
	public int inquirySelectTotalCount() {
		// TODO Auto-generated method stub
		return boardDao.inquirySelectTotalCount();
	}
	@Override
	public Map<String, Object> inquirySelectList(int start, int end) {
		// TODO Auto-generated method stub
		return boardDao.inquirySelectList(start, end);
	}
	@Override
	public Map<String, Object> noticeSelectOne(int no) {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		HashMap<String, Object> noticeDto = boardDao.noticeSelectOne(no);
		resultMap.put("noticeDto", noticeDto);
		
		List<Map<String, Object>> fileList = boardDao.fileSelectList(no);
		resultMap.put("fileList", fileList);
		
		return resultMap;
	}
	@Override
	public Map<String, Object> inquirySelectOne(int no) {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		HashMap<String, Object> inquiryDto = boardDao.inquirySelectOne(no);
		resultMap.put("inquiryDto", inquiryDto);
		
		List<Map<String, Object>> fileList = boardDao.fileSelectList(no);
		resultMap.put("fileList", fileList);
		
		return resultMap;
	}
	@Override
	public void inquiryInsertOne(InquiryDto inquiryDto
		, MultipartHttpServletRequest mulRequest) throws Exception {
		// TODO Auto-generated method stub
		boardDao.inquiryInsertOne(inquiryDto);
		

	}
	@Override
	public void noticeInsertOne(NoticeDto noticeDto
		, MultipartHttpServletRequest mulRequest) throws Exception {
		// TODO Auto-generated method stub
		boardDao.noticeInsertOne(noticeDto);
	}
				
}
