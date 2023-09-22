package com.demo.product.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	public String login(Model model) {
		
		log.info("Shoppingadd");
		
		return "shop/Shoppingadd";
	}
	
	@ResponseBody
	@RequestMapping(value = "/shop/imgInsert.do", method = RequestMethod.POST)
    public List<Map<String, Object>> productImgInsert(@RequestParam("file") MultipartFile multfile,
    	@RequestParam("storedFileName") String storedFileName) {
		log.debug("shop/imgInsert.do file");
		
		try {
			if(storedFileName != "") {
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
	
	@RequestMapping(value="/multiImageuploader.do")
	public void multiImageuploader(HttpServletRequest request, HttpServletResponse response){
		try {
			//파일정보
			String sFileInfo = "";
			//파일명을 받는다 - 일반 원본파일명
			String sFilename = request.getHeader("file-name");
			//파일 확장자
			String sFilenameExt = sFilename.substring(sFilename.lastIndexOf(".")+1);
			//확장자를소문자로 변경
			sFilenameExt = sFilenameExt.toLowerCase();
				
			//이미지 검증 배열변수
			String[] allowFileArr = {"jpg","png","bmp","gif"};

			//확장자 체크
			int nCnt = 0;
			for(int i=0; i<allowFileArr.length; i++) {
				if(sFilenameExt.equals(allowFileArr[i])){
					nCnt++;
				}
			}

			//이미지가 아니라면
			if(nCnt == 0) {
				PrintWriter print = response.getWriter();
				print.print("NOTALLOW_"+sFilename);
				print.flush();
				print.close();
			} else {
				//디렉토리 설정 및 업로드	
				
				//파일경로
				String filePath = "C:\\DEMO\\image\\Product";
				File file = new File(filePath);
				
				if(!file.exists()) {
					file.mkdirs();
				}
				
				String sRealFileNm = "";
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
				String today= formatter.format(new java.util.Date());
				sRealFileNm = today+UUID.randomUUID().toString() + sFilename.substring(sFilename.lastIndexOf("."));
				String rlFileNm = filePath + sRealFileNm;
				
				///////////////// 서버에 파일쓰기 ///////////////// 
				InputStream inputStream = request.getInputStream();
				OutputStream outputStream=new FileOutputStream(rlFileNm);
				int numRead;
				byte bytes[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
				while((numRead = inputStream.read(bytes,0,bytes.length)) != -1){
					outputStream.write(bytes,0,numRead);
				}
				if(inputStream != null) {
					inputStream.close();
				}
				outputStream.flush();
				outputStream.close();
				
				///////////////// 이미지 /////////////////
				// 정보 출력
				sFileInfo += "&bNewLine=true";
				// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
				sFileInfo += "&sFileName="+ sFilename;
				sFileInfo += "&sFileURL="+ filePath +sRealFileNm;
				PrintWriter printWriter = response.getWriter();
				printWriter.print(sFileInfo);
				printWriter.flush();
				printWriter.close();
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
