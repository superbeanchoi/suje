package com.suje.service.adminviews;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suje.dao.adminviews.AdminStaticsDao;
import com.suje.domain.adminviews.AdminStaticsVO;

@Service("AdminStaticsService")
public class AdminStaticsServiceImple implements AdminStaticsService {

	private static final Logger logger = LoggerFactory.getLogger(AdminStaticsServiceImple.class);

	@Autowired
	private AdminStaticsDao adminStaticsDao;

	@Override
	public AdminStaticsVO getTodaySuje() {
		logger.info("오늘의 수제 서비스");
		return adminStaticsDao.getTodaySuje();
	}
	
	@Override
	public AdminStaticsVO getWeekPeriod() {
		logger.info("통계 주간 계산 서비스");
		return adminStaticsDao.getWeekPeriod();
	}
	
	@Override
	public List<AdminStaticsVO> getCatePay() {
		logger.info("카테고리별 결제 서비스");
		return adminStaticsDao.getCatePay();
	}
	
	@Override
	public AdminStaticsVO getMemberSex() {
		logger.info("가입회원 성별 서비스");
		return adminStaticsDao.getMemberSex();
	}
	
	@Override
	public AdminStaticsVO getMemberAge() {
		logger.info("가입회원 나이 서비스");
		return adminStaticsDao.getMemberAge();
	}
	
	@Override
	public List<AdminStaticsVO> getTotalDateSales() {
		logger.info("전주 일별 매출 서비스");
		return adminStaticsDao.getTotalDateSales();
	}
	
	@Override
	public AdminStaticsVO getTotalSales() {
		logger.info("전주 총매출 서비스");
		return adminStaticsDao.getTotalSales();
	}

}
