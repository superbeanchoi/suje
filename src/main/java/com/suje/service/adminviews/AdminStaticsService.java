package com.suje.service.adminviews;

import java.util.List;

import com.suje.domain.adminviews.AdminStaticsVO;

public interface AdminStaticsService {
	
	public AdminStaticsVO getTodaySuje();
	public AdminStaticsVO getWeekPeriod();
	public List<AdminStaticsVO> getCatePay();
	public AdminStaticsVO getMemberSex();
	public AdminStaticsVO getMemberAge();
	public List<AdminStaticsVO> getTotalDateSales();
	public AdminStaticsVO getTotalSales();
}
