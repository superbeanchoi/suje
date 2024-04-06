package com.suje.dao.main;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suje.domain.main.StoreEachVO;

@Repository("StoreEachDao")
public class StoreEachDaoImpl implements StoreEachDao {

	private static final Logger logger = LoggerFactory.getLogger(StoreEachDaoImpl.class);

	@Autowired
	private SqlSessionTemplate mybatis;	
	
	@Override
	public StoreEachVO getStoreInfoDetail(String sId) {
		logger.info("스토어 프로필 페이지 정보 마이바티스");
		return mybatis.selectOne("StoreEachDao.getStoreInfoDetail", sId);
	}
	
	@Override
	public List<StoreEachVO> getStoreNotiList(String sId) {
		logger.info("스토어 공지사항 정보 마이바티스");
		return mybatis.selectList("StoreEachDao.getStoreNotiList", sId);
	}
	
	@Override
	public List<StoreEachVO> getStoreGoodsList(String sId) {
		logger.info("스토어 피드 마이바티스");
		return mybatis.selectList("StoreEachDao.getStoreGoodsList", sId);
	}
	
	@Override
	public StoreEachVO eachNoticeView(StoreEachVO vo) {
		logger.info("스토어 공지사항 상세보기 마이바티스");
		return mybatis.selectOne("StoreEachDao.eachNoticeView", vo);
	}
	
	@Override
	public StoreEachVO eachStoreGoods(StoreEachVO vo) {
		logger.info("스토어 피드 상세보기 마이바티스");
		return mybatis.selectOne("StoreEachDao.eachStoreGoods", vo);
	}
	
	@Override
	public List<StoreEachVO> eachStoreGoodsImg(StoreEachVO vo) {
		logger.info("스토어 피드 이미지 마이바티스");
		return mybatis.selectList("StoreEachDao.eachStoreGoodsImg", vo);
	}
	
	@Override
	public void orderSend(StoreEachVO vo) {
		logger.info("주문 요청 마이바티스");
		mybatis.insert("StoreEachDao.orderSend", vo);
	}
}
