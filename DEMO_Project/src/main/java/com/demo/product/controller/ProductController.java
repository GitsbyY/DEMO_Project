package com.demo.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.product.service.ProductService;
import com.demo.util.ShopPaging;

@Controller
public class ProductController {

	private static final Logger log = LoggerFactory.getLogger(ProductController.class);

	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/shop.do",
			method = { RequestMethod.GET, RequestMethod.POST })
	public String login(@RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "") String search,
			@RequestParam(defaultValue = "") String category,
			@RequestParam(defaultValue = "PRODUCT_PRICE ASC") String sort,
			Model model) {

		log.info("shop/ShoppingMall" + sort);

		int totalCount = productService.productSelectTotalCount();

		ShopPaging shopPaging = new ShopPaging(totalCount, curPage);

		int start = shopPaging.getPageBegin();
		int end = shopPaging.getPageEnd();

		List<Map<String, Object>> productList
			= productService.productSelectList(start, end, search, category, sort);

		HashMap<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("shopPaging", shopPaging);
		pagingMap.put("search", search);
		pagingMap.put("category", category);
		pagingMap.put("sort", sort);

		model.addAttribute("productList", productList);
		model.addAttribute("pagingMap", pagingMap);

		return "shop/ShoppingMall";
	}

}
