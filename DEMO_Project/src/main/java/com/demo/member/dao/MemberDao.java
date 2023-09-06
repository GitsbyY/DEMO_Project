package com.demo.member.dao;


import java.util.List;
import java.util.Map;

import com.demo.member.dto.MemberDto;

public interface MemberDao {
	
	List<MemberDto> memberSelectList(int start, int end);
//	public List<MemberDto> memberSelectList();

	public MemberDto memberExist(String email, String password);
	
	public int memberInsertOne(MemberDto memberDto);

	public MemberDto memberSelectOne(int no);

//	public MemberDto memberUpdate(MemberDto memberDto);
	
	public int memberUpdateOne(MemberDto memberDto);

	public int memberDeleteOne(int no);

	public int memberSelectTotalCount();

	public void insertFile(Map<String, Object> map);

	List<Map<String, Object>> fileSelectList(int no);

	Map<String, Object> fileSelectStoredFileName(int parentSeq);

	int fileDelete(int parentSeq);


}
