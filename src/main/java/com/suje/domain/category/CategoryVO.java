package com.suje.domain.category;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CategoryVO {

	
	// 대분류 카테고리 변수
	private int catem_code;
	private String catem_name;
	
	// 중분류 카테고리 변수
	private int catemm_code;
	private String catemm_name;
	
	// 소분류 카테고리 변수
	private int cates_code;
	private String cates_name;
	
}

