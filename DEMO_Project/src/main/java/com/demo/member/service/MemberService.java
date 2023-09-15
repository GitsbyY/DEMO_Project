package com.demo.member.service;

import org.springframework.ui.Model;

import com.demo.member.dto.MemberDto;
import com.demo.member.dto.PetDto;

public interface MemberService {

	int memberInsertOne(MemberDto memberDto);

	void petInsertOne(PetDto petDto);

	boolean isIdAvailable(String memberId);

	MemberDto memberExist(String memeberId, String memberPassword);

	MemberDto memberFindId(String memberEmail, String memberPhone);

	MemberDto memberFindPassword(String memberId, String memberEmail);

	
	
	
}
