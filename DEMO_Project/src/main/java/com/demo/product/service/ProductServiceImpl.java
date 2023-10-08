package com.demo.product.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.demo.product.dao.ProductDao;
import com.demo.product.dto.ProductDetailDto;
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
	public List<Map<String, Object>> productSelectList
		(int start, int end, String search, String category, String sort) {
		// TODO Auto-generated method stub
		
		return productDao.productSelectList(start, end, search, category, sort);
	}

	@Override
	public int productSelectTotalCount(String search, String category) {
		// TODO Auto-generated method stub
		
		return productDao.productSelectTotalCount(search, category);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<Map<String, Object>> productImgInsert(MultipartFile multfile, String pathName) throws Exception {
		// TODO Auto-generated method stub
		int imgNo = productDao.createNewImgNo();
		
		List<Map<String, Object>> list
			= fileUtils.createFileinfo(imgNo, pathName, multfile);
		
		for (int i = 0; i < list.size(); i++) {
			productDao.insertFile(list.get(i));
			
		}
		System.out.println("insertFile완료");
		return list;
	}

	@Override
	public void productImgDelete(String storedFileName, String pathName) throws Exception {
		// TODO Auto-generated method stub
		fileUtils.fileDelete(storedFileName, pathName);
		
		productDao.DeleteFile(storedFileName);
	}


	@Override
	public int productDetailInsert(ProductDetailDto productDetailDto, String pdImgName) {
		// TODO Auto-generated method stub
		if(pdImgName == "") {
			int imgNo = productDao.selectImgNo(pdImgName);
			productDetailDto.setImgNo(imgNo);
		}
		return productDao.insertProductDetail(productDetailDto);
	}
	
	@Override
	public void productInsert(ProductDto productDto, String pImgName) {
		// TODO Auto-generated method stub
		int imgNo = productDao.selectImgNo(pImgName);
		productDto.setImgNo(imgNo);
		productDao.insertProduct(productDto);
	}

	@Override
	public Map<String, Object> selectProductOne(int no) {
		// TODO Auto-generated method stub
		
		return productDao.selectProductOne(no);
	}

	@Override
	public void productImgUpdate(String productNo, int imgNo) {
		// TODO Auto-generated method stub
		productDao.productImgUpdate(productNo, imgNo);
	}

	@Override
	public void updateProductDetail(ProductDetailDto productDetailDto) {
		// TODO Auto-generated method stub
		productDao.updateProductDetail(productDetailDto);
	}

	@Override
	public void updateProduct(ProductDto productDto) {
		// TODO Auto-generated method stub
		productDao.updateProduct(productDto);
	}

	@Override
	public boolean insertCart(Map<String, Object> productDto, int productQuantity, int memberNo) {
		// TODO Auto-generated method stub
		return productDao.insertCart(productDto, productQuantity, memberNo);
	}

	@Override
	public boolean deleteCartList(List<String> productNos, int memberNo) {
		// TODO Auto-generated method stub
		
		try {
			for (int i = 0; i < productNos.size(); i++) {
				productDao.deleteCartOne(productNos.get(i), memberNo);
			}
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public boolean deleteProductList(List<String> productNos) {
		// TODO Auto-generated method stub
		try {
			for (int i = 0; i < productNos.size(); i++) {
				productDao.deleteCartOne(productNos.get(i));
			}
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public void updateCartOne(int stock, int productNo, int memberNo) {
		// TODO Auto-generated method stub
		productDao.updateCartOne(stock, productNo, memberNo);
	}

	@Override
	public void deleteCartOne(String productNo, int memberNo) {
		// TODO Auto-generated method stub
		productDao.deleteCartOne(productNo, memberNo);
	}

	@Override
	public void updateProductStock(int productNo, int quantity) {
		// TODO Auto-generated method stub
		productDao.updateProductStock(productNo, quantity);
	}
	

	
	
}
