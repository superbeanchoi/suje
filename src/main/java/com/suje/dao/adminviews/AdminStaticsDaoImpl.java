package com.suje.dao.adminviews;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suje.domain.adminviews.AdminStaticsVO;
import com.suje.service.adminviews.AdminManageServiceImple;

@Repository("AdminStaticsDao")
public class AdminStaticsDaoImpl implements AdminStaticsDao {

	private static final Logger logger = LoggerFactory.getLogger(AdminManageServiceImple.class);

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public AdminStaticsVO getTodaySuje() {
		logger.info("오늘의 수제 마이바티스");
		return mybatis.selectOne("AdminStaticsDao.getTodaySuje");
	}
	
	@Override
	public AdminStaticsVO getWeekPeriod() {
		logger.info("통계 주간 계산 마이바티스");
		return mybatis.selectOne("AdminStaticsDao.getWeekPeriod");
	}
	
	@Override
	public List<AdminStaticsVO> getCatePay() {
		logger.info("카테고리별 결제 마이바티스");
		return mybatis.selectList("AdminStaticsDao.getCatePay");
	}
	
	@Override
	public AdminStaticsVO getMemberSex() {
		logger.info("가입회원 성별 마이바티스");
		return mybatis.selectOne("AdminStaticsDao.getMemberSex");
	}
	
	@Override
	public AdminStaticsVO getMemberAge() {
		logger.info("가입회원 나이 마이바티스");
		return mybatis.selectOne("AdminStaticsDao.getMemberAge");
	}
	
	@Override
	public List<AdminStaticsVO> getTotalDateSales() {
		logger.info("전주 일별 매출 마이바티스");
		return mybatis.selectList("AdminStaticsDao.getTotalDateSales");
	}
	
	@Override
	public AdminStaticsVO getTotalSales() {
		logger.info("전주 총매출 마이바티스");
		return mybatis.selectOne("AdminStaticsDao.getTotalSales");
	}
}
