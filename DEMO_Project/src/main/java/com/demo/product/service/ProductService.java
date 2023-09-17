package com.demo.product.service;

import java.util.List;
import java.util.Map;

import com.demo.product.dto.ProductDto;

public interface ProductService {

	public List<Map<String, Object>> productSelectList(int start, int end, String search, String category, String sort);

	public int productSelectTotalCount();

	
	
}
