package com.xcxcxz.service;

import com.xcxcxz.model.MemberVO;

public interface MemberService {
	
		//회원가입
		public void memberRegister(MemberVO member) throws Exception;
		
		// 아이디 중복 검사
		public int idCheck(String memberId) throws Exception;

}
