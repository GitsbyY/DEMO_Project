package com.demo.order.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;





@Repository
public class OrderDaoImpl implements OrderDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String nameSpace = "com.demo.order.";

	

}
