package com.demo.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.demo.board.dto.InquiryDto;
import com.demo.board.dto.NoticeDto;
import com.demo.board.dto.ReplyDto;
import com.demo.board.dto.ReviewDto;
import com.demo.board.dto.ReviewReplyDto;
import com.demo.member.dto.MemberDto;
import com.demo.order.dto.OrderDto;


public interface BoardService {
         
   public int noticeSelectTotalCount();

   Map<String, Object> noticeSelectList(int start, int end);

   public int inquirySelectTotalCount();

   Map<String, Object> inquirySelectList(int start, int end);

   public Map<String, Object> noticeSelectOne(int no);      

   public Map<String, Object> inquirySelectOne(int no);

   public void inquiryInsertOne(InquiryDto inquiryDto
      , MultipartHttpServletRequest mulRequest) throws Exception;

   public void noticeInsertOne(NoticeDto noticeDto
      , MultipartHttpServletRequest mulRequest) throws Exception;

   public int noticeUpdateOne(NoticeDto noticeDto
      , MultipartHttpServletRequest mulRequest
      , int fileIdx) throws Exception;
   
   public int noticeDeleteOne(int no);
   
   public int reviewSelectTotalCount();
   
   public Map<String, Object> reviewSelectOne(int no);
   
   public int inquiryDeleteOne(int no);

   public int inquiryUpdateOne(InquiryDto inquiryDto
         , MultipartHttpServletRequest mulRequest
         , int fileIdx) throws Exception;
   
   public Map<String, Object> memberInfo(int memberNo);
   
   public void reviewInsertOne(ReviewDto reviewDto
         , MultipartHttpServletRequest mulRequest) throws Exception;

   public int reviewDeleteOne(int no);
   
   public int reviewUpdateOne(ReviewDto reviewDto
         , MultipartHttpServletRequest mulRequest
         , int fileIdx) throws Exception;

   public void replyInsertOne(ReplyDto replyDto
		   , MultipartHttpServletRequest mulRequest) throws Exception;

public Map<String, Object> reviewSelectList(int start, int end, String search, String select);

public List<ReviewReplyDto> list(int no);

public void reviewReplyWrite(ReviewReplyDto reviewReplyDto);

public int reviewReplyDelete(int no);










   
}