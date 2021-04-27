package com.xcxcxz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xcxcxz.mapper.MemberMapper;
import com.xcxcxz.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberMapper membermapper;

	@Override
	public void memberRegister(MemberVO member) throws Exception {
		membermapper.memberRegister(member);
	}
	
	@Override
	public int idCheck(String memberId) throws Exception {
		
		return membermapper.idCheck(memberId);
	}
	
	 /* 로그인 */
    @Override
    public MemberVO memberLogin(MemberVO member) throws Exception {
        
        return membermapper.memberLogin(member);
    }
    
    

}
