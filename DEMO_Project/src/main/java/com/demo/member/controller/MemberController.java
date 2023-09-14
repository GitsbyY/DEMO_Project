package com.demo.member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
			
			return "auth/LoginPage";
		}
		
		//일반.do는 단순 페이지 이동
		@RequestMapping(value = "/auth/addm.do", method = RequestMethod.GET)
		public String memberViewFormAdd(Model model) {
			
			log.debug("Welcome MemberController member Add!");
			
			return "auth/JoinForm";
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
			return "../";
		}
}
