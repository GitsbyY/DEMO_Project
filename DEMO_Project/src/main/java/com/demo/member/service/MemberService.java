package com.demo.member.service;

import java.util.List;
import java.util.Map;

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

	int memberSelectListTotalCount();

	List<Map<String, Object>> memberInfoSelectList(int start, int end);

	List<Map<String, Object>> memberPaymentSelectList(int start, int end);

	

	
	
	
}
