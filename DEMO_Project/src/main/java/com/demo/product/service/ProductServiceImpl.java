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
	public int productSelectTotalCount() {
		// TODO Auto-generated method stub
		
		return productDao.productSelectTotalCount();
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
		
		return list;
	}
	
	

	
	
}
