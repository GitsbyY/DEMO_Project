package com.demo.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.demo.product.dto.ProductDto;

public interface ProductService {

	public List<Map<String, Object>> productSelectList(int start, int end, String search, String category, String sort);

	public int productSelectTotalCount();

	public List<Map<String, Object>> productImgInsert(MultipartFile multfile, String pathName) throws Exception;


	
	
}
