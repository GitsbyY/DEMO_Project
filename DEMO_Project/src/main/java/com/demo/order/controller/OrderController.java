package com.demo.order.controller;

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

import com.demo.member.dto.MemberDto;
import com.demo.member.service.MemberService;
import com.demo.order.dto.OrderDto;
import com.demo.order.service.OrderService;


@Controller
public class OrderController {

	private static final Logger log = LoggerFactory.getLogger(OrderController.class);

	@Autowired
	private OrderService orderService;
	@Autowired
	private MemberService memberService;

	// 로그인 화면으로 이동
	@RequestMapping(value = "/mypage/mypage.do", method = RequestMethod.GET)
	public String myPage(HttpSession session, Model model) {

		log.info("Welcome OrderController login!");
		List<Map<String, Object>> orderList = orderService.orderSelectList();
		
		model.addAttribute("orderList", orderList);
		
		return "mypage/Mypage";
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
//		@RequestMapping(value = "/auth/addp.do", method = RequestMethod.GET)
//		public String memberPetFormAdd(MemberDto memberDto, Model model) {
//			log.debug("Welcome MemberController pet Add! " + memberDto);
//			model.addAttribute("memberDto", memberDto);
//			return "auth/JoinFormDog";
//		}
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
