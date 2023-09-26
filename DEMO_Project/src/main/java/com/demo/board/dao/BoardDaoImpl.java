package com.demo.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.demo.board.dto.InquiryDto;
import com.demo.board.dto.NoticeDto;
import com.demo.board.dto.ReplyDto;
import com.demo.order.dto.OrderDto;
import com.demo.board.dto.ReviewDto;
import com.demo.board.dto.ReviewReplyDto;
import com.demo.member.dto.MemberDto;





@Repository
public class BoardDaoImpl implements BoardDao{
   
   @Autowired
   SqlSessionTemplate sqlSession;
   
   String nameSpace = "com.demo.board.";
   
   @Override
   public HashMap<String, Object> noticeSelectList(int start, int end) {
       HashMap<String, Object> resultMap = new HashMap<>();
       HashMap<String, Object> map = new HashMap<String, Object>();
       map.put("start", start);
       map.put("end", end);

       List<NoticeDto> noticeList = sqlSession.selectList(nameSpace + "noticeSelectList", map);
       
       resultMap.put("noticeList", noticeList);
       // 여기에 필요한 다른 데이터들을 추가할 수 있습니다.

       return resultMap;
   }

   @Override
   public int noticeSelectTotalCount() {
      // TODO Auto-generated method stub
      return (int)sqlSession.selectOne(nameSpace + "noticeSelectTotalCount");
   }

   @Override
   public HashMap<String, Object> inquirySelectList(int start, int end) {
      HashMap<String, Object> resultMap = new HashMap<>();
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("start", start);
      map.put("end", end);

      List<NoticeDto> inquiryList = sqlSession.selectList(nameSpace + "inquirySelectList", map);
       
      resultMap.put("inquiryList", inquiryList);
       // 여기에 필요한 다른 데이터들을 추가할 수 있습니다.

      return resultMap;
   }
   
	/*
	 * @Override public Map<String, Object> reviewSelectList(int start, int end) {
	 * // TODO Auto-generated method stub HashMap<String, Object> resultMap = new
	 * HashMap<>(); HashMap<String, Object> map = new HashMap<String, Object>();
	 * map.put("start", start); map.put("end", end);
	 * 
	 * List<ReviewDto> reviewList = sqlSession.selectList(nameSpace +
	 * "reviewSelectList", map);
	 * 
	 * resultMap.put("reviewList", reviewList); // 여기에 필요한 다른 데이터들을 추가할 수 있습니다.
	 * 
	 * return resultMap; }
	 */

   @Override
   public int inquirySelectTotalCount() {
      // TODO Auto-generated method stub
      return (int)sqlSession.selectOne(nameSpace + "inquirySelectTotalCount");
   }

   @Override
   public Map<String, Object> noticeSelectOne(int no) {
      // TODO Auto-generated method stub
      
      return sqlSession.selectOne(nameSpace + "noticeSelectOne", no);
   }

   @Override
   public List<Map<String, Object>> fileSelectList(int no) {
      // TODO Auto-generated method stub
      return sqlSession.selectList(nameSpace+ "fileSelectList", no);
   }

   @Override
   public Map<String, Object> inquirySelectOne(int no) {
      // TODO Auto-generated method stub
      
      return sqlSession.selectOne(nameSpace + "inquirySelectOne", no);
   }
   
   @Override
   public Map<String, Object> reviewSelectOne(int no) {
      // TODO Auto-generated method stub
      return sqlSession.selectOne(nameSpace + "reviewSelectOne", no);
   }

   @Override
   public int inquiryInsertOne(InquiryDto inquiryDto) {
      // TODO Auto-generated method stub
      return sqlSession.insert(nameSpace + "inquiryInsertOne", inquiryDto);
   }

   @Override
   public int noticeInsertOne(NoticeDto noticeDto) {
      // TODO Auto-generated method stub
      return sqlSession.insert(nameSpace + "noticeInsertOne", noticeDto);
   }

   @Override
   public int noticeUpdateOne(NoticeDto noticeDto) {
      // TODO Auto-generated method stub
      return sqlSession.update(nameSpace + "noticeUpdateOne", noticeDto);
   }

   @Override
   public Map<String, Object> fileSelectStoredFileName(int parentSeq) {
      // TODO Auto-generated method stub
      return sqlSession.selectOne(nameSpace + "fileSelectStoredFileName", parentSeq);
   }

   @Override
   public void fileDelete(int parentSeq) {
      // TODO Auto-generated method stub
      sqlSession.delete(nameSpace + "fileDelete", parentSeq);
   }

   @Override
   public int noticeDeleteOne(int no) {
      // TODO Auto-generated method stub
      return sqlSession.delete(nameSpace + "noticeDeleteOne", no);
   }

	
   @Override public int reviewSelectTotalCount() {
	   // TODO Auto-generated method stub 
	   return (int)sqlSession.selectOne(nameSpace + "reviewSelectTotalCount");
   }
	 

   @Override
   public int inquiryDeleteOne(int no) {
      // TODO Auto-generated method stub
      return sqlSession.delete(nameSpace + "inquiryDeleteOne", no);
   }

   @Override
   public int inquiryUpdateOne(InquiryDto inquiryDto) {
      // TODO Auto-generated method stub
      return sqlSession.update(nameSpace + "inquiryUpdateOne", inquiryDto);
   }

   @Override
   public HashMap<String, Object> memberInfo(int memberNo) {
      // TODO Auto-generated method stub
      
       return sqlSession.selectOne(nameSpace + "memberInfo", memberNo);
   }

   @Override
   public int reviewInsertOne(ReviewDto reviewDto) {
      // TODO Auto-generated method stub
      return sqlSession.insert(nameSpace + "reviewInsertOne", reviewDto);
   }

   @Override
   public int reviewDeleteOne(int no) {
      // TODO Auto-generated method stub
      return sqlSession.delete(nameSpace + "reviewDeleteOne", no);
   }

   @Override
   public int reviewUpdateOne(ReviewDto reviewDto) {
      // TODO Auto-generated method stub
      return sqlSession.update(nameSpace + "reviewUpdateOne", reviewDto);
   }

   @Override
   public int replyInsertOne(ReplyDto replyDto) {
      // TODO Auto-generated method stub
      return sqlSession.insert(nameSpace + "replyInsertOne", replyDto);
   }

   @Override
   public HashMap<String, Object> replySelectOne(int no) {
      // TODO Auto-generated method stub
      HashMap<String, Object> resultMap = new HashMap<>();
       HashMap<String, Object> map = new HashMap<String, Object>();
       map.put("no", no);
       resultMap = sqlSession.selectOne(nameSpace + "replySelectOne", map);
       return resultMap;
   }

   @Override
   public int inquiryUpdateReply(ReplyDto replyDto) {
      // TODO Auto-generated method stub
      return sqlSession.update(nameSpace + "inquiryUpdateReply", replyDto);
   }

@Override
public Map<String, Object> reviewSelectList(int start, int end, String search
		, String select) {
	// TODO Auto-generated method stub
	  HashMap<String, Object> resultMap = new HashMap<>();
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("start", start);
      map.put("end", end);
      map.put("search", search);
      map.put("select", select);

      List<ReviewDto> reviewList = sqlSession.selectList(nameSpace + "reviewSelectList", map);
         
      resultMap.put("reviewList", reviewList);
       // 여기에 필요한 다른 데이터들을 추가할 수 있습니다.

      return resultMap;
	
}

@Override
public List<ReviewReplyDto> list(int no) {
	// TODO Auto-generated method stub
	return sqlSession.selectList(nameSpace + "list", no);
}

@Override
public void reviewReplyWrite(ReviewReplyDto reviewReplyDto) {
	// TODO Auto-generated method stub
	sqlSession.insert(nameSpace + "reviewReplyWrite", reviewReplyDto);
}
  

   
   

}