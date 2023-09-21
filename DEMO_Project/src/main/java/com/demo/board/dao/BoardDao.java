package com.demo.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.demo.board.dto.InquiryDto;
import com.demo.board.dto.NoticeDto;
import com.demo.board.dto.ReviewDto;
import com.demo.member.dto.MemberDto;
import com.demo.order.dto.OrderDto;

public interface BoardDao {

   Map<String, Object> noticeSelectList(int start, int end);   

   public int noticeSelectTotalCount();

   Map<String, Object> inquirySelectList(int start, int end);

   public int inquirySelectTotalCount();
   
   Map<String, Object> reviewSelectList(int start, int end);

   public HashMap<String, Object> noticeSelectOne(int no);

   List<Map<String, Object>> fileSelectList(int no);

   public HashMap<String, Object> inquirySelectOne(int no);

   public int inquiryInsertOne(InquiryDto inquiryDto);

   public int noticeInsertOne(NoticeDto noticeDto);

   public int noticeUpdateOne(NoticeDto noticeDto);

   Map<String, Object> fileSelectStoredFileName(int parentSeq);

   void fileDelete(int parentSeq);
   
   public int noticeDeleteOne(int no);
   
   public int reviewSelectTotalCount();
   
   public HashMap<String, Object> reviewSelectOne(int no);
   
   public int inquiryDeleteOne(int no);
   
   public int inquiryUpdateOne(InquiryDto inquiryDto);
   
   public HashMap<String, Object> memberInfo(int memberNo);
   
   public int reviewInsertOne(ReviewDto reviewDto);
   
   public int reviewDeleteOne(int no);



   





}