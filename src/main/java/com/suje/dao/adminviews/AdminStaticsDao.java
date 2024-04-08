package com.suje.dao.adminviews;

import java.util.List;

import com.suje.domain.adminviews.AdminStaticsVO;

public interface AdminStaticsDao {
	
	public AdminStaticsVO getTodaySuje();
	public AdminStaticsVO getWeekPeriod();
	public List<AdminStaticsVO> getCatePay();
	public AdminStaticsVO getMemberSex();
	public AdminStaticsVO getMemberAge();
	public List<AdminStaticsVO> getTotalDateSales();
	public AdminStaticsVO getTotalSales();
}
