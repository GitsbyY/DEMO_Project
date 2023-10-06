package com.demo.board.dao;

import java.util.List;
import java.util.Map;

import com.demo.board.dto.InquiryDto;
import com.demo.board.dto.NoticeDto;
import com.demo.board.dto.NoticeReplyDto;
import com.demo.board.dto.ReplyDto;
import com.demo.board.dto.ReviewDto;
import com.demo.board.dto.ReviewReplyDto;
import com.demo.member.dto.MemberDto;

public interface BoardDao {

   Map<String, Object> noticeSelectList(int start, int end);   

   public int noticeSelectTotalCount();

   Map<String, Object> inquirySelectList(int start, int end);

   public int inquirySelectTotalCount();
   
	/* Map<String, Object> reviewSelectList(int start, int end); */

   public Map<String, Object> noticeSelectOne(int no);

   List<Map<String, Object>> fileSelectList(int no);

   public Map<String, Object> inquirySelectOne(int no);

   public int inquiryInsertOne(InquiryDto inquiryDto);

   public int noticeInsertOne(NoticeDto noticeDto);

   public int noticeUpdateOne(NoticeDto noticeDto);

   Map<String, Object> fileSelectStoredFileName(int parentSeq);

   void fileDelete(int parentSeq);
   
   public int noticeDeleteOne(int no);
   
   public int reviewSelectTotalCount(String search, String select);
   
   public Map<String, Object> reviewSelectOne(int no);
   
   public int inquiryDeleteOne(int no);
   
   public int inquiryUpdateOne(InquiryDto inquiryDto);
   
   public Map<String, Object> memberInfo(int memberNo);
   
   public int reviewInsertOne(ReviewDto reviewDto);
   
   public int reviewDeleteOne(int no);
   
   public int reviewUpdateOne(ReviewDto reviewDto);
   
   public int replyInsertOne(ReplyDto replyDto);
   
   public Map<String, Object> replySelectOne(int no);

   public int inquiryUpdateReply(ReplyDto replyDto);
   
   Map<String, Object> reviewSelectList(int start, int end, String search
		   , String select);
   
   public List<ReviewReplyDto> list(int no);

   public void reviewReplyWrite(ReviewReplyDto reviewReplyDto);
   
   public int reviewReplyDelete(int no);
   
   public void reviewReplyEdit(ReviewReplyDto reviewReplyDto);
   
   public List<NoticeReplyDto> noticeReplylist(int no);
   
   public void noticeReplyWrite(NoticeReplyDto noticeReplyDto);
   
   public int noticeReplyDelete(int no);
   
   public void noticeReplyEdit(NoticeReplyDto noticeReplyDto);
   
   List<MemberDto> memberInfoList(int memberNo);
     
   


   



   





}