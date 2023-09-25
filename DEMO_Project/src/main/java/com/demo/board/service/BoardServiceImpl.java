package com.demo.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.demo.board.dao.BoardDao;
import com.demo.board.dto.InquiryDto;
import com.demo.board.dto.NoticeDto;
import com.demo.board.dto.ReplyDto;
import com.demo.board.dto.ReviewDto;
import com.demo.member.dto.MemberDto;
import com.demo.util.FileUtils;

@Service
public class BoardServiceImpl implements BoardService{
   //bean에 등록하는 것. 객체 생성과 같다.
   
   
   private static final Logger log = LoggerFactory.getLogger(BoardServiceImpl.class);
   @Autowired
   public BoardDao boardDao;
   
   @Resource(name="fileUtils")
   private FileUtils fileUtils;
   
   @Override
   public int noticeSelectTotalCount() {
      // TODO Auto-generated method stub
      return boardDao.noticeSelectTotalCount();
   }
   @Override
   public Map<String, Object> noticeSelectList(int start, int end) {
      // TODO Auto-generated method stub
      return boardDao.noticeSelectList(start, end);
   }
   @Override
   public int inquirySelectTotalCount() {
      // TODO Auto-generated method stub
      return boardDao.inquirySelectTotalCount();
   }
   @Override
   public Map<String, Object> inquirySelectList(int start, int end) {
      // TODO Auto-generated method stub
      return boardDao.inquirySelectList(start, end);
   }
   
   @Override
   public Map<String, Object> noticeSelectOne(int no) {
      // TODO Auto-generated method stub
      Map<String, Object> resultMap = new HashMap<String, Object>();
      
      HashMap<String, Object> noticeDto = boardDao.noticeSelectOne(no);
      resultMap.put("noticeDto", noticeDto);
      
      List<Map<String, Object>> fileList = boardDao.fileSelectList(no);
      resultMap.put("fileList", fileList);
      
      return resultMap;
   }
   @Override
   public Map<String, Object> inquirySelectOne(int no) {
      // TODO Auto-generated method stub
      Map<String, Object> resultMap = new HashMap<String, Object>();
      
      HashMap<String, Object> inquiryDto = boardDao.inquirySelectOne(no);
      resultMap.put("inquiryDto", inquiryDto);
      
      HashMap<String, Object> replyDto = boardDao.replySelectOne(no);
      resultMap.put("replyDto", replyDto);            
      
      List<Map<String, Object>> fileList = boardDao.fileSelectList(no);
      resultMap.put("fileList", fileList);
      
      return resultMap;
   }
   @Override
   public Map<String, Object> reviewSelectOne(int no) {
      // TODO Auto-generated method stub
      Map<String, Object> resultMap = new HashMap<String, Object>();
         
      HashMap<String, Object> reviewDto = boardDao.reviewSelectOne(no);
      resultMap.put("reviewDto", reviewDto);
         
      List<Map<String, Object>> fileList = boardDao.fileSelectList(no);
      resultMap.put("fileList", fileList);
         
      return resultMap;
   }
   @Override
   public void inquiryInsertOne(InquiryDto inquiryDto
      , MultipartHttpServletRequest mulRequest) throws Exception {
      // TODO Auto-generated method stub
      boardDao.inquiryInsertOne(inquiryDto);
      

   }
   @Override
   public void noticeInsertOne(NoticeDto noticeDto
      , MultipartHttpServletRequest mulRequest) throws Exception {
      // TODO Auto-generated method stub
      boardDao.noticeInsertOne(noticeDto);
   }
   @Override
   public int noticeUpdateOne(NoticeDto noticeDto
      , MultipartHttpServletRequest mulRequest
      , int fileIdx) throws Exception {
      // TODO Auto-generated method stub
      int resultNum = 0;
      
      try {
         resultNum = boardDao.noticeUpdateOne(noticeDto);
         
         int parentSeq = noticeDto.getNoticeNo();
         Map<String, Object> tempFileMap 
            = boardDao.fileSelectStoredFileName(parentSeq);
         
//         List<Map<String, Object>> list 
//            = fileUtils.parseInsertFileInfo(parentSeq, multipartHttpServletRequest);
//         
//         // 오로지 하나만 관리
//         if (list.isEmpty() == false) {
//            if(tempFileMap != null) {
//               boardDao.fileDelete(parentSeq);
//               fileUtils.parseUpdateFileInfo(tempFileMap);
//            }
//            
//            for (Map<String, Object> map : list) {
//               boardDao.insertFile(map);
//               
//            }
//         }else if (fileIdx == -1) {
//            if (tempFileMap != null) {
//               boardDao.fileDelete(parentSeq);
//               fileUtils.parseUpdateFileInfo(tempFileMap);
//            }
//         }
         
      } catch (Exception e) {
         TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
      }
      return resultNum;
   }
   @Override
   public int noticeDeleteOne(int no) {
      // TODO Auto-generated method stub
      return boardDao.noticeDeleteOne(no);
   }
   @Override
   public int reviewSelectTotalCount() {
      // TODO Auto-generated method stub
      return boardDao.reviewSelectTotalCount();
   }
   @Override
   public int inquiryDeleteOne(int no) {
      // TODO Auto-generated method stub
      return boardDao.inquiryDeleteOne(no);
   }
   @Override
   public int inquiryUpdateOne(InquiryDto inquiryDto
         , MultipartHttpServletRequest mulRequest
         , int fileIdx) throws Exception {
      // TODO Auto-generated method stub
      int resultNum = 0;
         
         try {
            resultNum = boardDao.inquiryUpdateOne(inquiryDto);
            
            int parentSeq = inquiryDto.getInquiryNo();
            Map<String, Object> tempFileMap 
               = boardDao.fileSelectStoredFileName(parentSeq);
            
//            List<Map<String, Object>> list 
//               = fileUtils.parseInsertFileInfo(parentSeq, multipartHttpServletRequest);
//            
//            // 오로지 하나만 관리
//            if (list.isEmpty() == false) {
//               if(tempFileMap != null) {
//                  boardDao.fileDelete(parentSeq);
//                  fileUtils.parseUpdateFileInfo(tempFileMap);
//               }
//               
//               for (Map<String, Object> map : list) {
//                  boardDao.insertFile(map);
//                  
//               }
//            }else if (fileIdx == -1) {
//               if (tempFileMap != null) {
//                  boardDao.fileDelete(parentSeq);
//                  fileUtils.parseUpdateFileInfo(tempFileMap);
//               }
//            }
            
         } catch (Exception e) {
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
         }
         return resultNum;
   }
   @Override
   public HashMap<String, Object> memberInfo(int memberNo) {
      // TODO Auto-generated method stub
      return boardDao.memberInfo(memberNo);
   }
   @Override
   public void reviewInsertOne(ReviewDto reviewDto
      , MultipartHttpServletRequest mulRequest) throws Exception {
      // TODO Auto-generated method stub
      boardDao.reviewInsertOne(reviewDto);
   }
   @Override
   public int reviewDeleteOne(int no) {
      // TODO Auto-generated method stub
      return boardDao.reviewDeleteOne(no);
   }
   @Override
   public int reviewUpdateOne(ReviewDto reviewDto
         , MultipartHttpServletRequest mulRequest
         , int fileIdx) throws Exception {
      // TODO Auto-generated method stub
      int resultNum = 0;
         
         try {
            resultNum = boardDao.reviewUpdateOne(reviewDto);
            
            int parentSeq = reviewDto.getReviewNo();
            Map<String, Object> tempFileMap 
               = boardDao.fileSelectStoredFileName(parentSeq);
            
//            List<Map<String, Object>> list 
//               = fileUtils.parseInsertFileInfo(parentSeq, multipartHttpServletRequest);
//            
//            // 오로지 하나만 관리
//            if (list.isEmpty() == false) {
//               if(tempFileMap != null) {
//                  boardDao.fileDelete(parentSeq);
//                  fileUtils.parseUpdateFileInfo(tempFileMap);
//               }
//               
//               for (Map<String, Object> map : list) {
//                  boardDao.insertFile(map);
//                  
//               }
//            }else if (fileIdx == -1) {
//               if (tempFileMap != null) {
//                  boardDao.fileDelete(parentSeq);
//                  fileUtils.parseUpdateFileInfo(tempFileMap);
//               }
//            }
            
         } catch (Exception e) {
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
         }
         return resultNum;
   }
	@Override
	public void replyInsertOne(ReplyDto replyDto
			, MultipartHttpServletRequest mulRequest) throws Exception {
		// TODO Auto-generated method stub
		boardDao.replyInsertOne(replyDto);
		boardDao.inquiryUpdateReply(replyDto);
	}
	@Override
	public Map<String, Object> reviewSelectList(int start, int end, String search, String select) {
		// TODO Auto-generated method stub
		return boardDao.reviewSelectList(start, end, search, select);
	}
	
	
   
   
            
}