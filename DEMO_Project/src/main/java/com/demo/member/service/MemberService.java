package com.demo.member.service;

import org.springframework.ui.Model;

import com.demo.member.dto.MemberDto;
import com.demo.member.dto.PetDto;

public interface MemberService {

	int memberInsertOne(MemberDto memberDto);

	void petInsertOne(PetDto petDto);
	
	
}
