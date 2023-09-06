package com.demo.member.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.demo.member.dao.MemberDao;
import com.demo.member.dto.MemberDto;
import com.demo.util.FileUtils;

@Service
public class MemberServiceImpl implements MemberService{
	//bean에 등록하는 것. 객체 생성과 같다.
	
	private static final Logger log = LoggerFactory.getLogger(MemberServiceImpl.class);
	@Autowired
	public MemberDao memberDao;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Override
	public List<MemberDto> memberSelectList(int start, int end) {
		// TODO Auto-generated method stub
		return memberDao.memberSelectList(start, end);
	}

	@Override
	public MemberDto memberExist(String email, String password) {
		// TODO Auto-generated method stub
		return memberDao.memberExist(email, password);
	}

	@Override
	public void memberInsertOne(MemberDto memberDto
			, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
		// TODO Auto-generated method stub
		//회원추가는 동일하게 두면 된다.
		memberDao.memberInsertOne(memberDto);
		
		int parentSeq = memberDto.getNo();
		List<Map<String, Object>> list 
			= fileUtils.parseInsertFileInfo(parentSeq, multipartHttpServletRequest);
		
		for (int i = 0; i < list.size(); i++) {
			memberDao.insertFile(list.get(i));
			
		}
		
	}

	@Override
	public Map<String, Object> memberSelectOne(int no) {
		// TODO Auto-generated method stub
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		MemberDto memberDto = memberDao.memberSelectOne(no);
		resultMap.put("memberDto", memberDto);
		
		List<Map<String, Object>> fileList = memberDao.fileSelectList(no);
		resultMap.put("fileList", fileList);
		
		return resultMap;
	}

	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int memberUpdateOne(MemberDto memberDto
				, MultipartHttpServletRequest multipartHttpServletRequest
				, int fileIdx) throws Exception {
		// TODO Auto-generated method stub
		int resultNum = 0;
		
		try {
			resultNum =memberDao.memberUpdateOne(memberDto);
			
			int parentSeq = memberDto.getNo();
			Map<String, Object> tempFileMap 
				= memberDao.fileSelectStoredFileName(parentSeq);
			
			List<Map<String, Object>> list 
				= fileUtils.parseInsertFileInfo(parentSeq, multipartHttpServletRequest);
			
			//오로지 하나만 관리 ->여기에 포문이 들어가면 멀티다.
			if(list.isEmpty() == false) {
				if(tempFileMap != null) {
					memberDao.fileDelete(parentSeq);//데이터베이스 삭제
					fileUtils.parseUpdateFileInfo(tempFileMap);//물리적 파일 삭제
				}
				
				for(Map<String, Object> map : list) {
					memberDao.insertFile(map);
				}
			}else if(fileIdx == -1) {
				if(tempFileMap != null) {
					memberDao.fileDelete(parentSeq);
					fileUtils.parseUpdateFileInfo(tempFileMap);
				}
			}
			
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return resultNum;
	}

	@Override
	public int memberDeleteOne(int no) {
		// TODO Auto-generated method stub
		return memberDao.memberDeleteOne(no);
	}

	@Override
	public int memberSelectTotalCount() {
		// TODO Auto-generated method stub
		return memberDao.memberSelectTotalCount();
	}

	
	
}
