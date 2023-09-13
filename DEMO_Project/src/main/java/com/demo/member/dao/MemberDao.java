package com.demo.member.dao;

import com.demo.member.dto.MemberDto;
import com.demo.member.dto.PetDto;

public interface MemberDao {

	int memberInsertOne(MemberDto memberDto);

	void petrInsertOne(PetDto petDto);
	


}
