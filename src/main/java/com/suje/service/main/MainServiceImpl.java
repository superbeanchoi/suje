package com.suje.service.main;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suje.dao.main.MainDao;
import com.suje.domain.main.MainVO;

@Service("MainService")
public class MainServiceImpl implements MainService {

	private static final Logger logger = LoggerFactory.getLogger(MainServiceImpl.class);

	@Autowired
	private MainDao mainDao;
	
	@Override
	public List<MainVO> getRecentRealTimeReview() {
		logger.info("인덱스 메인 실시간후기 호출 서비스");
		return mainDao.getRecentRealTimeReview();
	}
	
	@Override
	public List<MainVO> getRecentStoreFeed() {
		logger.info("인덱스 메인 스토어피드 호출 서비스");
		return mainDao.getRecentStoreFeed();
	}
	
}
