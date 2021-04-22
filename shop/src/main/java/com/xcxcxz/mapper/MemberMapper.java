package com.xcxcxz.mapper;

import com.xcxcxz.model.MemberVO;

public interface MemberMapper {
	
		//회원가입
		public void memberRegister(MemberVO member);
		
		// 아이디 중복 검사
		public int idCheck(String memberId);

		 /* 로그인 */
	    public MemberVO memberLogin(MemberVO member);
}
