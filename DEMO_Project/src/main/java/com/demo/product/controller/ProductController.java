package com.demo.product.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.product.dto.ProductDto;
import com.demo.product.service.ProductService;

@Controller
public class ProductController {
	
	private static final Logger log = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ProductService productService;
	//로그인 화면으로 이동
		@RequestMapping(value = "/shop.do", method = RequestMethod.GET)
		public String login(HttpSession session, Model model) {
			
			log.info("shop/ShoppingMall");
			
			List<ProductDto> productList = productService.productSelectList();
			
			model.addAttribute("productList", productList);
			
			List<Map<String, Object>> imgList = productService.productFileList();
			
//			List<Map<String, Object>> fileList 
//				= (List<Map<String, Object>>)map.get("fileList");
//			
//			model.addAttribute("memberDto", memberDto);
//			model.addAttribute("fileList", fileList);
			
			return "shop/ShoppingMall";
		}
		
}
