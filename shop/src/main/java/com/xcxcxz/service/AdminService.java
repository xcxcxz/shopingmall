package com.xcxcxz.service;

import java.util.List;

import com.xcxcxz.model.BookVO;
import com.xcxcxz.model.CateVO;

public interface AdminService {
	
	/* 상품 등록 */
	public void bookEnroll(BookVO book);
	
	/* 카테고리 리스트 */
	public List<CateVO> cateList();

}
