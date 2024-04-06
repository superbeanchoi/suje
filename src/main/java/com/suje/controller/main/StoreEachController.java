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

import com.suje.domain.main.StoreEachVO;
import com.suje.service.main.StoreEachService;

@Controller
public class StoreEachController {
	
private static final Logger logger = LoggerFactory.getLogger(StoreEachController.class);
	
	@Autowired
	private StoreEachService storeEachService;
	
	//스토어 프로필 페이지 불러오기
	@RequestMapping("viewStoreEach.do")
	public String viewStoreEach(@RequestParam("sId") String sId, StoreEachVO vo, Model model) {
		logger.info("스토어 프로필 페이지 정보 컨트롤러");
		model.addAttribute("storeInfoDetail", storeEachService.getStoreInfoDetail(sId));
		
		logger.info("스토어 공지사항 정보 컨트롤러");
		model.addAttribute("storeNotiList", storeEachService.getStoreNotiList(sId));
		
		logger.info("스토어 피드 컨트롤러");
		model.addAttribute("storeGoodsList", storeEachService.getStoreGoodsList(sId));
		
		return "storeEach/storeEachPage";
	}
	
	//공지사항 상세 정보 불러오기
	@RequestMapping(value="eachNoticeView", produces="application/json; charset=utf8")
	@ResponseBody
	public StoreEachVO eachNoticeView(StoreEachVO vo) {
		logger.info("스토어 공지사항 상세보기 컨트롤러");
		return storeEachService.eachNoticeView(vo);
	}
	
	//스토어 피드 상세 정보 불러오기
	@RequestMapping(value="eachStoreGoods", produces="application/json; charset=utf8")
	@ResponseBody
	public StoreEachVO eachStoreGoods(StoreEachVO vo) {
		logger.info("스토어 피드 상세보기 컨트롤러");
		return storeEachService.eachStoreGoods(vo);
	}
	
	//스토어 피드 서브이미지 불러오기
	@RequestMapping(value="eachStoreGoodsImg", produces="application/json; charset=utf8")
	@ResponseBody
	public List<StoreEachVO> eachStoreGoodsImg(StoreEachVO vo) {
		logger.info("스토어 피드 이미지 컨트롤러");
		return storeEachService.eachStoreGoodsImg(vo);
	}
	
	//주문 요청
	@RequestMapping("orderSend.do")
	public String orderSend(StoreEachVO vo, Model model) {
		logger.info("주문 요청 컨트롤러 "+vo.m_id+"/"+vo.s_id+"/"+vo.o_content);
		System.out.println(vo.getS_id()+"아이디를 찍어보아요");
		storeEachService.orderSend(vo);
		model.addAttribute("orderSendSuccess", "주문 요청이 완료되었습니다. 요청 사항을 확인하시겠습니까?");
		return "forward:viewStoreEach.do?sId="+vo.getS_id();
	}
	
}
