package com.suje.dao.category;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suje.domain.category.CategoryVO;

@Repository
public class CategoryMainDAOImpl  implements CategoryMainDAO{
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	// 대분류 카테고리 리스트
	@Override
	public List<CategoryVO> getCateMain() {
		return mybatis.selectList("categoryDAO.getCateMain");
	}
	
	// 중분류 카테고리 리스트
	@Override
	public List<CategoryVO> getCateMidList() {
		return mybatis.selectList("categoryDAO.getCateMidList");
	}
	
	// 조건에 맞는 중분류 카테고리 리스트 가져오기
	@Override
	public List<CategoryVO> getCateMid(int cateCode) {
		return mybatis.selectList("categoryDAO.getCateMid",cateCode);
	}
	
	// 조건에 맞는 소분류 카테고리 리스트 가져오기
	@Override
	public List<CategoryVO> getCateSub(int cateCode) {
		return mybatis.selectList("categoryDAO.getCateSub",cateCode);
	}

}
 