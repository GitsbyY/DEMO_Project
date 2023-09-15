package com.demo.member.controller;

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

import com.demo.member.dto.MemberDto;
import com.demo.member.dto.PetDto;
import com.demo.member.service.MemberService;

@Controller
public class MemberController {
	
	private static final Logger log = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	//로그인 화면으로 이동
	@RequestMapping(value = "/auth/login.do", method = RequestMethod.GET)
	public String login(HttpSession session, Model model) {
		
		log.info("Welcome MemberController login!");
		
		session.invalidate();
		
		return "auth/LoginPage";
	}
//로그인 버튼 클릭시	
	@RequestMapping(value = "/auth/loginCtr.do", method = RequestMethod.POST)
	public String loginCtr(String memberId, String memberPassword
			, HttpSession session, Model model) {
		
		log.info("Welcome MemberController loginCtr!" 
				+ memberId + ", " + memberPassword);
		
		MemberDto memberDto = memberService.memberExist(memberId, memberPassword);
		
		String viewUrl = "";
		String loginFail = "loginFail";
		if(memberDto != null) {
//				회원이 존재하면 세션에 담는다
			session.setAttribute("member", memberDto);
			
			viewUrl = "redirect:/index.jsp"; 
		}else {
			viewUrl = "auth/LoginPage";
			session.setAttribute("loginFail", loginFail);
		}			
		return viewUrl;						
	}
	
	// 로그아웃
		@RequestMapping(value = "/auth/logout.do", method = RequestMethod.GET)
		public String logout(HttpSession session, Model model) {
			log.info("Welcome MemberController logout!");
			
			session.invalidate();
			
			return "redirect:/auth/login.do";
		}
	
	// id찾기 화면으로 이동
	@RequestMapping(value = "/auth/findId.do", method = RequestMethod.GET)
	public String findId(HttpSession session, Model model) {
		
		log.info("Welcome MemberController findId!");
							
		return "auth/FindId";						
	}
	
	// id찾기
	@RequestMapping(value = "/auth/findIdCtr.do", method = RequestMethod.POST)
	public String findIdCtr(String memberEmail, String memberPhone
			, HttpSession session, Model model) {
		
		log.info("Welcome MemberController findIdCtr!" 
				+ memberEmail + ", " + memberPhone);
		
		MemberDto memberDto = memberService.memberFindId(memberEmail, memberPhone);
		
		String viewUrl = "";
		String findFail = "findFail";
		if(memberDto != null) {
//				회원이 존재하면 세션에 담는다
			session.setAttribute("member", memberDto);
			
			viewUrl = "auth/FindIdResult"; 
		}else {
			viewUrl = "auth/FindId";
			session.setAttribute("findFail", findFail);
		}			
		return viewUrl;						
	}
	
	// 비밀번호찾기 화면으로 이동
	@RequestMapping(value = "/auth/findPassword.do"
				, method = RequestMethod.GET)
	public String findPasword(HttpSession session, Model model) {
		
		log.info("Welcome MemberController findPassword!");
							
		return "auth/FindPassword";						
	}
	
	// 비밀번호 찾기
	@RequestMapping(value = "/auth/findPasswordCtr.do"
				, method = RequestMethod.POST)
	public String findPasswordCtr(String memberId, String memberEmail
			, HttpSession session, Model model) {
		
		log.info("Welcome MemberController findIdCtr!" 
				+ memberId + ", " + memberEmail);
		
		MemberDto memberDto 
			= memberService.memberFindPassword(memberId, memberEmail);
		
		String viewUrl = "";
		String findFail = "findFail";
		if(memberDto != null) {
//						회원이 존재하면 세션에 담는다
			session.setAttribute("member", memberDto);
			
			viewUrl = "auth/FindPasswordResult"; 
		}else {
			viewUrl = "auth/FindPassword";
			session.setAttribute("findFail", findFail);
		}			
		return viewUrl;						
	}
	
	//일반.do는 단순 페이지 이동
	@RequestMapping(value = "/auth/addm.do", method = RequestMethod.GET)
	public String memberViewFormAdd(Model model) {
		
		log.debug("Welcome MemberController member Add!");
		
		return "auth/JoinForm";
	}
	
	@RequestMapping(value = "/auth/checkId.do", method = RequestMethod.POST)
	@ResponseBody
	public boolean checkIdAvailability(@RequestParam("memberId") String memberId) {
	    // MemberService의 isIdAvailable 메서드를 호출하여 중복 여부를 확인
	    boolean isAvailable = memberService.isIdAvailable(memberId);
	    return isAvailable;
	}
	
	@RequestMapping(value = "/auth/addp.do", method = RequestMethod.GET)
	public String memberPetFormAdd(MemberDto memberDto, Model model) {
		log.debug("Welcome MemberController pet Add! " + memberDto);
		model.addAttribute("memberDto", memberDto);
		return "auth/JoinFormDog";
	}
	
	@RequestMapping(value = "/auth/addp.do", method = RequestMethod.POST)
	public String memberPAddCtr(MemberDto memberDto, PetDto petDto, Model model) {
		
		log.debug("Welcome MemberController pet Add2!" + "memberDto :"+memberDto+"petDto:" +petDto +"medel: "+model);
		int mno = memberService.memberInsertOne(memberDto);
		petDto.setMemberNo(mno);
		memberService.petInsertOne(petDto);
		return "auth/LoginPage";
	}
}
