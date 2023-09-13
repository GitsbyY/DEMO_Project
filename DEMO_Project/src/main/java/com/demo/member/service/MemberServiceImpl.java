package com.demo.member.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.demo.member.dao.MemberDao;
import com.demo.member.dto.MemberDto;
import com.demo.member.dto.PetDto;

@Service
public class MemberServiceImpl implements MemberService{
	//bean에 등록하는 것. 객체 생성과 같다.
	
	
	private static final Logger log = LoggerFactory.getLogger(MemberServiceImpl.class);
	@Autowired
	public MemberDao memberDao;
	@Override
	public void memberInsertOne(MemberDto memberDto, Model model) {
		// TODO Auto-generated method stub
		memberDao.memberInsertOne(memberDto);
	}
	@Override
	public void petInsertOne(PetDto petDto, Model model) {
		// TODO Auto-generated method stub
		memberDao.petrInsertOne(petDto);
	}
	

	
	
}
