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

	Map<String, Object> memberPaymentDeatilSelectOne(int memberNo);

	List<Map<String, Object>> memberPaymentDeatilChargeSelectList(int memberNo);

	Map<String, Object> myPageProfileDetailMemberSelectOne(int memberNo);

	Map<String, Object> myPageProfileDetailPetSelectOne(int memberNo);

	int memberPwdChange(MemberDto memberDto);

	void memberPointUpdate(MemberDto memberDto);

	void memberEmoneyUpdate(MemberDto memberDto);

	List<Map<String, Object>> memberSelectCartList(int memberNo);

	void memberInfoDelete(MemberDto memberDto);

	void memberInfoUpdate(MemberDto memberDto);

	//void petInfoUpdate(String petName, double petWeight, int petNo);

	void updateCartQuantity(int memberNo, int productNo, int quantity);

	void petInfoUpdate(PetDto petDto);

	void insertChargeOne(int memberNo, int chargeAmount);

	int memberCheckId(String memberId);

	int memberCheckEmail(String memberEmail, String memberId);

	int memberCheckEmail2(String memberEmail);

	int memberCheckPhone(String memberEmail, String memberPhone);


}