package com.suje.service.main;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suje.dao.main.MainFleaMarketDao;
import com.suje.domain.main.MainFleaMarketVO;

@Service("MainFleaMarketService")
public class MainFleaMarketServiceImpl implements MainFleaMarketService {

	private static final Logger logger = LoggerFactory.getLogger(MainFleaMarketServiceImpl.class);

	@Autowired
	private MainFleaMarketDao mainFleaMarketDao;
	
	@Override
	public int getTotalAllCountPage() {
		// TODO Auto-generated method stub
		logger.info("플리마켓 전체 행수 서비스");
		return mainFleaMarketDao.getTotalAllCountPage();
	}
	
	@Override
	public int getLimitTotalCountPage(MainFleaMarketVO vo) {
		// TODO Auto-generated method stub
		logger.info("플리마켓 조건 포함 행수 서비스");
		return mainFleaMarketDao.getLimitTotalCountPage(vo);
	}
	
	@Override
	public List<MainFleaMarketVO> getFleaAllList(MainFleaMarketVO vo) {
		logger.info("플리마켓 전체 상품 서비스");
		return mainFleaMarketDao.getFleaAllList(vo);
	}
	
	@Override
	public MainFleaMarketVO getfleaDetail(String fCode) {
		logger.info("플리마켓 상품 상세 서비스 "+fCode);
		return mainFleaMarketDao.getfleaDetail(fCode);
	}
	
	@Override
	public List<MainFleaMarketVO> getfleaDetailSubImg(String fCode) {
		logger.info("플리마켓 상품 서브이미지 서비스 "+fCode);
		return mainFleaMarketDao.getfleaDetailSubImg(fCode);
	}
	
	@Override
	public MainFleaMarketVO getPayInfo(MainFleaMarketVO vo) {
		logger.info("구매자 결제정보 서비스");
		return mainFleaMarketDao.getPayInfo(vo);
	}
	
	@Override
	public MainFleaMarketVO getFleaBuyingMemberInfo(MainFleaMarketVO vo) {
		logger.info("플리마켓 모달 구매자 정보 서비스 "+vo.getM_id());
		return mainFleaMarketDao.getFleaBuyingMemberInfo(vo);
	}
	
	@Override
	public String getFleaPaySeq() {
		logger.info("플리마켓 구매 테이블 시퀀스 호출 서비스");
		return mainFleaMarketDao.getFleaPaySeq();
	}
	
	@Override
	public void fleaPayInsert(MainFleaMarketVO vo) {
		logger.info("플리마켓 상품 구매 서비스");
		mainFleaMarketDao.fleaPayInsert(vo);
	}
	
	@Override
	public void fleaDeliveryInsert(MainFleaMarketVO vo) {
		logger.info("플리마켓 상품 배송정보 서비스");
		mainFleaMarketDao.fleaDeliveryInsert(vo);
	}
	
	@Override
	public void fleaUpdate(MainFleaMarketVO vo) {
		logger.info("플리마켓 상품 정보 수정 서비스");
		mainFleaMarketDao.fleaUpdate(vo);
		
	}
}
