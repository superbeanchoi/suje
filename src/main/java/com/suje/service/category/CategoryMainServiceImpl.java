package com.suje.service.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suje.dao.category.CategoryMainDAO;
import com.suje.domain.category.CategoryVO;

@Service
public class CategoryMainServiceImpl implements CategoryMainService {

   @Autowired
   CategoryMainDAO cateMainDAO;

   // 대분류 카테고리 리스트
   @Override
   public List<CategoryVO> getCateMain() {
      return cateMainDAO.getCateMain();
   }

	// 중분류 카테고리 리스트
	@Override
	public List<CategoryVO> getCateMidList() {
		return cateMainDAO.getCateMidList();
	}

	// 조건에 맞는 중분류 카테고리 리스트
	@Override
	public List<CategoryVO> getCateMid(int cateCode) {
		return cateMainDAO.getCateMid(cateCode);
	}

	// 조건에 맞는 소분류 카테고리 리스트 가져오기
	@Override
	public List<CategoryVO> getCateSub(int cateCode) {
		return cateMainDAO.getCateSub(cateCode);
	}

}
