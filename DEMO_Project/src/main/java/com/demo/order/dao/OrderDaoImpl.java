package com.demo.order.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;





@Repository
public class OrderDaoImpl implements OrderDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String nameSpace = "com.demo.order.";

	@Override
	public List<Map<String, Object>> orderSelectList(int start, int end) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		return sqlSession.selectList(nameSpace + "orderSelectList", map);
	}

	@Override
	public Map<String, Object> orderDetailSelectOne(int orderNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + "orderDetailSelectOne", orderNo);
	}

	@Override
	public int orderSelectListTotalCount() {
		// TODO Auto-generated method stub
		return (int)sqlSession.selectOne(nameSpace + "orderSelectListTotalCount");
	}

	

}
