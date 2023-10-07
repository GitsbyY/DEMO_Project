package com.demo.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.demo.product.dto.ProductDetailDto;
import com.demo.product.dto.ProductDto;

public interface ProductService {

	public List<Map<String, Object>> productSelectList(int start, int end, String search, String category, String sort);

	public int productSelectTotalCount(String search, String category);

	public List<Map<String, Object>> productImgInsert(MultipartFile multfile, String pathName) throws Exception;

	public void productImgDelete(String storedFileName, String pathName) throws Exception;

	public void productInsert(ProductDto productDto, String pImgName);

	public int productDetailInsert(ProductDetailDto productDetailDto, String pdImgName);

	public Map<String, Object> selectProductOne(int no);

	public void productImgUpdate(String productNo, int imgNo);

	public void updateProductDetail(ProductDetailDto productDetailDto);

	public void updateProduct(ProductDto productDto);

	public boolean insertCart(Map<String, Object> productDto, int productQuantity, int memberNo);

	public boolean deleteCartList(List<String> productNos, int memberNo);

	public boolean deleteProductList(List<String> productNos);

	public void updateCartOne(int stock, int productNo, int memberNo);

	public void deleteCartOne(String productNo, int memberNo);


	
	
}
