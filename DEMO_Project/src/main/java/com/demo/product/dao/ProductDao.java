package com.demo.product.dao;

import java.util.List;
import java.util.Map;

import com.demo.product.dto.ProductDto;

public interface ProductDao {

	List<Map<String, Object>> productSelectList(int start, int end, String search, String category, String sort);

	int productSelectTotalCount();

	


}
