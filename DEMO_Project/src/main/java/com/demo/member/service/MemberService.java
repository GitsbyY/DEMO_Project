package com.demo.member.service;

import org.springframework.ui.Model;

import com.demo.member.dto.MemberDto;
import com.demo.member.dto.PetDto;

public interface MemberService {

	void memberInsertOne(MemberDto memberDto, Model model);

	void petInsertOne(PetDto petDto, Model model);
	
	
}
