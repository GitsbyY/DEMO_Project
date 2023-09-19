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
	public String noticeList(@RequestParam(defaultValue = "1") int curPage, Model model) {
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
		
		return "board/Announcement";
	}
	// 상담문의 화면으로 이동
	@RequestMapping(value = "/board/customerService.do", 
			method = {RequestMethod.GET, RequestMethod.POST})
	public String inquiryList(@RequestParam(defaultValue = "1") int curPage, Model model) {
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
		
		return "board/CustomerService";
	}
	
	@RequestMapping(value = "/board/listOne.do", method = RequestMethod.GET)
	public String noticeListOne(int no, Model model) {
		log.debug("Welcome MemberController noticelistOne! - {}" + no);
		
		Map<String, Object> resultMap = boardService.noticeSelectOne(no);
		
		Map<String, Object> noticeDto 
		= (Map<String, Object>) resultMap.get("noticeDto");
				
		List<Map<String, Object>> fileList 
			= (List<Map<String, Object>>) resultMap.get("fileList");
		
		model.addAttribute("noticeDto", noticeDto);
		model.addAttribute("fileList", fileList);
				
		return "board/AnnouncementDetail";
	}

}
