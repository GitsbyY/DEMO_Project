package com.demo.product.dao;

import java.util.List;
import java.util.Map;

import com.demo.product.dto.ProductDetailDto;
import com.demo.product.dto.ProductDto;

public interface ProductDao {

	List<Map<String, Object>> productSelectList(int start, int end, String search, String category, String sort);

	int productSelectTotalCount();

	int createNewImgNo();

	void insertFile(Map<String, Object> map);

	void DeleteFile(String storedFileName);

	int selectImgNo(String pImgName);

	int insertProductDetail(ProductDetailDto productDetailDto);
	
	void insertProduct(ProductDto productDto);

	Map<String, Object> selectProductOne(int no);

	void productImgUpdate(String productNo, int imgNo);

	void updateProductDetail(ProductDetailDto productDetailDto);

	void updateProduct(ProductDto productDto);



	


}
