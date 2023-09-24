package com.demo.product.controller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.demo.product.dto.ProductDetailDto;
import com.demo.product.dto.ProductDto;
import com.demo.product.service.ProductService;
import com.demo.util.ShopPaging;

@Controller
public class ProductController {

	private static final Logger log = LoggerFactory.getLogger(ProductController.class);

	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/shop.do",
			method = { RequestMethod.GET, RequestMethod.POST })
	public String viewProduct(@RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "") String search,
			@RequestParam(defaultValue = "") String category,
			@RequestParam(defaultValue = "PRODUCT_PRICE ASC") String sort,
			HttpSession session, Model model) {

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
		
		session.removeAttribute("customAside");
		return "shop/ShoppingMall";
	}

	@RequestMapping(value = "/shop/add.do", method = RequestMethod.GET)
	public String addProduct(Model model) {
		
		log.info("Shoppingadd");
		
		return "shop/AddProduct";
	}
	
	@ResponseBody
	@RequestMapping(value = "/shop/imgInsert.do", method = RequestMethod.POST)
    public List<Map<String, Object>> productImgInsert(@RequestParam("file") MultipartFile multfile,
    	@RequestParam("storedFileName") String storedFileName) {
		log.debug("shop/imgInsert.do file");
		System.out.println(storedFileName);
		try {
			if(!storedFileName.isEmpty()) {
				productService.productImgDelete(storedFileName, "Product");
			}
			List<Map<String, Object>> fileList =
					productService.productImgInsert(multfile, "Product");
			System.out.println(fileList.toString());
			return fileList;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("오류 처리할 거 있으면 한다");
			e.printStackTrace();
			return null;
		}		
		
    }
	
	@ResponseBody
	@RequestMapping(value = "/shop/imgUpdate.do", method = RequestMethod.POST)
    public List<Map<String, Object>> productImgUpdate(@RequestParam("file") MultipartFile multfile,
    	@RequestParam("storedFileName") String storedFileName,
    	@RequestParam("productNo") String productNo) {
		log.debug("shop/imgUpdate.do file");
		System.out.println(storedFileName);
		try {
			List<Map<String, Object>> fileList =
					productService.productImgInsert(multfile, "Product");
			int imgNo = (int) fileList.get(0).get("imgNo");
			System.out.println("???????" + imgNo);
			productService.productImgUpdate(productNo, imgNo);
			if(!storedFileName.isEmpty()) {
				productService.productImgDelete(storedFileName, "Product");
			}
			System.out.println(fileList.toString());
			return fileList;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("오류 처리할 거 있으면 한다");
			e.printStackTrace();
			return null;
		}		
		
    }
	
    @RequestMapping(value = "/shop/addCtr.do", method = RequestMethod.POST)
    public String productImgInsert(String pImgName, String pdImgName,
    		ProductDto productDto, ProductDetailDto productDetailDto) {
		log.debug("shop/imgInsert.do file");
		
		int productDetailNo = productService.productDetailInsert(productDetailDto, pdImgName);
		productDto.setProductDetailNo(productDetailNo);
		productService.productInsert(productDto, pImgName);
		
		return "common/successShopAdd";
    }
    
    @RequestMapping(value = "/shop/viewProduct.do", method = RequestMethod.GET)
	public String viewProduct(int no, Model model) {
		
    	Map<String,Object> productDto = productService.selectProductOne(no);
    	
		log.info("ShoppingView");
		
		model.addAttribute("productDto", productDto);
		
		return "shop/ViewProduct";
	}
    
    @RequestMapping(value = "/shop/updateCtr.do", method = RequestMethod.POST)
    public String productUpdate(String pdImgName,
    		ProductDto productDto, ProductDetailDto productDetailDto) {
		log.debug("shop/update.do file");
		System.out.println(productDetailDto.getProductDetailNo());
		System.out.println(productDto.getProductDetailNo());
		productDetailDto.setProductDetailNo(productDto.getProductDetailNo());
		productService.updateProductDetail(productDetailDto);
		productService.updateProduct(productDto);
		
		return "common/successShopAdd";
    }
}
