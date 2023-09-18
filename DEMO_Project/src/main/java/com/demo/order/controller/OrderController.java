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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.member.dto.MemberDto;
import com.demo.member.service.MemberService;
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
	@RequestMapping(value = "/mypage/mypage.do", method = RequestMethod.GET)
	public String myPage(@RequestParam(defaultValue = "2") int curPage, HttpSession session, Model model) {

		log.info("Welcome OrderController login!");
		
		int totalCount = orderService.orderSelectListTotalCount();
		
		MyPagePaging myPagePaging = new MyPagePaging(totalCount, curPage);
		
		int start = myPagePaging.getPageBegin();
		int end = myPagePaging.getPageEnd();
		
		List<Map<String, Object>> orderList = orderService.orderSelectList(start, end);
		
		HashMap<String, Object> myPagingmap = new HashMap<>();
		myPagingmap.put("totalCount", totalCount);
		myPagingmap.put("myPagePaging", myPagePaging);
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("myPagingmap", myPagingmap);
		return "mypage/Mypage";
	}
	
	//마이페이지 주문목록 상세 페이지
	@RequestMapping(value = "/mypage/MypageDetail.do", method = RequestMethod.GET)
	public String myPageDetail(Model model, int orderNo) {
		log.debug("Welcome MemberController myPageDetail! ");
		
		Map<String, Object> orderDto = orderService.orderDetailSelectOne(orderNo);
		
		model.addAttribute("orderDto", orderDto);
		
		return "mypage/MypageDetail";
	}
	
	
//		
//		@RequestMapping(value = "/auth/checkId.do", method = RequestMethod.POST)
//		@ResponseBody
//		public boolean checkIdAvailability(@RequestParam("memberId") String memberId) {
//		    // MemberService의 isIdAvailable 메서드를 호출하여 중복 여부를 확인
//		    boolean isAvailable = memberService.isIdAvailable(memberId);
//		    return isAvailable;
//		}
//		

//		
//		@RequestMapping(value = "/auth/addp.do", method = RequestMethod.POST)
//		public String memberPAddCtr(MemberDto memberDto, PetDto petDto, Model model) {
//			
//			log.debug("Welcome MemberController pet Add2!" + "memberDto :"+memberDto+"petDto:" +petDto +"medel: "+model);
//			int mno = memberService.memberInsertOne(memberDto);
//			petDto.setMemberNo(mno);
//			memberService.petInsertOne(petDto);
//			return "auth/LoginPage";
//		}
}
