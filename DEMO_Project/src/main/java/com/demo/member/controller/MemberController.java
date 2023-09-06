package com.demo.member.controller;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.demo.member.dto.MemberDto;
import com.demo.member.service.MemberService;
import com.demo.util.Paging;

@Controller
public class MemberController {
	
	private static final Logger log = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	//로그인 화면으로 이동
	@RequestMapping(value = "/auth/login.do", method = RequestMethod.GET)
	public String login(HttpSession session, Model model) {
		
		log.info("Welcome MemberController login!");
		
		return "auth/LoginForm";
	}
	
//	//로그인 버튼 클릭시 -> 리턴 내가 만들어본것.
//	@RequestMapping(value = "/auth/loginCtr.do", method = RequestMethod.POST)
//	public String loginCtr(String email, String password, 
//				HttpSession session, Model model) {
//							//매개변수는 JSP의 name과 같으면 된다.
//		log.info("Welcome MemberController loginCtr!" + email + ", " + password);
//		
//		MemberDto memberDto = memberService.memberExist(email, password);
//		
//		if(memberDto != null) {
//			//회원이 존재하면 세션에 담는다
//			session.setAttribute("member", memberDto);
//			return "redirect:/member/list.do";
//		}else {
//			return "auth/LoginFail";
//		}
//			//jsp파일로 보내는 것이 아니라 내부적으로 보낸다는 의미다.
//	}
	
	@RequestMapping(value="/auth/loginCtr.do", method = RequestMethod.POST)
	   public String loginCtr(String email, String password, 
	         HttpSession session, Model model) {
	      log.info("Welcome MemberController loginCtr!" + email +", "+ password);
	      
	      MemberDto memberDto = memberService.memberExist(email, password);
	      
	      String viewUrl="";
	      
	      if(memberDto != null) {
	         //회원존재하면 세션에담는다
	         session.setAttribute("member", memberDto);
	         viewUrl = "redirect:/member/list.do";
	      }else {
	         viewUrl =  "/auth/LoginFail";
	      }
	      
	      return viewUrl;
	   }
	
	//로그아웃
	@RequestMapping(value = "/auth/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		
		log.info("Welcome MemberController logout!");
		
		session.invalidate();
		
		
		return "redirect:/auth/login.do";
	}
	
	@RequestMapping(value = "/member/listOne.do", method = RequestMethod.GET)
	public String memberListOne(int no, Model model) {
		log.debug("Welcome MemberController memberListOne! - {}", no);
		
		Map<String, Object> map = memberService.memberSelectOne(no);
		
		MemberDto memberDto = (MemberDto)map.get("memberDto");
		
		List<Map<String, Object>> fileList 
			= (List<Map<String, Object>>)map.get("fileList");
		
		model.addAttribute("memberDto", memberDto);
		model.addAttribute("fileList", fileList);
		
		return "member/MemberListOneView";
	}
	
	@RequestMapping(value = "/member/list.do", 
			method = {RequestMethod.GET, RequestMethod.POST})
	public String memberList(@RequestParam(defaultValue = "1") int curPage, Model model) {
		//Log4j -> Log에 관련 된 프레임워크.			+를 사용하지 않고 매핑을 해준다.
		log.info("Welcome MemberController list! : {}", curPage);
		//log.info("이게 시스오의 역할을 한다.");
		//log.debug("일반적인 개발을 할 때 사용하는 레벨");
		
		int totalCount = memberService.memberSelectTotalCount();
		
		Paging memberPaging = new Paging(totalCount, curPage);
		
		int start = memberPaging.getPageBegin();
		int end = memberPaging.getPageEnd();
		
		List<MemberDto> memberList = memberService.memberSelectList(start, end);
		
		HashMap<String, Object> pagingmap = new HashMap<>();
		pagingmap.put("totalCount", totalCount);
		pagingmap.put("memberPaging", memberPaging);
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("pagingMap", pagingmap);
		
		return "member/MemberListView";
	}
	
	
	//일반.do는 단순 페이지 이동
	@RequestMapping(value = "/member/add.do", method = RequestMethod.GET)
	public String memberAdd(Model model) {
		
		log.debug("Welcome MemberController memberAdd!");
		
		return "member/MemberForm";
	}
	
	//
	@RequestMapping(value = "/member/addCtr.do", method = RequestMethod.POST)
	public String memberAdd(MemberDto memberDto, MultipartHttpServletRequest mulRequest, Model model) {
							//회원의 정보 저장		//enctype을 처리할 수 있다 파일에 대한 정보저장
		log.debug("Welcome MemberController memberAdd!" + memberDto);
		//자원관리를 무조건 해야하는 파일/?/?
		try {
			memberService.memberInsertOne(memberDto, mulRequest);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("오류 처리할 거 있으면 한다");
			e.printStackTrace();
		}		
		
		return "redirect:/member/list.do";
	}
	
	//일반.do 회원수정화면으로
	@RequestMapping(value = "/member/update.do", method = RequestMethod.GET)
	public String memberUpdate(int no, Model model) {
		
		log.info("Welcome MemberController memberUpdate!" + no);
		
		Map<String, Object> map = memberService.memberSelectOne(no);
		
		MemberDto memberDto = (MemberDto)map.get("memberDto");
	    
		List<Map<String, Object>> fileList 
			= (List<Map<String, Object>>)map.get("fileList");			
		
		// 모델에 회원 정보를 추가
	    model.addAttribute("memberDto", memberDto);
	    model.addAttribute("fileList", fileList);
		
		return "member/MemberUpdateForm";
	}
	
	//회원수정
	@RequestMapping(value ="/member/updateCtr.do", method = RequestMethod.POST)
	public String memberUpdateCtr(MemberDto memberDto
			, @RequestParam(value = "fileInx", defaultValue = "-1") int fileIdx
			, MultipartHttpServletRequest mulRequest
			, Model model) {
		
		log.info("Welcome MemberController memberUpdateCtr : {} \n fileInx : {}" 
				, memberDto, fileIdx);
		
		int resultNum = 0;
		
		try {
			resultNum = memberService.memberUpdateOne(memberDto, mulRequest, fileIdx);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		
	    return "common/successPage";
	    

	}
	
	//삭제
	@RequestMapping(value ="/member/delete.do", method = RequestMethod.GET)
	public String memberDelete(int no, Model model) {
		
		log.info("Welcome MemberController memberDelete! SUCCESS!" + no);

		memberService.memberDeleteOne(no);
		
	    return "redirect:/member/list.do";
	}
	
}
