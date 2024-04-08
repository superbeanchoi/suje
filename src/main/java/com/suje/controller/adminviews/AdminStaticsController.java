package com.suje.controller.adminviews;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.suje.service.adminviews.AdminStaticsService;

@Controller
public class AdminStaticsController {

	private static final Logger logger = LoggerFactory.getLogger(AdminStaticsController.class);

	@Autowired
	private AdminStaticsService adminStaticsService;
	
	//통계 페이지 이동
	@RequestMapping("adminStatics.do")
	public String adminStatics(Model model) {
		
		logger.info("오늘의 수제 컨트롤러");
		model.addAttribute("todaySuje", adminStaticsService.getTodaySuje());
		
		logger.info("통계 주간 계산 컨트롤러");
		model.addAttribute("weekPeriod", adminStaticsService.getWeekPeriod());
		
		logger.info("카테고리별 결제 컨트롤러");
		model.addAttribute("catePay", adminStaticsService.getCatePay());
		
		logger.info("가입회원 성별 컨트롤러");
		model.addAttribute("memberSex", adminStaticsService.getMemberSex());
		
		logger.info("가입회원 나이 컨트롤러");
		model.addAttribute("memberAge", adminStaticsService.getMemberAge());
		
		logger.info("전주 일별 매출 컨트롤러");
		model.addAttribute("totalDateSales", adminStaticsService.getTotalDateSales());
		
		logger.info("전주 총매출 컨트롤러");
		model.addAttribute("totalSales", adminStaticsService.getTotalSales());
		
		return "adminviews/adminStatistics";
	}
}
