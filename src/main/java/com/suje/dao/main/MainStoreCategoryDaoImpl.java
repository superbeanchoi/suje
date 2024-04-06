package com.suje.dao.main;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suje.domain.main.MainStoreCategoryVO;

@Repository("MainStoreCategoryDao")
public class MainStoreCategoryDaoImpl implements MainStoreCategoryDao {

	private static final Logger logger = LoggerFactory.getLogger(MainStoreCategoryDaoImpl.class);
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public int getTotalAllCountPage() {
		logger.info("스토어 전체 행수 마이바티스");
		return mybatis.selectOne("MainStoreCategoryDao.getTotalAllCountPage");
	}
	
	@Override
	public int getLimitTotalCountPage(MainStoreCategoryVO vo) {
		logger.info("스토어 2차 조건 포함 행수 마이바티스");
		return mybatis.selectOne("MainStoreCategoryDao.getLimitTotalCountPage", vo);
	}
	
	@Override
	public List<MainStoreCategoryVO> getStoreAllList(MainStoreCategoryVO vo) {
		logger.info("스토어 전체 상품 마이바티스");
		return mybatis.selectList("MainStoreCategoryDao.getStoreAllList", vo);
	}
	
	@Override
	public MainStoreCategoryVO getStoreInfo(String sId) {
		logger.info("스토어 상세 정보 페이지 마이바티스");
		return mybatis.selectOne("MainStoreCategoryDao.getStoreInfo", sId);
	}
	
	@Override
	public int getReviewTotalCountPage(String sId) {
		logger.info("리뷰 전체 행수 마이바티스");
		return mybatis.selectOne("MainStoreCategoryDao.getReviewTotalCountPage", sId);
	}
	
	@Override
	public List<MainStoreCategoryVO> getStoreReviewList(MainStoreCategoryVO vo) {
		logger.info("리뷰 전체 리뷰 마이바티스");
		return mybatis.selectList("MainStoreCategoryDao.getStoreReviewList", vo);
	}
	
	@Override
	public void updateReviewLike(MainStoreCategoryVO vo) {
		logger.info("리뷰추천 마이바티스 "+vo.getRv_code());
		mybatis.update("MainStoreCategoryDao.updateReviewLike", vo);
	}
	
	@Override
	public String reviewLikeView(MainStoreCategoryVO vo) {
		logger.info("리뷰추천수 불러오기 컨트롤러 "+vo.getRv_code());
		return mybatis.selectOne("MainStoreCategoryDao.reviewLikeView", vo);
	}
}
