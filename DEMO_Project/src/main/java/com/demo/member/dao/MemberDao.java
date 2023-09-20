package com.demo.member.dao;

import java.util.List;
import java.util.Map;

import com.demo.member.dto.MemberDto;
import com.demo.member.dto.PetDto;

public interface MemberDao {


	int memberInsertOne(MemberDto memberDto);

	void petrInsertOne(PetDto petDto);

	boolean isIdAvailable(String memberId);

	MemberDto memberExist(String memberId, String memberPassword);

	MemberDto memberFindId(String memberEmail, String memberPhone);

	MemberDto memberFindPassword(String memberId, String memberEmail);

	int memberSelectListTotalCount();

	List<Map<String, Object>> memberInfoSelectList(int start, int end);

	List<Map<String, Object>> memberPaymentSelectList(int start, int end);





}
