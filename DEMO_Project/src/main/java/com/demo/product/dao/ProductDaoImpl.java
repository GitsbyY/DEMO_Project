package com.demo.product.dao;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.demo.product.dto.ProductDetailDto;
import com.demo.product.dto.ProductDto;

@Repository
public class ProductDaoImpl implements ProductDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String nameSpace = "com.demo.product.";

	@Override
	public List<Map<String, Object>> productSelectList
		(int start, int end, String search, String category, String sort) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("search", search);
		map.put("category", category);
		map.put("sort", sort);
		
		return sqlSession.selectList(nameSpace + "productSelectList", map);
	}

	@Override
	public int productSelectTotalCount(String search, String category) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("category", category);
		return sqlSession.selectOne(nameSpace + "productSelectTotalCount", map);
	}

	@Override
	public int createNewImgNo() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + "createNewImgNo");
	}

	@Override
	public void insertFile(Map<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.insert(nameSpace + "insertFile", map);
	}

	@Override
	public void DeleteFile(String storedFileName) {
		// TODO Auto-generated method stub
		sqlSession.delete(nameSpace + "deleteFile", storedFileName);
	}

	@Override
	public int selectImgNo(String pImgName) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + "selectImgNo" ,pImgName);
	}

	@Override
	public int insertProductDetail(ProductDetailDto productDetailDto) {
		// TODO Auto-generated method stub
		sqlSession.insert(nameSpace + "insertProductDetail", productDetailDto);
		return productDetailDto.getProductDetailNo();
	}

	@Override
	public void insertProduct(ProductDto productDto) {
		// TODO Auto-generated method stub
		sqlSession.insert(nameSpace + "insertProduct", productDto);
	}

	@Override
	public Map<String, Object> selectProductOne(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + "selectProductOne", no);
	}

	@Override
	public void productImgUpdate(String productNo, int imgNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productNo", productNo);
		map.put("imgNo", imgNo);
		sqlSession.update(nameSpace + "productImgUpdate", map);
	}

	@Override
	public void updateProductDetail(ProductDetailDto productDetailDto) {
		// TODO Auto-generated method stub
		sqlSession.update(nameSpace + "updateProductDetail", productDetailDto);
	}

	@Override
	public void updateProduct(ProductDto productDto) {
		// TODO Auto-generated method stub
		sqlSession.update(nameSpace + "updateProduct", productDto);
	}

	@Override
	public boolean insertCart(Map<String, Object> productDto, int productQuantity, int memberNo) {
		// TODO Auto-generated method stub
		productDto.put("productQuantity", productQuantity);
		productDto.put("memberNo", memberNo);
		productDto.put("PRODUCT_NO", ((BigDecimal)productDto.get("PRODUCT_NO")).intValue());
		productDto.put("PRODUCT_PRICE", ((BigDecimal)productDto.get("PRODUCT_PRICE")).intValue());
		try {
			sqlSession.insert(nameSpace + "insertCart", productDto);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public void deleteCartOne(String productNoStr, int memberNo) {
		// TODO Auto-generated method stub
		int productNo = Integer.parseInt(productNoStr);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productNo", productNo);
		map.put("memberNo", memberNo);
		sqlSession.update(nameSpace + "deleteCartOne", map);
	}

	@Override
	public void deleteCartOne(String productNoStr) {
		// TODO Auto-generated method stub
		int productNo = Integer.parseInt(productNoStr);
		sqlSession.update(nameSpace + "deleteProductOne", productNo);
	}

	@Override
	public void updateCartOne(int stock, int productNo, int memberNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stock", stock);
		map.put("productNo", productNo);
		map.put("memberNo", memberNo);
		sqlSession.update(nameSpace + "updateCartOne", map);
	}

	

}
