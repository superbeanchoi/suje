package com.suje.controller.main;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.suje.domain.main.MainVO;
import com.suje.service.main.MainService;

@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private MainService mainService;
	
	//Index에서 메인 페이지 호출
	@RequestMapping(value = "indexMain")
	public String viewIndexMain(Model model) {
		
		logger.info("인덱스 메인 호출 컨트롤러");
		List<MainVO> voReviewList = mainService.getRecentRealTimeReview();
		List<MainVO> voFeedList = mainService.getRecentStoreFeed();
		
		model.addAttribute("realTimeReview", voReviewList);
		model.addAttribute("realTimeFeed", voFeedList);
		
		return "main";
	}
	
	//실시간 후기 더보기 버튼(추후 사용)
	@RequestMapping(value = "mainRealTimeReview.do")
	public String moreReviewPage() {
		logger.info("실시간 후기 페이지 호출 컨트롤러");
		return "main/mainRealTimeReview";
	}
	
	//스토어 더보기 버튼(추후 사용)
	@RequestMapping(value = "mainPopularRank.do")
	public String moreStore() {
		logger.info("스토어 전체 검색 페이지 호출 컨트롤러");
		return "forward:/viewStoreCategory.do?page=1&mCate=전체&mmCate= &orderBy=1";
	}
}
