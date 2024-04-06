package com.suje.controller.main;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.suje.domain.main.MainPopularRankVO;
import com.suje.domain.main.StoreEachVO;
import com.suje.service.main.MainPopularRankService;

@Controller
public class MainPopularRankController {

	private static final Logger logger = LoggerFactory.getLogger(MainPopularRankController.class);
	
	@Autowired
	private MainPopularRankService mainPopularRankService;
	
	//인기랭킹 조회
	@RequestMapping(value="popularRank")
	public String popularRank(@RequestParam("cate") String cate, Model model) {
		logger.info("인기랭킹 조회 컨트롤러");
		model.addAttribute("cate", cate);
		model.addAttribute("popularRankList", mainPopularRankService.popularRank(cate));
		return "main/mainPopularRank";
	}
	
	//인기랭킹 굿즈 정보 불러오기
	@RequestMapping(value="popularRankGoodsImg", produces="application/json; charset=utf8")
	@ResponseBody
	public List<MainPopularRankVO> popularRankGoodsImg(MainPopularRankVO vo) {
		logger.info("스토어 실시간 굿즈 미리보기 컨트롤러");
		return mainPopularRankService.popularRankGoodsImg(vo);
	}
	
}
