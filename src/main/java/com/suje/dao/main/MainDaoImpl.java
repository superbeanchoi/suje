package com.suje.dao.main;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suje.domain.main.MainVO;

@Repository("MainDao")
public class MainDaoImpl implements MainDao {

	private static final Logger logger = LoggerFactory.getLogger(MainDaoImpl.class);
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public List<MainVO> getRecentRealTimeReview() {
		logger.info("인덱스 메인 실시간후기 호출 마이바티스");
		return mybatis.selectList("MainDao.getRecentRealTimeReview");
	}
	
	@Override
	public List<MainVO> getRecentStoreFeed() {
		logger.info("인덱스 메인 스토어피드 호출 마이바티스");
		return mybatis.selectList("MainDao.getRecentStoreFeed");
	}
	
	
}
