package com.demo.board.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.demo.board.dao.BoardDao;
import com.demo.board.dto.NoticeDto;


@Service
public class BoardServiceImpl implements BoardService{
	//bean에 등록하는 것. 객체 생성과 같다.
	
	
	private static final Logger log = LoggerFactory.getLogger(BoardServiceImpl.class);
	@Autowired
	public BoardDao boardDao;

	/*
	 * @Override public List<Map<String, Object>> noticeSelectList() { // TODO
	 * Auto-generated method stub return boardDao.noticeSelectList(); }
	 */
	@Override
	public List<Map<String, Object>> customerServiceSelectList() {
		// TODO Auto-generated method stub
		return boardDao.customerServiceSelectList();
	}
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
				
}
