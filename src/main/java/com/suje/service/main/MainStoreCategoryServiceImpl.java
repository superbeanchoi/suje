package com.suje.service.main;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suje.dao.main.MainStoreCategoryDao;
import com.suje.domain.main.MainStoreCategoryVO;

@Service("MainStoreCategoryService")
public class MainStoreCategoryServiceImpl implements MainStoreCategoryService {
	
	private static final Logger logger = LoggerFactory.getLogger(MainStoreCategoryServiceImpl.class);

	@Autowired
	private MainStoreCategoryDao mainStoreCategoryDao;
	
	@Override
	public int getTotalAllCountPage() {
		logger.info("스토어 전체 행수 서비스");
		return mainStoreCategoryDao.getTotalAllCountPage();
	}
	
	@Override
	public int getLimitTotalCountPage(MainStoreCategoryVO vo) {
		logger.info("스토어 2차 조건 포함 행수 서비스");
		return mainStoreCategoryDao.getLimitTotalCountPage(vo);
	}
	
	@Override
	public List<MainStoreCategoryVO> getStoreAllList(MainStoreCategoryVO vo) {
		logger.info("스토어 전체 상품 서비스");
		return mainStoreCategoryDao.getStoreAllList(vo);
	}
	
	@Override
	public MainStoreCategoryVO getStoreInfo(String sId) {
		logger.info("스토어 상세 정보 페이지 서비스");
		return mainStoreCategoryDao.getStoreInfo(sId);
	}
	
	@Override
	public int getReviewTotalCountPage(String sId) {
		logger.info("리뷰 전체 행수 서비스");
		return mainStoreCategoryDao.getReviewTotalCountPage(sId);
	}
	
	@Override
	public List<MainStoreCategoryVO> getStoreReviewList(MainStoreCategoryVO vo) {
		logger.info("리뷰 전체 리뷰 서비스");
		return mainStoreCategoryDao.getStoreReviewList(vo);
	}
	
	@Override
	public void updateReviewLike(MainStoreCategoryVO vo) {
		logger.info("리뷰추천 서비스 "+vo.getRv_code());
		mainStoreCategoryDao.updateReviewLike(vo);
	}
	
	@Override
	public String reviewLikeView(MainStoreCategoryVO vo) {
		logger.info("리뷰추천수 불러오기 컨트롤러 "+vo.getRv_code());
		return mainStoreCategoryDao.reviewLikeView(vo);
	}
}
