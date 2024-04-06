package com.suje.service.main;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suje.dao.main.StoreEachDao;
import com.suje.domain.main.StoreEachVO;

@Service("StoreEachService")
public class StoreEachServiceImpl implements StoreEachService {

	private static final Logger logger = LoggerFactory.getLogger(StoreEachServiceImpl.class);

	@Autowired
	private StoreEachDao storeEachDao;
	
	@Override
	public StoreEachVO getStoreInfoDetail(String sId) {
		logger.info("스토어 프로필 페이지 정보 서비스");
		return storeEachDao.getStoreInfoDetail(sId);
	}
	
	@Override
	public List<StoreEachVO> getStoreNotiList(String sId) {
		logger.info("스토어 공지사항 정보 서비스");
		return storeEachDao.getStoreNotiList(sId);
	}
	
	@Override
	public List<StoreEachVO> getStoreGoodsList(String sId) {
		logger.info("스토어 피드 서비스");
		return storeEachDao.getStoreGoodsList(sId);
	}
	
	@Override
	public StoreEachVO eachNoticeView(StoreEachVO vo) {
		logger.info("스토어 공지사항 상세보기 서비스");
		return storeEachDao.eachNoticeView(vo);
	}
	
	@Override
	public StoreEachVO eachStoreGoods(StoreEachVO vo) {
		logger.info("스토어 피드 상세보기 서비스");
		return storeEachDao.eachStoreGoods(vo);
	}
	
	@Override
	public List<StoreEachVO> eachStoreGoodsImg(StoreEachVO vo) {
		logger.info("스토어 피드 이미지 서비스");
		return storeEachDao.eachStoreGoodsImg(vo);
	}
	
	@Override
	public void orderSend(StoreEachVO vo) {
		logger.info("주문 요청 서비스");
		storeEachDao.orderSend(vo);
	}
}
