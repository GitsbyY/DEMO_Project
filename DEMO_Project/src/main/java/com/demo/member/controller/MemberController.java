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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.mail.MailSendService;
import com.demo.member.dto.MemberDto;
import com.demo.member.dto.PetDto;
import com.demo.member.service.MemberService;
import com.demo.util.MyPagePaging;

@Controller
public class MemberController {

	private static final Logger log = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MailSendService mailSendService;

	// 로그인 화면으로 이동
	@RequestMapping(value = "/auth/login.do", method = RequestMethod.GET)
	public String login(HttpSession session, Model model) {

		log.info("Welcome MemberController login!");

		session.invalidate();
		
		return "auth/LoginPage";
	}

	// 로그인 버튼 클릭시
	@RequestMapping(value = "/auth/loginCtr.do", method = RequestMethod.POST)
	public String loginCtr(String memberId, String memberPassword, HttpSession session, Model model) {

		log.info("Welcome MemberController loginCtr!" + memberId + ", " + memberPassword);

		MemberDto memberDto = memberService.memberExist(memberId, memberPassword);

		String viewUrl = "";
		String loginFail = "loginFail";
		if (memberDto != null) {
			// 회원이 존재하면 세션에 담는다
			session.setAttribute("member", memberDto);

			viewUrl = "redirect:/index.jsp";
		} else {
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
	public String findIdCtr(String memberEmail, String memberPhone, HttpSession session, Model model) {

		log.info("Welcome MemberController findIdCtr!" + memberEmail + ", " + memberPhone);

		MemberDto memberDto = memberService.memberFindId(memberEmail, memberPhone);

		String viewUrl = "";
		String findFail = "findFail";
		if (memberDto != null) {
//            회원이 존재하면 세션에 담는다
			session.setAttribute("member", memberDto);

			viewUrl = "auth/FindIdResult";
		} else {
			viewUrl = "auth/FindId";
			session.setAttribute("findFail", findFail);
		}
		return viewUrl;
	}

	// 비밀번호찾기 화면으로 이동
	@RequestMapping(value = "/auth/findPassword.do", method = RequestMethod.GET)
	public String findPasword(HttpSession session, Model model) {

		log.info("Welcome MemberController findPassword!");

		return "auth/FindPassword";
	}
	
	//이메일 인증
   @PostMapping("/auth/emailCheck.do")
   @ResponseBody
   public String mailCheck(String email) {
      System.out.println("이메일 인증 요청이 들어옴!");
      System.out.println("이메일 인증 이메일 : " + email);
     
      return mailSendService.joinEmail(email);      
   }
   //비밀번호 찾기 아이디 유효성검사
   @PostMapping("/auth/memberCheck.do")
   @ResponseBody
   public boolean memberCheck(String memberId) {
	   System.out.println("회원 인증 요청이 들어옴!");
	   System.out.println("회원 ID : " + memberId );
	   
	   int memberIdCheck = memberService.memberCheckId(memberId);
	   if(memberIdCheck == 0) {
		   return false;
	   }else {
		   return true;
	   }
   }
   
   //아이디찾기 이메일 유효성검사
   @PostMapping("/auth/memberCheck3.do")
   @ResponseBody
   public boolean memberCheck3(String memberEmail) {
	   System.out.println("회원 인증 요청이 들어옴!");
	   System.out.println("회원 EMAIL : " + memberEmail );
	   
	   int memberIdCheck = memberService.memberCheckEmail2(memberEmail);
	   if(memberIdCheck == 0) {
		   return false;
	   }else {
		   return true;
	   }
   }
   
 //비밀번호 찾기 이메일 유효성검사
   @PostMapping("/auth/memberCheck2.do")
   @ResponseBody
   public boolean memberCheck2(String memberEmail, String memberId, HttpSession session) {
	   System.out.println("회원 인증 요청이 들어옴!");
	   System.out.println("회원 EMAIL : " + memberEmail );
	   
	   int memberIdCheck = memberService.memberCheckEmail(memberEmail, memberId);
	   
	   MemberDto memberDto = memberService.memberFindPassword(memberId, memberEmail);
	   session.setAttribute("member", memberDto);
	   
	   if(memberIdCheck == 0) {
		   return false;
	   }else {		   
		   return true;
	   }
   }
 //아이디 찾기 폰번호 유효성검사
   @PostMapping("/auth/memberCheck4.do")
   @ResponseBody
   public boolean memberCheck4(String memberEmail, String memberPhone, HttpSession session) {
	   System.out.println("회원 인증 요청이 들어옴!");
	   System.out.println("회원 EMAIL : " + memberEmail );
	   
	   int memberIdCheck = memberService.memberCheckPhone(memberEmail, memberPhone);
	   
	   MemberDto memberDto = memberService.memberFindId(memberPhone, memberEmail);
	   session.setAttribute("member", memberDto);
	   
	   if(memberIdCheck == 0) {
		   return false;
	   }else {		   
		   return true;
	   }
   }

	// 비밀번호 찾기
	@RequestMapping(value = "/auth/findPasswordCtr.do", method = RequestMethod.POST)
	public String findPasswordCtr(String memberId, String memberEmail, HttpSession session, Model model) {

		log.info("Welcome MemberController findIdCtr!" + memberId + ", " + memberEmail);
		
		return "auth/FindPasswordResult";
	}

	// 비밀번호 변경
	@RequestMapping(value = "/auth/changePassword.do", method = RequestMethod.POST)
	public String memberPwdChange(MemberDto memberDto, @RequestParam("memberNo") int memberNo
			, Model model) {
		
		log.debug("Welcome BoardController memberPwdChange!" + memberDto);

		int resultNum = 0;

		try {
			resultNum = memberService.memberPwdChange(memberDto);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return "common/PwdChangeSuccessPage";
	}

	// 일반.do는 단순 페이지 이동
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

	@RequestMapping(value = "/auth/addp.do", method = RequestMethod.POST)
	public String memberPetFormAdd(MemberDto memberDto, Model model) {
		log.debug("Welcome MemberController pet Add! " + memberDto);
		model.addAttribute("memberDto", memberDto);
		return "auth/JoinFormDog";
	}

	@RequestMapping(value = "/auth/addpCtr.do", method = RequestMethod.POST)
	public String memberPAddCtr(MemberDto memberDto, PetDto petDto, Model model) {

		log.debug("Welcome MemberController pet Add2!" + "memberDto :" + memberDto + "petDto:" + petDto + "medel: "
				+ model);
		int mno = memberService.memberInsertOne(memberDto);
		petDto.setMemberNo(mno);
		memberService.petInsertOne(petDto);
		return "auth/LoginSuccess";
	}

	// 회원관리 처음
	@RequestMapping(value = "/mypage/mypageProfile.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String myPageProfile(HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("member");

		if (memberDto.getMemberNo() == 1) {
			return "redirect:/mypage/mypageProfileAdmin.do";
		} else {
			return "redirect:/mypage/mypageProfileMember.do";
		}

	}

	// 회원정보관리 -> 관리자
	@RequestMapping(value = "/mypage/mypageProfileAdmin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String myPageProfileAdmin(@RequestParam(defaultValue = "1") int curPage, HttpSession session, Model model) {

		log.info("Welcome MemberController login!");

		int totalCount = memberService.memberSelectListTotalCount();

		MyPagePaging myPagePaging = new MyPagePaging(totalCount, curPage);

		int start = myPagePaging.getPageBegin();
		int end = myPagePaging.getPageEnd();

		List<Map<String, Object>> memberList = memberService.memberInfoSelectList(start, end);

		HashMap<String, Object> myPagingmap = new HashMap<>();
		myPagingmap.put("totalCount", totalCount);
		myPagingmap.put("myPagePaging", myPagePaging);

		model.addAttribute("totalCount", totalCount);
		model.addAttribute("memberList", memberList);
		model.addAttribute("myPagingmap", myPagingmap);

		session.setAttribute("myPageAside", "memberInfo");

		return "mypage/MypageProfile";
	}

	// 회원정보관리 -> 회원 비밀번호를 입력 해 주세요
	@RequestMapping(value = "/mypage/mypageProfileMember.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String myPageProfileMember(HttpSession session, Model model) {

		session.setAttribute("myPageAside", "memberInfo");
		return "mypage/MypageInsertPassword";
	}

	// 회원정보 상세 화면(member)
	@RequestMapping(value = "/mypage/MypageProfileEdit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String myPageProfileDetail(int memberNo, HttpSession session, Model model) {

		log.info("Welcome MemberController login!");

		Map<String, Object> memberDto = memberService.myPageProfileDetailMemberSelectOne(memberNo);

		model.addAttribute("memberDto", memberDto);

		session.setAttribute("myPageAside", "memberInfo");

		return "mypage/MypageProfileEdit";
	}

	// 회원정보 변경 
	@RequestMapping(value = "/mypage/MypageProfileEditUpdateCtr.do", method = RequestMethod.POST)
	public String memberInfoChange(MemberDto memberDto, HttpSession session, Model model) {

		System.out.println(memberDto + "MypageProfileEditUpdateCtr.do Start");

		memberService.memberInfoUpdate(memberDto);
		
		
		System.out.println(memberDto + "MypageProfileEditUpdateCtr.do Update");

		Map<String, Object> memberDtoUpdated = memberService.myPageProfileDetailMemberSelectOne(memberDto.getMemberNo());

		model.addAttribute("memberDto", memberDtoUpdated);

		session.setAttribute("myPageAside", "memberInfo");

//		  		        		return "redirect:/mypage/MypageDetail.do"; // 리다이렉트할 경로로 이동
		return "redirect:/mypage/MypageProfileEdit.do?memberNo=" + memberDto.getMemberNo();

	}
	
	// 회원정보 Pet 변경  ./MypageProfileEditPetUpdateCtr.do
		@RequestMapping(value = "/mypage/MypageProfileEditPetUpdateCtr.do", method = RequestMethod.POST)
		public String petInfoChange(@ModelAttribute("petDto")PetDto petDto, HttpSession session, Model model) {
			log.info("Welcome MemberController petInfoChange !");
			
			
				System.out.println(petDto + "MypageProfileEditUpdateCtr.do Start");
				
				memberService.petInfoUpdate(petDto);
				
				
				System.out.println(petDto + "MypageProfileEditUpdateCtr.do Start");
		

		
			
			Map<String, Object> petDtoUpdated = memberService.myPageProfileDetailPetSelectOne(petDto.getMemberNo());

			model.addAttribute("petDto",petDtoUpdated);


			session.setAttribute("myPageAside", "memberInfo");

				//return "./MypageProfileEditPet.do?memberNo=' + memberNo;// 리다이렉트할 경로로 이동
			return "redirect:/mypage/MypageProfileEditPet.do?memberNo=" + petDto.getMemberNo();
			
		}

	// 회원탈퇴   ./MypageProfileEditDeleteCtr.do  ./MypageProfileEditDeleteCtr.do
	@RequestMapping(value = "/mypage/MypageProfileEditDeleteCtr.do", method = RequestMethod.POST)
	public String memberDelete(MemberDto memberDto, HttpSession session, Model model) {

		System.out.println(memberDto);

		try {
			memberService.memberInfoDelete(memberDto);
			model.addAttribute("result", "success"); // 성공 시 'success' 값을 모델에 추가
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("result", "fail"); // 실패 시 'fail' 값을 모델에 추가
		}
		System.out.println(memberDto);
		memberDto = (MemberDto) session.getAttribute("member");
		session.setAttribute("myPageAside", "memberInfo");
		if(memberDto.getMemberNo() != 1) {
			return "redirect:/auth/logout.do";
		}else {
			return "redirect:/auth/mypageProfileAdmin.do";
		}
		// 로그인페이지로 이동 ->http://localhost:9080/DEMO_Project/auth/login.do

	}

	// 회원정보 상세 화면(pet)
	@RequestMapping(value = "/mypage/MypageProfileEditPet.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String myPageProfileDetailPet(int memberNo, HttpSession session, Model model) {

		log.info("Welcome MemberController login!");

		Map<String, Object> petDto = memberService.myPageProfileDetailPetSelectOne(memberNo);

		model.addAttribute("petDto", petDto);

		session.setAttribute("myPageAside", "memberInfo");

		return "mypage/MypageProfileEditPet";
	}

	// 마이페이지 결제 화면 처음
	@RequestMapping(value = "/mypage/mypageProfilePayment.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String myPageProfilePayment(HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("member");

		if (memberDto.getMemberNo() == 1) {
			return "redirect:/mypage/mypageProfilePaymentAdmin.do";
		} else {
			return "redirect:/mypage/MypageProfilePaymentMemberDetail.do?memberNo=" + memberDto.getMemberNo();
		}

	}

	// 마이페이지결제 화면
	@RequestMapping(value = "/mypage/mypageProfilePaymentAdmin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String myPageProfilePaymentAdmin(@RequestParam(defaultValue = "1") int curPage, HttpSession session,
			Model model) {

		log.info("Welcome MemberController login!");

		int totalCount = memberService.memberSelectListTotalCount();

		MyPagePaging myPagePaging = new MyPagePaging(totalCount, curPage);

		int start = myPagePaging.getPageBegin();
		int end = myPagePaging.getPageEnd();

		List<Map<String, Object>> memberList = memberService.memberPaymentSelectList(start, end);

		HashMap<String, Object> myPagingmap = new HashMap<>();
		myPagingmap.put("totalCount", totalCount);
		myPagingmap.put("myPagePaging", myPagePaging);

		model.addAttribute("totalCount", totalCount);
		model.addAttribute("memberList", memberList);
		model.addAttribute("myPagingmap", myPagingmap);

		session.setAttribute("myPageAside", "memberPay");

		return "mypage/MypageProfilePayment";
	}

	// 마이페이지결제 상세 화면
	@RequestMapping(value = "/mypage/MypageProfilePaymentMemberDetail.do", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String myPageProfilePaymentDetail(int memberNo, HttpSession session, Model model) {

		log.info("Welcome MemberController login!");

		Map<String, Object> memberDto = memberService.memberPaymentDeatilSelectOne(memberNo);
		List<Map<String, Object>> memberChargeDto = memberService.memberPaymentDeatilChargeSelectList(memberNo);

		model.addAttribute("memberDto", memberDto);
		model.addAttribute("memberChargeDto", memberChargeDto);

		session.setAttribute("myPageAside", "memberPay");

		return "mypage/MypageProfilePaymentMemberDetail";
	}

	// 포인트 변경
	@RequestMapping(value = "/mypage/MypageProfilePaymentMemberDetailPointCtr.do", method = RequestMethod.POST)
	public String memberPointChange(MemberDto memberDto, HttpSession session, Model model) {

		System.out.println(memberDto);

		// 포인트 변화를 추가한다. update/select
		try {
			memberService.memberPointUpdate(memberDto);
			model.addAttribute("result", "success"); // 성공 시 'success' 값을 모델에 추가
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("result", "fail"); // 실패 시 'fail' 값을 모델에 추가
		}
		System.out.println(memberDto);

		session.setAttribute("myPageAside", "memberPay");

//  	        		return "redirect:/mypage/MypageDetail.do"; // 리다이렉트할 경로로 이동
		return "redirect:/mypage/MypageProfilePaymentMemberDetail.do?memberNo=" + memberDto.getMemberNo();

	}

	// Emoney 변경
	@RequestMapping(value = "/mypage/MypageProfilePaymentMemberDetailEmoneyCtr.do", method = RequestMethod.POST)
	public String memberEmoneyChange(MemberDto memberDto, HttpSession session, Model model,
			@RequestParam(defaultValue = "0") int chargeAmount) {

		System.out.println(memberDto);
		// 포인트 변화를 추가한다. update/select
		try {
			if(chargeAmount != 0) {
				System.out.println("멤버충전이요");
				memberService.insertChargeOne(memberDto.getMemberNo(), chargeAmount);
				memberDto.setMemberEmoney(memberDto.getMemberEmoney() + chargeAmount);
			}
			memberService.memberEmoneyUpdate(memberDto);
			model.addAttribute("result", "success"); // 성공 시 'success' 값을 모델에 추가
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("result", "fail"); // 실패 시 'fail' 값을 모델에 추가
		}
		System.out.println(memberDto);
		MemberDto sessionMemberDto = (MemberDto) session.getAttribute("member");
		sessionMemberDto.setMemberEmoney(memberDto.getMemberEmoney());
		session.setAttribute("member", sessionMemberDto);
		session.setAttribute("myPageAside", "memberPay");

//  		        		return "redirect:/mypage/MypageDetail.do"; // 리다이렉트할 경로로 이동
		return "redirect:/mypage/MypageProfilePaymentMemberDetail.do?memberNo=" + memberDto.getMemberNo();

	}

	@RequestMapping(value = "/cart.do", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String cart(HttpSession session, Model model) {
		log.info("cart.do");
		
		MemberDto memberDto = (MemberDto) session.getAttribute("member");
		List<Map<String, Object>> cartList = memberService.memberSelectCartList(memberDto.getMemberNo());
		
		model.addAttribute("cartList", cartList);
		
		return "shop/Cart";

	}
	
	@ResponseBody
	@RequestMapping(value = "/cart/updateCartQuantity.do", method = RequestMethod.POST)
	public void updateProductQuantity(
			@RequestParam("memberNo") int memberNo,
			@RequestParam("productNo") int productNo,
			@RequestParam("quantity") int quantity) {
		
		log.info("updateCartQuantity.do");
		
		memberService.updateCartQuantity(memberNo, productNo, quantity);
	}
}