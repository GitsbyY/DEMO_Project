package com.demo.member.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.demo.member.dao.MemberDao;
import com.demo.member.dto.MemberDto;
import com.demo.member.dto.PetDto;

@Service
public class MemberServiceImpl implements MemberService{
   //bean에 등록하는 것. 객체 생성과 같다.
   
   
   private static final Logger log = LoggerFactory.getLogger(MemberServiceImpl.class);
   @Autowired
   public MemberDao memberDao;
   @Override
   public int memberInsertOne(MemberDto memberDto) {
      // TODO Auto-generated method stub
      return memberDao.memberInsertOne(memberDto);
   }
   @Override
   public void petInsertOne(PetDto petDto) {
      // TODO Auto-generated method stub
      memberDao.petrInsertOne(petDto);
   }
   @Override
   public boolean isIdAvailable(String memberId) {
      // TODO Auto-generated method stub
      return memberDao.isIdAvailable(memberId);
   }
   @Override
   public MemberDto memberExist(String memberId, String memberPassword) {
      // TODO Auto-generated method stub
      return memberDao.memberExist(memberId, memberPassword);
   }
   @Override
   public MemberDto memberFindId(String memberEmail, String memberPhone) {
      // TODO Auto-generated method stub
      return memberDao.memberFindId(memberEmail, memberPhone);
   }
   @Override
   public MemberDto memberFindPassword(String memberId, String memberEmail) {
      // TODO Auto-generated method stub
      return memberDao.memberFindPassword(memberId, memberEmail);
   }
   @Override
   public int memberSelectListTotalCount() {
      // TODO Auto-generated method stub
      return memberDao.memberSelectListTotalCount();
   }
   @Override
   public List<Map<String, Object>> memberInfoSelectList(int start, int end) {
      // TODO Auto-generated method stub
      return memberDao.memberInfoSelectList(start, end);
   }
   @Override
   public List<Map<String, Object>> memberPaymentSelectList(int start, int end) {
      // TODO Auto-generated method stub
      return memberDao.memberPaymentSelectList(start, end);
   }
   @Override
   public Map<String, Object> memberPaymentDeatilSelectOne(int memberNo) {
      // TODO Auto-generated method stub
      return memberDao.memberPaymentDeatilSelectOne(memberNo);
   }
   @Override
   public List<Map<String, Object>> memberPaymentDeatilChargeSelectList(int memberNo) {
      // TODO Auto-generated method stub
      return memberDao.memberPaymentDeatilChargeSelectList(memberNo);
   }

   @Override
   public Map<String, Object> myPageProfileDetailMemberSelectOne(int memberNo) {
      // TODO Auto-generated method stub
      return memberDao.myPageProfileDetailMemberSelectOne(memberNo);
   }
   @Override
   public Map<String, Object> myPageProfileDetailPetSelectOne(int memberNo) {
      // TODO Auto-generated method stub
      return memberDao.myPageProfileDetailPetSelectOne(memberNo);
   }         
   @Override
   public int memberPwdChange(MemberDto memberDto) {
      // TODO Auto-generated method stub
      return memberDao.memberPwdChange(memberDto);
   }
   
   @Override
	public void memberPointUpdate(MemberDto memberDto) {
		// TODO Auto-generated method stub
		memberDao.memberPointUpdate(memberDto);
	}
	@Override
	public void memberEmoneyUpdate(MemberDto memberDto) {
		// TODO Auto-generated method stub
		memberDao.memberEmoneyUpdate(memberDto);
	}
	@Override
	public List<Map<String, Object>> memberSelectCartList(int memberNo) {
		// TODO Auto-generated method stub
		return memberDao.memberSelectCartList(memberNo);
	}
	@Override
	public void memberInfoDelete(MemberDto memberDto) {
		// TODO Auto-generated method stub
		memberDao.memberInfoDelete(memberDto);
	}
	@Override
	public void memberInfoUpdate(MemberDto memberDto) {
		// TODO Auto-generated method stub
		memberDao.memberInfoUpdate(memberDto);
	}

//	@Override
//	public void petInfoUpdate(String petName, double petWeight, int petNo) {
//		// TODO Auto-generated method stub
//		memberDao.petInfoUpdate(petName, petWeight, petNo);
//	}

	@Override
	public void updateCartQuantity(int memberNo, int productNo, int quantity) {
		// TODO Auto-generated method stub
		memberDao.updateCartQuantity(memberNo, productNo, quantity);
	}
	@Override
	public void petInfoUpdate(PetDto petDto) {
		// TODO Auto-generated method stub
		memberDao.petInfoUpdate(petDto);
	}
	@Override
	public void insertChargeOne(int memberNo, int chargeAmount) {
		// TODO Auto-generated method stub
		memberDao.insertChargeOne(memberNo, chargeAmount);
	}
	@Override
	public int memberCheckId(String memberId) {
		// TODO Auto-generated method stub
		return memberDao.memberCheckId(memberId);
	}
	@Override
	public int memberCheckEmail(String memberEmail, String memberId) {
		// TODO Auto-generated method stub
		return memberDao.memberCheckEmail(memberEmail, memberId);
	}
   
}