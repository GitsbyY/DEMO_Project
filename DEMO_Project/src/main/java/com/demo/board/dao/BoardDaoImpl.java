package com.demo.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.demo.board.dto.NoticeDto;
import com.demo.order.dto.OrderDto;





@Repository
public class BoardDaoImpl implements BoardDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String nameSpace = "com.demo.board.";
	
	@Override
	public HashMap<String, Object> noticeSelectList(int start, int end) {
	    HashMap<String, Object> resultMap = new HashMap<>();
	    HashMap<String, Object> map = new HashMap<String, Object>();
	    map.put("start", start);
	    map.put("end", end);

	    List<NoticeDto> noticeList = sqlSession.selectList(nameSpace + "noticeSelectList", map);
	    
	    resultMap.put("noticeList", noticeList);
	    // 여기에 필요한 다른 데이터들을 추가할 수 있습니다.

	    return resultMap;
	}

	@Override
	public int noticeSelectTotalCount() {
		// TODO Auto-generated method stub
		return (int)sqlSession.selectOne(nameSpace + "noticeSelectTotalCount");
	}

	@Override
	public HashMap<String, Object> inquirySelectList(int start, int end) {
		HashMap<String, Object> resultMap = new HashMap<>();
	    HashMap<String, Object> map = new HashMap<String, Object>();
	    map.put("start", start);
	    map.put("end", end);

	    List<NoticeDto> inquiryList = sqlSession.selectList(nameSpace + "inquirySelectList", map);
	    
	    resultMap.put("inquiryList", inquiryList);
	    // 여기에 필요한 다른 데이터들을 추가할 수 있습니다.

	    return resultMap;
	}

	@Override
	public int inquirySelectTotalCount() {
		// TODO Auto-generated method stub
		return (int)sqlSession.selectOne(nameSpace + "inquirySelectTotalCount");
	}

	@Override
	public HashMap<String, Object> noticeSelectOne(int no) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);
		resultMap = sqlSession.selectOne(nameSpace + "noticeSelectOne", map);
		return resultMap;
	}

	@Override
	public List<Map<String, Object>> fileSelectList(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace+ "fileSelectList", no);
	}
	

	

}
