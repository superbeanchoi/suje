package com.suje.dao.main;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suje.domain.main.MainFleaMarketVO;

@Repository("MainFleaMarketDao")
public class MainFleaMarketDaoImpl implements MainFleaMarketDao {

	private static final Logger logger = LoggerFactory.getLogger(MainFleaMarketDaoImpl.class);
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public int getTotalAllCountPage() {
		logger.info("플리마켓 전체 행수 마이바티스");
		return mybatis.selectOne("MainFleaMarketDao.getTotalAllCountPage");
	}
	
	@Override
	public int getLimitTotalCountPage(MainFleaMarketVO vo) {
		logger.info("플리마켓 조건 포함 행수 마이바티스");
		return mybatis.selectOne("MainFleaMarketDao.getLimitTotalCountPage", vo);
	}
	
	@Override
	public List<MainFleaMarketVO> getFleaAllList(MainFleaMarketVO vo) {
		logger.info("플리마켓 전체 상품 마이바티스");
		return mybatis.selectList("MainFleaMarketDao.getFleaAllList", vo);
	}
	
	@Override
	public MainFleaMarketVO getfleaDetail(String fCode) {
		logger.info("플리마켓 상품 상세 마이바티스 "+fCode);
		return mybatis.selectOne("MainFleaMarketDao.getfleaDetail", fCode);
	}
	
	@Override
	public List<MainFleaMarketVO> getfleaDetailSubImg(String fCode) {
		logger.info("플리마켓 상품 서브이미지 마이바티스 "+fCode);
		return mybatis.selectList("MainFleaMarketDao.getfleaDetailSubImg", fCode);
	}
	
	@Override
	public MainFleaMarketVO getPayInfo(MainFleaMarketVO vo) {
		logger.info("구매자 결제정보 마이바티스");
		return mybatis.selectOne("MainFleaMarketDao.getPayInfo", vo);
	}
	
	@Override
	public MainFleaMarketVO getFleaBuyingMemberInfo(MainFleaMarketVO vo) {
		logger.info("플리마켓 모달 구매자 정보 마이바티스 "+vo.getM_id());
		return mybatis.selectOne("MainFleaMarketDao.getFleaBuyingMemberInfo", vo);
	}
	
	@Override
	public String getFleaPaySeq() {
		logger.info("플리마켓 구매 테이블 시퀀스 호출 마이바티스");
		return mybatis.selectOne("MainFleaMarketDao.getFleaPaySeq");
	}
	
	@Override
	public void fleaPayInsert(MainFleaMarketVO vo) {
		logger.info("플리마켓 상품 구매 마이바티스"+vo.getF_code()+vo.getM_id()+vo.getPt_code()+vo.getFp_sum()+vo.getFp_count());
		mybatis.insert("MainFleaMarketDao.fleaPayInsert", vo);
	}
	
	@Override
	public void fleaDeliveryInsert(MainFleaMarketVO vo) {
		logger.info("플리마켓 상품 배송정보 마이바티스"+vo.getFd_name()+vo.getFd_tel()+vo.getFd_addr()+vo.getFd_memo());
		mybatis.insert("MainFleaMarketDao.fleaDeliveryInsert", vo);
	}
	
	@Override
	public void fleaUpdate(MainFleaMarketVO vo) {
		logger.info("플리마켓 상품 정보 수정 서비스");
		mybatis.update("MainFleaMarketDao.fleaUpdate", vo);
	}
}
