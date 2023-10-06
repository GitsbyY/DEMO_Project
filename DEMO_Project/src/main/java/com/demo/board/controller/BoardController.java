package com.demo.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.demo.board.dto.InquiryDto;
import com.demo.board.dto.NoticeDto;
import com.demo.board.dto.NoticeReplyDto;
import com.demo.board.dto.ReplyDto;
import com.demo.board.dto.ReviewDto;
import com.demo.board.dto.ReviewReplyDto;
import com.demo.board.service.BoardService;
import com.demo.member.dto.MemberDto;
import com.demo.util.BoardPaging;

@Controller
public class BoardController {

   private static final Logger log = LoggerFactory.getLogger(BoardController.class);
   
   @Autowired
   private BoardService boardService;

   // 공지사항 화면으로 이동
   @RequestMapping(value = "/board/announcement.do", 
         method = {RequestMethod.GET, RequestMethod.POST})
   public String noticeList(@RequestParam(defaultValue = "1") int curPage, Model model
         , HttpSession session) {
      // Log4j 
      log.info("Welcome BoardController list!: {}", curPage);
         
      int totalCount = boardService.noticeSelectTotalCount();
      
      BoardPaging boardPaging = new BoardPaging(totalCount, curPage);
      
      int start = boardPaging.getPageBegin();
      int end = boardPaging.getPageEnd();
      
      Map<String, Object> noticeList = boardService.noticeSelectList(start, end);
      List<NoticeDto> noticeDtoList = (List<NoticeDto>) noticeList.get("noticeList");
      
      HashMap<String, Object> pagingMap = new HashMap<>();
      pagingMap.put("totalCount", totalCount);
      pagingMap.put("boardPaging", boardPaging);
      
      model.addAttribute("noticeDtoList", noticeDtoList);
      model.addAttribute("pagingMap", pagingMap);
      
      session.setAttribute("customAside", "announcement");
      
      return "board/Announcement";
   }
   // 상담문의 화면으로 이동
   @RequestMapping(value = "/board/customerService.do", 
         method = {RequestMethod.GET, RequestMethod.POST})
   public String inquiryList(@RequestParam(defaultValue = "1") int curPage, Model model
         , HttpSession session) {
      // Log4j 
      log.info("Welcome BoardController list!: {}", curPage);
         
      int totalCount = boardService.inquirySelectTotalCount();
      
      BoardPaging boardPaging = new BoardPaging(totalCount, curPage);
      
      int start = boardPaging.getPageBegin();
      int end = boardPaging.getPageEnd();
      
      Map<String, Object> inquiryList = boardService.inquirySelectList(start, end);
      List<InquiryDto> inquiryDtoList = (List<InquiryDto>) inquiryList.get("inquiryList");
      
      HashMap<String, Object> pagingMap = new HashMap<>();
      pagingMap.put("totalCount", totalCount);
      pagingMap.put("boardPaging", boardPaging);
      
      model.addAttribute("inquiryDtoList", inquiryDtoList);
      model.addAttribute("pagingMap", pagingMap);
      
      session.setAttribute("customAside", "inquiry");
      
      return "board/CustomerService";
   }
   
   // 후기남겨요 화면으로 이동
   @RequestMapping(value = "/board/review.do", 
         method = {RequestMethod.GET, RequestMethod.POST})
   public String reviewList(@RequestParam(defaultValue = "1") int curPage, 
		@RequestParam(defaultValue = "") String search,
		@RequestParam(defaultValue = "PRODUCT_NAME") String select,
		Model model, HttpSession session) {
      // Log4j 
      log.info("Welcome BoardController review!: {}", curPage + ", " + search + ", " + select);
         
      int totalCount = boardService.reviewSelectTotalCount(search, select);
      
      BoardPaging boardPaging = new BoardPaging(totalCount, curPage);
      
      int start = boardPaging.getPageBegin();
      int end = boardPaging.getPageEnd();
      
      Map<String, Object> reviewList 
      	= boardService.reviewSelectList(start, end, search, select);
      
      List<ReviewDto> reviewDtoList = (List<ReviewDto>) reviewList.get("reviewList");
      
      HashMap<String, Object> pagingMap = new HashMap<>();
      pagingMap.put("totalCount", totalCount);
      pagingMap.put("boardPaging", boardPaging);
      pagingMap.put("search", search);
      pagingMap.put("select", select);
      
      model.addAttribute("reviewDtoList", reviewDtoList);
      model.addAttribute("pagingMap", pagingMap);
      
      session.setAttribute("customAside", "review");
//      session.setAttribute("review", reviewDtoList);
      
      return "board/Review";
   }
   // 공지사항 상세보기
   @RequestMapping(value = "/board/listOne.do", method = RequestMethod.GET)
   public String noticeSelectOne(@RequestParam("no") int no, Model model) {
      log.debug("Welcome BoardController noticelistOne! - {}" + no);
      
      Map<String, Object> resultMap = boardService.noticeSelectOne(no);
      
      Map<String, Object> noticeDto 
      = (Map<String, Object>) resultMap.get("noticeDto");
            
      List<Map<String, Object>> fileList 
         = (List<Map<String, Object>>) resultMap.get("fileList");
      
      model.addAttribute("noticeDto", noticeDto);
      model.addAttribute("fileList", fileList);
      
      List<NoticeReplyDto> reply = null;
      reply = boardService.noticeReplylist(no);
      model.addAttribute("reply", reply);
                      
      return "board/AnnouncementDetail";
   }
   // 1:1 상담하기 상세보기
   @RequestMapping(value = "/board/listOne2.do", method = RequestMethod.GET)
   public String inquirySelectOne(int no, Model model) {
      log.debug("Welcome BoardController inquirylistOne! - {}" + no);
      
      Map<String, Object> resultMap = boardService.inquirySelectOne(no);
      
      Map<String, Object> inquiryDto 
      = (Map<String, Object>) resultMap.get("inquiryDto");
      
      Map<String, Object> replyDto 
      = (Map<String, Object>) resultMap.get("replyDto");
            
      List<Map<String, Object>> fileList 
         = (List<Map<String, Object>>) resultMap.get("fileList");
      
      model.addAttribute("inquiryDto", inquiryDto);
      model.addAttribute("replyDto", replyDto);
      model.addAttribute("fileList", fileList);
            
      return "board/CustomerServiceDetail";
   }
   
   // 후기남겨요 상세보기
   @RequestMapping(value = "/board/listOne3.do", method = RequestMethod.GET)
   public String reviewSelectOne(@RequestParam("no") int no, Model model, HttpSession session) {
      log.debug("Welcome BoardController reviewlistOne! - {}" + no);
      
      Map<String, Object> resultMap = boardService.reviewSelectOne(no);
      
      Map<String, Object> reviewDto 
      = (Map<String, Object>) resultMap.get("reviewDto");
            
      List<Map<String, Object>> fileList 
         = (List<Map<String, Object>>) resultMap.get("fileList");
      
      model.addAttribute("reviewDto", reviewDto);
      model.addAttribute("fileList", fileList);
      
      List<ReviewReplyDto> reply = null;
      reply = boardService.list(no);
      model.addAttribute("reply", reply);
            
      return "board/ReviewDetail";
   }
   // 공지사항 작성 페이지 이동
   @RequestMapping(value = "/board/noticeadd.do", method = RequestMethod.GET)
   public String noticeAdd(Model model) {
      log.debug("Welcome BoardController noticeAdd!");
      
      return "board/AddNotice";
   }
   
   // 후기남겨요 작성 페이지 이동
   @RequestMapping(value = "/board/reviewadd.do", method = RequestMethod.GET)
   public String reviewAdd(@RequestParam(defaultValue = "") String productName
		   ,Model model, HttpSession session) {
      log.debug("Welcome BoardController reviewAdd!");
      System.out.println(productName);
      MemberDto memberDto = (MemberDto) session.getAttribute("member");
      
      int memberNo = memberDto.getMemberNo();
           
//      Map<String, Object> memberInfo = boardService.memberInfo(memberNo);
      
      List<MemberDto> memberInfoList = boardService.memberInfoList(memberNo);
      
      model.addAttribute("memberInfoList", memberInfoList);
      model.addAttribute("productName", productName);

      return "board/AddReview";
   }

   
   // 1:1 상담문의 작성 페이지 이동
   @RequestMapping(value = "/board/inquiryadd.do", method = RequestMethod.GET)
   public String inquiryAdd(Model model) {
      log.debug("Welcome BoardController inquiryAdd!");
      
      return "board/AddInquiry";
   }
   
	// 후기남겨요 댓글 작성
	@RequestMapping(value = "/board/write.do", method = RequestMethod.POST)
	public String reviewReplyWrite(ReviewReplyDto reviewReplyDto) throws Exception {
		
		boardService.reviewReplyWrite(reviewReplyDto);
		
		return "redirect:/board/listOne3.do?no=" + reviewReplyDto.getReviewNo();
	}
	
	// 공지사항 댓글 작성
	@RequestMapping(value = "/board/noticeReplyWrite.do", method = RequestMethod.POST)
	public String noticeReplyWrite(NoticeReplyDto noticeReplyDto) throws Exception {
		
		boardService.noticeReplyWrite(noticeReplyDto);
		
		return "redirect:/board/listOne.do?no=" + noticeReplyDto.getNoticeNo();
	}
   
   // 1:1문의 답변 등록하기
   @RequestMapping(value = "/board/inquiryReplyddCtr.do", method = RequestMethod.POST)
   public String inquiryReplyAdd(ReplyDto replyDto, MultipartHttpServletRequest mulRequest
         ,Model model) {
      log.debug("Welcome BoardController replyDtoAddCtr! " + replyDto);
      
      try {
         boardService.replyInsertOne(replyDto, mulRequest);
         
      } catch (Exception e) {
         // TODO: handle exception
         System.out.println("오류 처리할거 있음 한다");
         e.printStackTrace();
      }
            
      return "common/InquiryReplySuccessPage";
   }
   
   // 후기남겨요 등록하기
   @RequestMapping(value = "/board/reviewaddCtr.do", method = RequestMethod.POST)
   public String reviewAdd(ReviewDto reviewDto, MultipartHttpServletRequest mulRequest
         ,Model model) {
      log.debug("Welcome BoardController reviewAddCtr! " + reviewDto);
      
      try {
         boardService.reviewInsertOne(reviewDto, mulRequest);
         
      } catch (Exception e) {
         // TODO: handle exception
         System.out.println("오류 처리할거 있음 한다");
         e.printStackTrace();
      }
            
      return "common/ReviewSuccessPage";
   }
   // 공지사항 등록하기
   @RequestMapping(value = "/board/noticeaddCtr.do", method = RequestMethod.POST)
   public String noticeAdd(NoticeDto noticeDto, MultipartHttpServletRequest mulRequest
         ,Model model) {
      log.debug("Welcome BoardController noticeAddCtr! " + noticeDto);
      
      try {
         boardService.noticeInsertOne(noticeDto, mulRequest);
         
      } catch (Exception e) {
         // TODO: handle exception
         System.out.println("오류 처리할거 있음 한다");
         e.printStackTrace();
      }
            
      return "common/NoticeSuccessPage";
   }
   
   // 1:1 상담문의 등록하기
   @RequestMapping(value = "/board/inquiryaddCtr.do", method = RequestMethod.POST)
   public String inquiryAdd(InquiryDto inquiryDto, MultipartHttpServletRequest mulRequest
         ,Model model) {
      log.debug("Welcome BoardController inquiryAddCtr! " + inquiryDto);
      
      try {
         boardService.inquiryInsertOne(inquiryDto, mulRequest);
         
      } catch (Exception e) {
         // TODO: handle exception
         System.out.println("오류 처리할거 있음 한다");
         e.printStackTrace();
      }
            
      return "common/InquirySuccessPage";
   }
   // 후기남겨요 수정 화면으로
   @RequestMapping(value = "/board/reviewupdate.do", method = RequestMethod.GET)
   public String reviewUpdate(@RequestParam(name = "no"
      , required = false, defaultValue = "0") int no, Model model, HttpSession session) {
      log.debug("Welcome BoardController reviewUpdate! - {}" + no);
      
      MemberDto memberDto = (MemberDto) session.getAttribute("member");
      
      int memberNo = memberDto.getMemberNo();
            
//      Map<String, Object> memberInfo = boardService.memberInfo(memberNo);
      List<MemberDto> memberInfoList = boardService.memberInfoList(memberNo);
      
      model.addAttribute("memberInfo", memberInfoList);
      
      Map<String, Object> resultMap = boardService.reviewSelectOne(no);
            
      Map<String, Object> reviewDto 
      = (Map<String, Object>) resultMap.get("reviewDto");
      
      List<Map<String, Object>> fileList 
         = (List<Map<String, Object>>) resultMap.get("fileList");
      model.addAttribute("reviewDto", reviewDto);      
      model.addAttribute("fileList", fileList);
            
      return "board/ReviewUpdateForm";
   }
   
   
   // 후기남겨요 수정 화면으로
//   @RequestMapping(value = "/board/reviewupdate.do", method = RequestMethod.GET)
//   public String reviewUpdate(@RequestParam(name = "no"
//      , required = false, defaultValue = "0") int no, Model model, HttpSession session) {
//      log.debug("Welcome BoardController reviewUpdate! - {}" + no);
//      
//      MemberDto memberDto = (MemberDto) session.getAttribute("member");
//      
//      int memberNo = memberDto.getMemberNo();
//            
//      Map<String, Object> memberInfo = boardService.memberInfo(memberNo);
//      
//      model.addAttribute("memberInfo", memberInfo);
//      
//      Map<String, Object> resultMap = boardService.reviewSelectOne(no);
//            
//      Map<String, Object> reviewDto 
//      = (Map<String, Object>) resultMap.get("reviewDto");
//      
//      List<Map<String, Object>> fileList 
//         = (List<Map<String, Object>>) resultMap.get("fileList");
//      model.addAttribute("reviewDto", reviewDto);      
//      model.addAttribute("fileList", fileList);
//            
//      return "board/ReviewUpdateForm";
//   }

   
   // 공지사항 수정 화면으로
   @RequestMapping(value = "/board/update.do", method = RequestMethod.GET)
   public String noticeUpdate(@RequestParam(name = "no"
      , required = false, defaultValue = "0") int no, Model model) {
      log.debug("Welcome BoardController noticeUpdate! - {}" + no);
      
      Map<String, Object> resultMap = boardService.noticeSelectOne(no);
      
      Map<String, Object> noticeDto 
      = (Map<String, Object>) resultMap.get("noticeDto");
            
      List<Map<String, Object>> fileList 
         = (List<Map<String, Object>>) resultMap.get("fileList");
      
      model.addAttribute("noticeDto", noticeDto);
      model.addAttribute("fileList", fileList);
            
      return "board/NoticeUpdateForm";
   }
   
// 1:1 문의사항 수정 화면으로
   @RequestMapping(value = "/board/inquiryupdate.do", method = RequestMethod.GET)
   public String inquiryUpdate(@RequestParam(name = "no"
      , required = false, defaultValue = "0") int no, Model model) {
      log.debug("Welcome BoardController inquiryUpdate! - {}" + no);
      
      Map<String, Object> resultMap = boardService.inquirySelectOne(no);
      
      Map<String, Object> inquiryDto 
      = (Map<String, Object>) resultMap.get("inquiryDto");
            
      List<Map<String, Object>> fileList 
         = (List<Map<String, Object>>) resultMap.get("fileList");
      
      model.addAttribute("inquiryDto", inquiryDto);
      model.addAttribute("fileList", fileList);
            
      return "board/InquiryUpdateForm";
   }
   
   //후기남겨요 수정   
   @RequestMapping(value = "/board/reviewUpdateCtr.do", method = RequestMethod.POST)
   public String reviewUpdateCtr(ReviewDto reviewDto
      , @RequestParam(value = "fileIdx", defaultValue = "-1") int fileIdx
      , MultipartHttpServletRequest mulRequest
      , Model model) {
      log.info("Welcome BoardController inquiryUpdateCtr! noticeDto: {}\n fileIdx: {}"
            , reviewDto, fileIdx);
      
      int resultNum = 0;
      
      try {
         resultNum = boardService.reviewUpdateOne(reviewDto, mulRequest, fileIdx);
      } catch (Exception e) {
         // TODO: handle exception
         e.printStackTrace();
      }
      
      return "common/ReviewSuccessPage";
   }
   
   // 리뷰 댓글 수정하기
   @ResponseBody
   @RequestMapping(value = "/board/editReviewReply.do", method = RequestMethod.POST)
   public void reviewReplyEdit(@RequestParam("reviewReplyContent") String reviewReplyContent,
       @RequestParam("reviewReplyNo") int reviewReplyNo) {
       log.debug("board/editReviewReply.do");

           ReviewReplyDto reviewReplyDto = new ReviewReplyDto();
           reviewReplyDto.setReviewReplyContent(reviewReplyContent);
           reviewReplyDto.setReviewReplyNo(reviewReplyNo);

           boardService.reviewReplyEdit(reviewReplyDto);
       
   }
   
// 공지사항 댓글 수정하기
   @ResponseBody
   @RequestMapping(value = "/board/editNoticeReply.do", method = RequestMethod.POST)
   public void noticeReplyEdit(@RequestParam("noticeReplyContent") String noticeReplyContent,
       @RequestParam("noticeReplyNo") int noticeReplyNo) {
       log.debug("board/editReviewReply.do");

           NoticeReplyDto noticeReplyDto = new NoticeReplyDto();
           noticeReplyDto.setNoticeReplyContent(noticeReplyContent);
           noticeReplyDto.setNoticeReplyNo(noticeReplyNo);

           boardService.noticeReplyEdit(noticeReplyDto);
       
   }
   
   
   
   //1:1 문의사항 수정
   @RequestMapping(value = "/board/inquiryupdateCtr.do", method = RequestMethod.POST)
   public String inquiryUpdateCtr(InquiryDto inquiryDto
      , @RequestParam(value = "fileIdx", defaultValue = "-1") int fileIdx
      , MultipartHttpServletRequest mulRequest
      , Model model) {
      log.info("Welcome BoardController inquiryUpdateCtr! noticeDto: {}\n fileIdx: {}"
            , inquiryDto, fileIdx);
      
      int resultNum = 0;
      
      try {
         resultNum = boardService.inquiryUpdateOne(inquiryDto, mulRequest, fileIdx);
      } catch (Exception e) {
         // TODO: handle exception
         e.printStackTrace();
      }
      
      return "common/InquirySuccessPage";
   }
   
   //공지사항 수정
   @RequestMapping(value = "/board/updateCtr.do", method = RequestMethod.POST)
   public String noticeUpdateCtr(NoticeDto noticeDto
      , @RequestParam(value = "fileIdx", defaultValue = "-1") int fileIdx
      , MultipartHttpServletRequest mulRequest
      , Model model) {
      log.info("Welcome BoardController noticeUpdateCtr! noticeDto: {}\n fileIdx: {}"
            , noticeDto, fileIdx);
      
      int resultNum = 0;
      
      try {
         resultNum = boardService.noticeUpdateOne(noticeDto, mulRequest, fileIdx);
      } catch (Exception e) {
         // TODO: handle exception
         e.printStackTrace();
      }
      
      return "common/NoticeSuccessPage";
   }
   
 //공지사항 삭제
    @RequestMapping(value = "/board/noticedelete.do", method = RequestMethod.GET)
    public String noticeDelete(int no, Model model) {
       log.info("Welcome BoardController noticeDelete! " + no);

       boardService.noticeDeleteOne(no);
       
       
       return "redirect:/board/announcement.do";
    }
    
     //1:1 상담문의 삭제
    @RequestMapping(value = "/board/inquirydelete.do", method = RequestMethod.GET)
    public String inquiryDelete(int no, Model model) {
       log.info("Welcome BoardController inquiryDelete! " + no);

       boardService.inquiryDeleteOne(no);
       
       
       return "redirect:/board/customerService.do";
    }
    
     //후기남겨요 삭제
    @RequestMapping(value = "/board/reviewdelete.do", method = RequestMethod.GET)
    public String reviewDelete(int no, Model model) {
       log.info("Welcome BoardController reviewDelete! " + no);

       boardService.reviewDeleteOne(no);
       
       
       return "redirect:/board/review.do";
    }
    // 후기남겨요 댓글 삭제
    @RequestMapping(value = "/board/reviewReplydelete.do", method = RequestMethod.GET)
    public String reviewReplyDelete(int reviewNo, int no, Model model) {
       log.info("Welcome BoardController reviewReplyDelete! " + no);

       boardService.reviewReplyDelete(no);
       
       System.out.println("reviewReplyDto.ReviewNo 번호는" + reviewNo);
              
       return "redirect:/board/listOne3.do?no=" + reviewNo;      
    }
    // 공지사항 댓글 삭제
    @RequestMapping(value = "/board/noticeReplydelete.do", method = RequestMethod.GET)
    public String noticeReplyDelete(int noticeNo, int no, Model model) {
       log.info("Welcome BoardController reviewReplyDelete! " + no);

       boardService.noticeReplyDelete(no);
       
       System.out.println("reviewReplyDto.ReviewNo 번호는" + noticeNo);
              
       return "redirect:/board/listOne.do?no=" + noticeNo;      
    }  
   


}