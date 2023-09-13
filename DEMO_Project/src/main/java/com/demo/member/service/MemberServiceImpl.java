package com.demo.member.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.member.dao.MemberDao;

@Service
public class MemberServiceImpl implements MemberService{
	//bean에 등록하는 것. 객체 생성과 같다.
	
	
	private static final Logger log = LoggerFactory.getLogger(MemberServiceImpl.class);
	@Autowired
	public MemberDao memberDao;
	

	
	
}
