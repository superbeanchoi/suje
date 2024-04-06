package com.suje.service.category;

import java.util.List;

import com.suje.domain.category.CategoryVO;

public interface CategoryMainService {

	
	public List<CategoryVO> getCateMain(); // 대분류 카테고리 리스트
	public List<CategoryVO> getCateMidList(); // 중분류 카테고리 리스트
	public List<CategoryVO> getCateMid(int cateCode); // 조건에 맞는 중분류 카테고리 리스트 가져오기
	public List<CategoryVO> getCateSub(int cateCode); // 조건에 맞는 소분류 카테고리 리스트 가져오기
}

