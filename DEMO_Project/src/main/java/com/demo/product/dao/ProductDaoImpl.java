package com.demo.product.dao;

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
	public List<ProductDto> productSelectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + "productSelectList");
	}

	@Override
	public List<Map<String, Object>> productFileList() {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList(nameSpace + "productFileList");
	}




	

}
