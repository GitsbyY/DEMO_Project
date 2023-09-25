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
	public List<Map<String, Object>> orderSelectList(int start, int end, String category, String search) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();

		try {
			Integer.parseInt(search);
		} catch (Exception e) {
			// TODO: handle exception
			search = "";
		}
		map.put("search", search);
		map.put("start", start);
		map.put("end", end);
		map.put("category", category);
		
		return sqlSession.selectList(nameSpace + "orderSelectList", map);
	}

	@Override
	public Map<String, Object> orderDetailSelectOne(int orderNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + "orderDetailSelectOne", orderNo);
	}

	@Override
	public int orderSelectListTotalCount(String category, String search) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			Integer.parseInt(search);
		} catch (Exception e) {
			// TODO: handle exception
			search = "";
		}
		map.put("search", search);
		map.put("category", category);
		
		return (int)sqlSession.selectOne(nameSpace + "orderSelectListTotalCount", map);
	}

	@Override
	public int orderCancelUpdate(int orderNo) {
		// TODO Auto-generated method stub
		return (int)sqlSession.update(nameSpace + "orderCancelUpdate", orderNo);
	}

	@Override
	public int orderCancelInsert(int orderNo) {
		// TODO Auto-generated method stub
		return (int)sqlSession.insert(nameSpace + "orderCancelInsert", orderNo);
	}

	@Override
	public int cancelSelectListTotalCount() {
		// TODO Auto-generated method stub
		return (int)sqlSession.selectOne(nameSpace + "cancelSelectListTotalCount");
	}

	@Override
	public List<Map<String, Object>> cancelSelectList(int start, int end, String category, String search) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("start", start);
		map.put("end", end);
		map.put("category", category);
		
		return sqlSession.selectList(nameSpace + "cancelSelectList", map);
	}

	@Override
	public Map<String, Object> orderCancelDetailSelectOne(int orderNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + "orderCancelDetailSelectOne", orderNo);
	}

	

}
