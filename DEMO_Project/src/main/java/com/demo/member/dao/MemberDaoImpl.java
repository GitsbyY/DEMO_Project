package com.demo.member.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.demo.member.dto.MemberDto;
import com.demo.member.dto.PetDto;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String nameSpace = "com.demo.member.";

	@Override
	public int memberInsertOne(MemberDto memberDto) {
		// TODO Auto-generated method stub
		sqlSession.insert("com.demo.member.memberInsertOne", memberDto);
		
		return memberDto.getMemberNo();
	}

	@Override
	public void petrInsertOne(PetDto petDto) {
		// TODO Auto-generated method stub
		sqlSession.insert("com.demo.member.petInsertOne", petDto);
	}

	@Override
	public boolean isIdAvailable(String memberId) {
		// TODO Auto-generated method stub
		
		 
		MemberDto memberDto = sqlSession.selectOne(nameSpace + "isIdAvailable", memberId);
		
		//중복이 아닐 때는 null Exception		
		if (memberDto == null) {
			return true;
		}else {
			return false;
		}
		
		
	}

	@Override
	public MemberDto memberExist(String memberId, String memberPassword) {
		// TODO Auto-generated method stub
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("memberId", memberId);
		paramMap.put("memberPassword", memberPassword);
		
		return sqlSession.selectOne(nameSpace + "memberExist", paramMap);		
	}

	@Override
	public MemberDto memberFindId(String memberEmail, String memberPhone) {
		// TODO Auto-generated method stub
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("memberEmail", memberEmail);
		paramMap.put("memberPhone", memberPhone);
		
		return sqlSession.selectOne(nameSpace + "memberFindId", paramMap);
	}

	@Override
	public MemberDto memberFindPassword(String memberId, String memberEmail) {
		// TODO Auto-generated method stub
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("memberId", memberId);
		paramMap.put("memberEmail", memberEmail);
		
		return sqlSession.selectOne(nameSpace + "memberFindPassword", paramMap);
	}

	

	

}
