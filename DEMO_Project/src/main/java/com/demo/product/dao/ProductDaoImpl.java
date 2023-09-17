package com.demo.product.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.demo.product.dto.ProductDto;

@Repository
public class ProductDaoImpl implements ProductDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String nameSpace = "com.demo.product.";

	@Override
	public List<Map<String, Object>> productSelectList
		(int start, int end, String search, String category, String sort) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("search", search);
		map.put("category", category);
		map.put("sort", sort);
		
		System.out.println(sort);
		
		return sqlSession.selectList(nameSpace + "productSelectList", map);
	}

	@Override
	public int productSelectTotalCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + "productSelectTotalCount");
	}




	

}
