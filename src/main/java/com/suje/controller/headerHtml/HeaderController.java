package com.suje.controller.headerHtml;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HeaderController {

	private static final Logger logger = LoggerFactory.getLogger(HeaderController.class);
	
	//멤버 메인페이지 이동
	@RequestMapping("memberMain.do")
	public String viewMemberMain() {
		return "redirect: index.jsp";
	}
	
	//스토어 메인페이지 이동
	@RequestMapping("storeMain.do")
	public String viewStoreMain() {
		return "storeAdmin/storeProfile";
	}
	
	//어드민 메인페이지 이동
	@RequestMapping("adminMain.do")
	public String viewAdminMain() {
		return "forward:/adminStatics.do";
	}
	
	//인기 랭킹 페이지 이동
	@RequestMapping("viewPopularRank.do")
	public String viewPopularRank() {
		return "forward:/popularRank.do?cate=0";
	}
	
	//실시간 후기 페이지 이동
	@RequestMapping("viewRealTimeReview.do")
	public String viewRealTimeReview() {
		return "forward:/realTimeReview.do?page=1";
	}
	
	//커뮤니티 페이지 이동
	@RequestMapping("viewMainComm.do")
	public String viewMainComm() {
		return "forward:/communityMain.do?page=1&cCate=전체";
	}
	
	//플리마켓 페이지 이동
	@RequestMapping("viewFleaMarket.do")
	public String viewFleaMarket() {
		return "forward:/fleaMarketMain.do?page=1&mCate=전체&mmCate= &orderBy=1";
	}
	
	//헤더 페이지 이동
	@RequestMapping("{step}.do")
	public String viewPage(@PathVariable String step) {
		logger.info("STEP 컨트롤러");
		if(step.contains("main")) {
			return "main/"+step;
		} else if(step.contains("admin")) {
			return "adminviews/"+step;
		} else {
			return "redirect: index.jsp";
		}
	}
}
