package com.demo.product.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.product.dao.ProductDao;
import com.demo.product.dto.ProductDto;
import com.demo.util.FileUtils;

@Service
public class ProductServiceImpl implements ProductService{
	//bean에 등록하는 것. 객체 생성과 같다.
	
	private static final Logger log = LoggerFactory.getLogger(ProductServiceImpl.class);
	
	@Autowired
	public ProductDao productDao;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;

	@Override
	public List<ProductDto> productSelectList() {
		// TODO Auto-generated method stub
		
		return productDao.productSelectList();
	}

	@Override
	public List<Map<String, Object>> productFileList() {
		// TODO Auto-generated method stub
		
		return productDao.productFileList();
	}
	
	

	
	
}
