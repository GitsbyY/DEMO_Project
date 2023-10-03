package com.demo.order.controller;

import java.io.IOException;
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

import com.demo.member.dto.MemberDto;
import com.demo.order.dto.OrderDto;
import com.demo.order.service.OrderService;
import com.demo.util.MyPagePaging;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class OrderController {

	private static final Logger log = LoggerFactory.getLogger(OrderController.class);

	@Autowired
	private OrderService orderService;

	// 마이페이지 처음
	@RequestMapping(value = "/mypage/mypage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String myPage(HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("member");

		if (memberDto.getMemberNo() == 1) {
			return "redirect:/mypage/mypageAdmin.do";
		} else {
			return "redirect:/mypage/mypageMember.do";
		}

	}

	// 마이페이지 화면 -> 관리자
	@RequestMapping(value = "/mypage/mypageAdmin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String myPageAdmin(@RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "productName") String category, @RequestParam(defaultValue = "") String search,
			HttpSession session, Model model) {

		log.info("Welcome OrderController login!");
		int totalCount = orderService.orderSelectListTotalCount(category, search);

		MyPagePaging myPagePaging = new MyPagePaging(totalCount, curPage);

		int start = myPagePaging.getPageBegin();
		int end = myPagePaging.getPageEnd();

		List<Map<String, Object>> orderList = orderService.orderSelectList(start, end, category, search);

		HashMap<String, Object> myPagingmap = new HashMap<>();
		myPagingmap.put("totalCount", totalCount);
		myPagingmap.put("myPagePaging", myPagePaging);
		myPagingmap.put("category", category);
		myPagingmap.put("search", search);

		model.addAttribute("totalCount", totalCount);
		model.addAttribute("orderList", orderList);
		model.addAttribute("myPagingmap", myPagingmap);

		session.setAttribute("myPageAside", "order");

		return "mypage/Mypage";
	}

	// 마이페이지 화면 -> 회원
	@RequestMapping(value = "/mypage/mypageMember.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String myPageMember(@RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "productName") String category, @RequestParam(defaultValue = "") String search,
			HttpSession session, Model model) {

		MemberDto memberDto = (MemberDto) session.getAttribute("member");
		int sessionMemberNo = memberDto.getMemberNo();
		log.info("Welcome OrderController login!");
		int totalCount = orderService.orderSelectListTotalCount(category, search, sessionMemberNo);

		MyPagePaging myPagePaging = new MyPagePaging(totalCount, curPage);

		int start = myPagePaging.getPageBegin();
		int end = myPagePaging.getPageEnd();

		List<Map<String, Object>> orderList = orderService.orderSelectList(start, end, category, search,
				sessionMemberNo);

		HashMap<String, Object> myPagingmap = new HashMap<>();
		myPagingmap.put("totalCount", totalCount);
		myPagingmap.put("myPagePaging", myPagePaging);
		myPagingmap.put("category", category);
		myPagingmap.put("search", search);

		model.addAttribute("totalCount", totalCount);
		model.addAttribute("orderList", orderList);
		model.addAttribute("myPagingmap", myPagingmap);

		session.setAttribute("myPageAside", "order");

		return "mypage/MypageMember";
	}

	// 마이페이지 주문목록 상세 페이지
	@RequestMapping(value = "/mypage/MypageDetail.do", method = RequestMethod.GET)
	public String myPageDetail(int orderNo, HttpSession session, Model model) {
		log.debug("Welcome MemberController myPageDetail! ");

		Map<String, Object> orderDto = orderService.orderDetailSelectOne(orderNo);

		model.addAttribute("orderDto", orderDto);

		session.setAttribute("myPageAside", "order");

		return "mypage/MypageDetail";
	}

	// 취소 처음
	@RequestMapping(value = "/mypage/cancelPage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String myPageCancel(HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("member");

		if (memberDto.getMemberNo() == 1) {
			return "redirect:/mypage/cancelPageAdmin.do";
		} else {
			return "redirect:/mypage/cancelPageMember.do";
		}

	}

	// 취소내역 화면 -> 관리자
	@RequestMapping(value = "/mypage/cancelPageAdmin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String myPageCancelAdmin(@RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "productName") String category, @RequestParam(defaultValue = "") String search,
			HttpSession session, Model model) {

		log.info("Welcome OrderController login!");

		int totalCount = orderService.cancelSelectListTotalCount();

		MyPagePaging myPagePaging = new MyPagePaging(totalCount, curPage);

		int start = myPagePaging.getPageBegin();
		int end = myPagePaging.getPageEnd();

		List<Map<String, Object>> orderList = orderService.cancelSelectList(start, end, category, search);

		HashMap<String, Object> myPagingmap = new HashMap<>();
		myPagingmap.put("totalCount", totalCount);
		myPagingmap.put("myPagePaging", myPagePaging);
		myPagingmap.put("category", category);
		myPagingmap.put("search", search);

		model.addAttribute("totalCount", totalCount);
		model.addAttribute("orderList", orderList);
		model.addAttribute("myPagingmap", myPagingmap);

		session.setAttribute("myPageAside", "cancel");

		return "mypage/MypageCancellation";
	}
	
	// 취소내역 화면 -> 회원
		@RequestMapping(value = "/mypage/cancelPageMember.do", method = { RequestMethod.GET, RequestMethod.POST })
		public String myPageCancelMember(@RequestParam(defaultValue = "1") int curPage,
				@RequestParam(defaultValue = "productName") String category, @RequestParam(defaultValue = "") String search,
				HttpSession session, Model model) {

			log.info("Welcome OrderController login!");
			
			MemberDto memberDto = (MemberDto) session.getAttribute("member");
			int sessionMemberNo = memberDto.getMemberNo();
			
			int totalCount = orderService.cancelSelectListTotalCountMember(sessionMemberNo);

			MyPagePaging myPagePaging = new MyPagePaging(totalCount, curPage);

			int start = myPagePaging.getPageBegin();
			int end = myPagePaging.getPageEnd();

			List<Map<String, Object>> orderList = orderService.cancelSelectListMember(start, end, category, search, sessionMemberNo);

			HashMap<String, Object> myPagingmap = new HashMap<>();
			myPagingmap.put("totalCount", totalCount);
			myPagingmap.put("myPagePaging", myPagePaging);
			myPagingmap.put("category", category);
			myPagingmap.put("search", search);

			model.addAttribute("totalCount", totalCount);
			model.addAttribute("orderList", orderList);
			model.addAttribute("myPagingmap", myPagingmap);

			session.setAttribute("myPageAside", "cancel");

			return "mypage/MypageCancellationMember";
		}

	// 마이페이지 주문취소 상세 페이지
	@RequestMapping(value = "/mypage/MypageCancellationDetail.do", method = RequestMethod.GET)
	public String myPageCancelDetail(int orderNo, HttpSession session, Model model) {
		log.debug("Welcome MemberController myPageDetail! ");

		Map<String, Object> orderDto = orderService.orderCancelDetailSelectOne(orderNo);

		model.addAttribute("orderDto", orderDto);

		session.setAttribute("myPageAside", "cancel");

		return "mypage/MypageCancellationDetail";
	}

	// 주문취소
	@RequestMapping(value = "/order/orderCancelCtr.do", method = RequestMethod.POST)
	public String orderCancel(@RequestParam(defaultValue = "-1") int orderNo, HttpSession session, Model model) {
		System.out.println(orderNo);
		try {

			if (orderNo == -1) {
				// 주문번호가 누락된 경우 처리
				return "fail"; // 누락된 경우 'fail' 응답
			}

			// 주문 취소 로직을 처리하고 성공 여부를 확인합니다. upadte 와 insert 둘 다 필요하다.
			boolean isCancelled = orderService.orderCancelUpdate(orderNo);

			System.out.println(orderNo);
			if (isCancelled) {
				model.addAttribute("result", "success"); // 성공 시 'success' 값을 모델에 추가
			} else {
				model.addAttribute("result", "fail"); // 실패 시 'fail' 값을 모델에 추가
			}

			Map<String, Object> orderDto = orderService.orderDetailSelectOne(orderNo);

			model.addAttribute("orderDto", orderDto);
			session.setAttribute("myPageAside", "order");

//	        		return "redirect:/mypage/MypageDetail.do"; // 리다이렉트할 경로로 이동
			return "mypage/MypageDetail";

		} catch (Exception e) {
			e.printStackTrace();
			return "fail"; // 예외 발생 시 'fail' 응답
		}
	}
	
	@RequestMapping(value = "/paymentCart.do", method = RequestMethod.POST)
	public String paymentCart(@RequestParam("formData") String formData,
				int sumPrice, Model model)
			throws JsonParseException, JsonMappingException, IOException{
	    // JSON 문자열을 Map으로 변환
	    ObjectMapper objectMapper = new ObjectMapper();
	    Map<String, Object> data = objectMapper.readValue(formData, Map.class);

	    // Map에서 productNos를 꺼내서 사용
	    List<String> productNos = (List<String>) data.get("productNos");
	    for (int i = 0; i < productNos.size(); i++) {
			System.out.println(productNos.get(i));
		}
	    // 여기서 productNos를 사용하여 필요한 로직 수행
	    System.out.println(sumPrice);
	    model.addAttribute("productNos", productNos);
	    model.addAttribute("sumPrice", sumPrice);
	    return "shop/ShoppingPaymentCart";
	}
	
	@RequestMapping(value = "/payment.do",
			method = { RequestMethod.GET, RequestMethod.POST })
	public String payment(int productNo, int productQuantity,
			int sumPrice, Model model) {
		System.out.println("productNo: " + productNo);
		System.out.println("productQuantity: " + productQuantity);
		System.out.println("sumPrice: " + sumPrice);
		
	    model.addAttribute("productNo", productNo);
	    model.addAttribute("productQuantity", productQuantity);
	    model.addAttribute("sumPrice", sumPrice);
	    return "shop/ShoppingPayment";
	}
	
	@RequestMapping(value = "/paymentCartCtr.do", method = RequestMethod.POST)
	public String paymentCartCtr(@RequestParam("formData") String formData,
			OrderDto orderDto, HttpSession session, Model model)
			throws JsonParseException, JsonMappingException, IOException{
	    // JSON 문자열을 Map으로 변환
	    ObjectMapper objectMapper = new ObjectMapper();
	    Map<String, Object> data = objectMapper.readValue(formData, Map.class);

	    // Map에서 productNos를 꺼내서 사용
	    List<String> productNos = (List<String>) data.get("productNos");
	    
	    MemberDto memberDto
		= (MemberDto) session.getAttribute("member");
	    orderDto.setMemberNo(memberDto.getMemberNo());
	    System.out.println(orderDto);
	    
	    boolean result
	    	= orderService.insertOrderList(productNos, orderDto);
	    
	    // 여기서 productNos를 사용하여 필요한 로직 수행
	    model.addAttribute("orderDto", orderDto);
	    if(result == true) {
			return "common/successPayment";
		}else {
			return "common/failPayment";
		}
	}
	
	@RequestMapping(value = "/paymentCtr.do",
			method = {RequestMethod.POST })
	public String paymentCtr(OrderDto orderDto,
			HttpSession session, Model model) {
		System.out.println(orderDto);
		
		MemberDto memberDto
		= (MemberDto) session.getAttribute("member");
		
		orderDto.setMemberNo(memberDto.getMemberNo());
		
		boolean result = orderService.insertOrder(orderDto);
		System.out.println("orderNo: " + orderDto.getOrderNo());
		model.addAttribute("orderDto", orderDto);
		if(result == true) {
			return "common/successPayment";
		}else {
			return "common/failPayment";
		}
	    
	}
}
