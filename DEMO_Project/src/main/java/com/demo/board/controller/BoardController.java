package com.demo.board.controller;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.demo.board.dto.InquiryDto;
import com.demo.board.dto.NoticeDto;
import com.demo.board.service.BoardService;
import com.demo.member.dto.MemberDto;
import com.demo.member.service.MemberService;
import com.demo.util.BoardPaging;

@Controller
public class BoardController {

   private static final Logger log = LoggerFactory.getLogger(BoardController.class);
   
   @Autowired
   private BoardService boardService;
   @Autowired
   private MemberService memberService;

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
   // 공지사항 상세보기
   @RequestMapping(value = "/board/listOne.do", method = RequestMethod.GET)
   public String noticeSelectOne(int no, Model model) {
      log.debug("Welcome BoardController noticelistOne! - {}" + no);
      
      Map<String, Object> resultMap = boardService.noticeSelectOne(no);
      
      Map<String, Object> noticeDto 
      = (Map<String, Object>) resultMap.get("noticeDto");
            
      List<Map<String, Object>> fileList 
         = (List<Map<String, Object>>) resultMap.get("fileList");
      
      model.addAttribute("noticeDto", noticeDto);
      model.addAttribute("fileList", fileList);
            
      return "board/AnnouncementDetail";
   }
   // 1:1 상담하기 상세보기
   @RequestMapping(value = "/board/listOne2.do", method = RequestMethod.GET)
   public String inquirySelectOne(int no, Model model) {
      log.debug("Welcome BoardController inquirylistOne! - {}" + no);
      
      Map<String, Object> resultMap = boardService.inquirySelectOne(no);
      
      Map<String, Object> inquiryDto 
      = (Map<String, Object>) resultMap.get("inquiryDto");
            
      List<Map<String, Object>> fileList 
         = (List<Map<String, Object>>) resultMap.get("fileList");
      
      model.addAttribute("inquiryDto", inquiryDto);
      model.addAttribute("fileList", fileList);
            
      return "board/CustomerServiceDetail";
   }
   // 공지사항 작성 페이지 이동
   @RequestMapping(value = "/board/noticeadd.do", method = RequestMethod.GET)
   public String noticeAdd(Model model) {
      log.debug("Welcome BoardController noticeAdd!");
      
      return "board/AddNotice";
   }
   // 공지사항 추가하기
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
            
      return "redirect:/board/announcement.do";
   }      
   // 공지사항 수정 화면으로
   @RequestMapping(value = "/board/update.do", method = RequestMethod.GET)
   public String noticeUpdate(@RequestParam(name = "no"
      , required = false, defaultValue = "0") int no, Model model) {
      log.debug("Welcome BoardController noticelistOne! - {}" + no);
      
      Map<String, Object> resultMap = boardService.noticeSelectOne(no);
      
      Map<String, Object> noticeDto 
      = (Map<String, Object>) resultMap.get("noticeDto");
            
      List<Map<String, Object>> fileList 
         = (List<Map<String, Object>>) resultMap.get("fileList");
      
      model.addAttribute("noticeDto", noticeDto);
      model.addAttribute("fileList", fileList);
            
      return "board/NoticeUpdateForm";
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
 	@RequestMapping(value = "/board/delete.do", method = RequestMethod.GET)
 	public String noticeDelete(int no, Model model) {
 		log.info("Welcome BoardController noticeDelete! " + no);

 		boardService.noticeDeleteOne(no);
 		
 		
 		return "redirect:/board/announcement.do";
 	}
      
   
   // 단순 페이지 이동
//   @RequestMapping(value = "/board/inquiryadd.do", method = RequestMethod.GET)
//   public String inquiryAdd(Model model) {
//      log.debug("Welcome BoardController inquiryAdd!");
//      
//      return "board/AddCustomerService";
//   }
   
//   @RequestMapping(value = "/board/inquiryaddCtr.do", method = RequestMethod.POST)
//   public String inquiryAdd(InquiryDto inquiryDto, MultipartHttpServletRequest mulRequest
//         ,Model model) {
//      log.debug("Welcome BoardController inquiryAddCtr! " + inquiryDto);
//      
//      try {
//         boardService.inquiryInsertOne(inquiryDto, mulRequest);
//         
//      } catch (Exception e) {
//         // TODO: handle exception
//         System.out.println("오류 처리할거 있음 한다");
//         e.printStackTrace();
//      }
//            
//      return "redirect:/board/announcement.do";
//   }

}