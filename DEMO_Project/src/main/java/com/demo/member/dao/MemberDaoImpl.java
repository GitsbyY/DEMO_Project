package com.demo.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.demo.member.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String nameSpace = "com.demo.member.";

	@Override
	public List<MemberDto> memberSelectList(int start, int end) {
		// TODO Auto-generated method stub
//		sqlSession.selectOne(""); -> 하나의 로우만 출력
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("com.demo.member.memberSelectList", map);
	}

	@Override
	public MemberDto memberExist(String email, String password) {
		// TODO Auto-generated method stub
		//HashMap으로 맵을 통해서 하나만 보내야 한다.
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("email", email);
		paramMap.put("pwd", password);
		
		return sqlSession.selectOne("com.demo.member.memberExist", paramMap);
	}

	@Override
	public int memberInsertOne(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("com.demo.member.memberInsertOne", memberDto);
	}

	@Override
	public MemberDto memberSelectOne(int no) {
		// TODO Auto-generated method stub
		
		MemberDto memberDto = sqlSession.selectOne("com.demo.member.memberSelectOne",no);
		
		return memberDto;
	}
//
//	@Override
//	public MemberDto memberUpdate(MemberDto memberDto) {
//		// TODO Auto-generated method stub
//		
//		return sqlSession.selectOne("com.demo.member.memberUpdate",memberDto);
//		
//	}

	@Override
	public int memberUpdateOne(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return sqlSession.update("com.demo.member.memberUpdateOne", memberDto);
	}

	@Override
	public int memberDeleteOne(int no) {
		// TODO Auto-generated method stub
		return sqlSession.delete("com.demo.member.memberDeleteOne", no);
	}
	
	@Override
	public int memberSelectTotalCount() {
		return (int)sqlSession.selectOne("com.demo.member.memberSelectTotalCount");
	}

	@Override
	public void insertFile(Map<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.insert("com.demo.member.insertFile", map);
	}

//	@Override	//DTO가 존재하지 않아서 map을 사용했다 키-값
	public List<Map<String, Object>> fileSelectList(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + "fileSelectList", no);
	}

	@Override
	public Map<String, Object> fileSelectStoredFileName(int parentSeq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + "fileSelectStoredFileName", parentSeq);
	}

	@Override
	public int fileDelete(int parentSeq) {
		// TODO Auto-generated method stub
		return sqlSession.delete(nameSpace + "fileDelete", parentSeq);
	}
	

}
