package com.demo.product.dao;

import java.util.List;
import java.util.Map;

import com.demo.product.dto.ProductDto;

public interface ProductDao {

	List<Map<String, Object>> productSelectList();

	List<Map<String, Object>> productFileList();

	


}
