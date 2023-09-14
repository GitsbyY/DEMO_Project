package com.demo.member.dao;

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



	

}