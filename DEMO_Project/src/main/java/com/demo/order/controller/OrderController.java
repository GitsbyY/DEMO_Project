package com.demo.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.demo.member.dto.MemberDto;
import com.demo.member.service.MemberService;
import com.demo.order.dto.OrderCancelDto;
import com.demo.order.dto.OrderDto;
import com.demo.order.service.OrderService;
import com.demo.util.MyPagePaging;

@Controller
public class OrderController {

	private static final Logger log = LoggerFactory.getLogger(OrderController.class);

	@Autowired
	private OrderService orderService;
	@Autowired
	private MemberService memberService;

	// 마이페이지 화면
	@RequestMapping(value = "/mypage/mypage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String myPage(@RequestParam(defaultValue = "1") int curPage, 
						@RequestParam(defaultValue = "productName") String category, 
						@RequestParam(defaultValue = "") String search,
						HttpSession session, Model model) {

		log.info("Welcome OrderController login!");

		int totalCount = orderService.orderSelectListTotalCount();

		MyPagePaging myPagePaging = new MyPagePaging(totalCount, curPage);

		int start = myPagePaging.getPageBegin();
		int end = myPagePaging.getPageEnd();

		List<Map<String, Object>> orderList = orderService.orderSelectList(start, end, category, search); 
		
//		if(!category.isEmpty() && !search.isEmpty()) {
//			orderList = orderService.orderSelectList(start, end, category, search);
//		}else {
//			orderList = orderService.orderSelectList(start, end);
//		}
		
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

	// 마이페이지 주문목록 상세 페이지
	@RequestMapping(value = "/mypage/MypageDetail.do", method = RequestMethod.GET)
	public String myPageDetail(int orderNo, HttpSession session, Model model) {
		log.debug("Welcome MemberController myPageDetail! ");

		Map<String, Object> orderDto = orderService.orderDetailSelectOne(orderNo);

		model.addAttribute("orderDto", orderDto);
		
		session.setAttribute("myPageAside", "order");
		
		return "mypage/MypageDetail";
	}

	// 주문취소
	@RequestMapping(value = "/order/orderCancelCtr.do", method = RequestMethod.POST)
	public String orderCancel(@RequestParam(defaultValue = "-1") int orderNo,HttpSession session, Model model) {
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

//        		return "redirect:/mypage/MypageDetail.do"; // 리다이렉트할 경로로 이동
			return "mypage/MypageDetail";

		} catch (Exception e) {
			e.printStackTrace();
			return "fail"; // 예외 발생 시 'fail' 응답
		}
	}

	// 취소내역 화면
	@RequestMapping(value = "/mypage/cancelPage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String myPageCancel(@RequestParam(defaultValue = "1") int curPage,
							@RequestParam(defaultValue = "productName") String category, 
							@RequestParam(defaultValue = "") String search, 
							HttpSession session, Model model) {

		log.info("Welcome OrderController login!");

		int totalCount = orderService.cancelSelectListTotalCount();

		MyPagePaging myPagePaging = new MyPagePaging(totalCount, curPage);

		int start = myPagePaging.getPageBegin();
		int end = 0;
		
		if(myPagePaging.getPageEnd()>totalCount) {
			end = totalCount;
		}else {
			end = myPagePaging.getPageEnd();
		}
				
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

	// 마이페이지 주문취소 상세 페이지
	@RequestMapping(value = "/mypage/MypageCancellationDetail.do", method = RequestMethod.GET)
	public String myPageCancelDetail(int orderNo, HttpSession session, Model model) {
		log.debug("Welcome MemberController myPageDetail! ");

		Map<String, Object> orderDto = orderService.orderCancelDetailSelectOne(orderNo);

		model.addAttribute("orderDto", orderDto);
		
		session.setAttribute("myPageAside", "cancel");
		
		return "mypage/MypageCancellationDetail";
	}

}
