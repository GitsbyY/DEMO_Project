package com.demo.product.service;

import java.util.List;
import java.util.Map;

import com.demo.product.dto.ProductDto;

public interface ProductService {

	public List<Map<String, Object>> productSelectList();

	public List<Map<String, Object>> productFileList();

	
	
}
