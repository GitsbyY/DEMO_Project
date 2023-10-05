package com.demo.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.demo.member.dto.ChargeDto;
import com.demo.member.dto.MemberDto;
import com.demo.member.dto.PetDto;

@Repository
public class MemberDaoImpl implements MemberDao{
   
   @Autowired
   SqlSessionTemplate sqlSession;
   
   String nameSpace = "com.demo.member.";

   @Override
   public int memberInsertOne(MemberDto memberDto) {
      // TODO Auto-generated method stub
      sqlSession.insert("com.demo.member.memberInsertOne", memberDto);
      
      return memberDto.getMemberNo();
   }

   @Override
   public void petrInsertOne(PetDto petDto) {
      // TODO Auto-generated method stub
      sqlSession.insert("com.demo.member.petInsertOne", petDto);
   }

   @Override
   public boolean isIdAvailable(String memberId) {
      // TODO Auto-generated method stub
      
       
      MemberDto memberDto = sqlSession.selectOne(nameSpace + "isIdAvailable", memberId);
      
      //중복이 아닐 때는 null Exception      
      if (memberDto == null) {
         return true;
      }else {
         return false;
      }
      
      
   }

   @Override
   public MemberDto memberExist(String memberId, String memberPassword) {
      // TODO Auto-generated method stub
      HashMap<String, Object> paramMap = new HashMap<String, Object>();
      paramMap.put("memberId", memberId);
      paramMap.put("memberPassword", memberPassword);
      
      return sqlSession.selectOne(nameSpace + "memberExist", paramMap);      
   }

   @Override
   public MemberDto memberFindId(String memberEmail, String memberPhone) {
      // TODO Auto-generated method stub
      HashMap<String, Object> paramMap = new HashMap<String, Object>();
      paramMap.put("memberEmail", memberEmail);
      paramMap.put("memberPhone", memberPhone);
      
      return sqlSession.selectOne(nameSpace + "memberFindId", paramMap);
   }

   @Override
   public MemberDto memberFindPassword(String memberId, String memberEmail) {
      // TODO Auto-generated method stub
      HashMap<String, Object> paramMap = new HashMap<String, Object>();
      paramMap.put("memberId", memberId);
      paramMap.put("memberEmail", memberEmail);
      
      return sqlSession.selectOne(nameSpace + "memberFindPassword", paramMap);
   }

   @Override
   public int memberSelectListTotalCount() {
      // TODO Auto-generated method stub
      return (int)sqlSession.selectOne(nameSpace + "memberSelectListTotalCount");
   }

   @Override
   public List<Map<String, Object>> memberInfoSelectList(int start, int end) {
      // TODO Auto-generated method stub
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("start", start);
      map.put("end", end);
      
      return sqlSession.selectList(nameSpace + "memberInfoSelectList", map);
   }

   @Override
   public List<Map<String, Object>> memberPaymentSelectList(int start, int end) {
      // TODO Auto-generated method stub
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("start", start);
      map.put("end", end);
      
      return sqlSession.selectList(nameSpace + "memberPaymentSelectList", map);
   }

   @Override
   public Map<String, Object> memberPaymentDeatilSelectOne(int memberNo) {
      // TODO Auto-generated method stub
      return sqlSession.selectOne(nameSpace + "memberPaymentDeatilSelectOne" , memberNo);
   }

   @Override
   public List<Map<String, Object>> memberPaymentDeatilChargeSelectList(int memberNo) {
      // TODO Auto-generated method stub
      return sqlSession.selectList(nameSpace + "memberPaymentDeatilChargeSelectList" , memberNo);
   }

   @Override
   public Map<String, Object> myPageProfileDetailMemberSelectOne(int memberNo) {
      // TODO Auto-generated method stub
      return sqlSession.selectOne(nameSpace + "myPageProfileDetailMemberSelectOne" , memberNo);
   }

   @Override
   public Map<String, Object> myPageProfileDetailPetSelectOne(int memberNo) {
      // TODO Auto-generated method stub
      return sqlSession.selectOne(nameSpace + "myPageProfileDetailPetSelectOne" , memberNo);
   }

   @Override
   public int memberPwdChange(MemberDto memberDto) {
      // TODO Auto-generated method stub
      return sqlSession.update(nameSpace + "memberPwdChange", memberDto);
   }

   @Override
	public void memberPointUpdate(MemberDto memberDto) {
		// TODO Auto-generated method stub
		sqlSession.update(nameSpace + "memberPointUpdate", memberDto);
	}

	@Override
	public void memberEmoneyUpdate(MemberDto memberDto) {
		// TODO Auto-generated method stub
		sqlSession.update(nameSpace + "memberEmoneyUpdate", memberDto);
	}

	@Override
	public List<Map<String, Object>> memberSelectCartList(int memberNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + "memberSelectCartList", memberNo);
	}

	@Override
	public void memberInfoDelete(MemberDto memberDto) {
		// TODO Auto-generated method stub
		sqlSession.delete(nameSpace + "memberInfoDelete", memberDto);
	}

	@Override
	public void memberInfoUpdate(MemberDto memberDto) {
		// TODO Auto-generated method stub
		sqlSession.update(nameSpace + "memberInfoUpdate", memberDto);
	}

//	@Override
//	public void petInfoUpdate(String petName, double petWeight, int petNo) {
//		// TODO Auto-generated method stub
//		 Map<String, Object> map = new HashMap<String, Object>();
//	     map.put("petName", petName);
//	     map.put("petWeight", petWeight);
//	     map.put("petNo", petNo);
//	     
//	     sqlSession.update(nameSpace + "petInfoUpdate", map);
//	}

	@Override
	public void updateCartQuantity(int memberNo, int productNo, int quantity) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("productNo", productNo);
		map.put("quantity", quantity);

		sqlSession.selectOne(nameSpace + "updateCartQuantity", map);
	}

	@Override
	public void petInfoUpdate(PetDto petDto) {
		// TODO Auto-generated method stub
		sqlSession.update(nameSpace + "petInfoUpdate", petDto);
	}

	@Override
	public void insertChargeOne(int memberNo, int chargeAmount) {
		// TODO Auto-generated method stub
		ChargeDto chargeDto = new ChargeDto();
		chargeDto.setMemberNo(memberNo);
		chargeDto.setChagrgeAmount(chargeAmount);
		sqlSession.insert(nameSpace + "insertChargeOne", chargeDto);
	}

	@Override
	public int memberCheckId(String memberId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + "memberCheckId", memberId);
			    		
	}

	@Override
	public int memberCheckEmail(String memberEmail, String memberId) {
	    Map<String, String> params = new HashMap<>();
	    params.put("memberEmail", memberEmail);
	    params.put("memberId", memberId);
	    return sqlSession.selectOne(nameSpace + "memberCheckEmail", params);
	}

	@Override
	public int memberCheckEmail2(String memberEmail) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + "memberCheckEmail2", memberEmail);
	}

	@Override
	public int memberCheckPhone(String memberEmail, String memberPhone) {
		Map<String, String> params = new HashMap<>();
	    params.put("memberEmail", memberEmail);
	    params.put("memberPhone", memberPhone);
	    return sqlSession.selectOne(nameSpace + "memberCheckPhone", params);
	}

}