package com.suje.controller.main;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.suje.domain.main.MainFleaMarketVO;
import com.suje.service.main.MainFleaMarketService;

@Controller
public class MainFleaMarketController {

	private static final Logger logger = LoggerFactory.getLogger(MainFleaMarketController.class);
	
	@Autowired
	private MainFleaMarketService mainFleaMarkeService;
	
	int totalRowCount; // 전체 레코드 수
	int pageTotalCount; // 전체 페이지 수
	int countPerPage = 12; // 한페이지당 레코드 수
	int firstNum, endNum;
	
	// 플리마켓 메인(전체)
	@RequestMapping(value = "fleaMarketMain")
	public String fleaMarketMain(@RequestParam("page") int page, @RequestParam("mCate") String mCate, @RequestParam("mmCate") String mmCate, @RequestParam("orderBy") String orderBy, Model model) {
		
		MainFleaMarketVO vo = new MainFleaMarketVO();
		
		if( mCate.equals("전체") ) {
			logger.info("플리마켓 전체 행수 컨트롤러");
			// 전체 테이블 행 수
			totalRowCount = mainFleaMarkeService.getTotalAllCountPage();
		} else {
			logger.info("플리마켓 조건 포함 행수 컨트롤러");
			vo.setCatem_name(mCate);
			vo.setCatemm_name(mmCate);
			
			// 조건 포함 전체 테이블 행 수
			totalRowCount = mainFleaMarkeService.getLimitTotalCountPage(vo);
		}
		
		//전체 페이지 수
		pageTotalCount = totalRowCount / countPerPage;
		if(totalRowCount == 0) pageTotalCount = 0;
		if(totalRowCount%countPerPage > 0) pageTotalCount++;
		
		// 부분 페이지 수 계산
		firstNum = (page - 1) * countPerPage + 1;
		endNum = page * countPerPage;
		
		vo.setFirstNum(firstNum);
		vo.setEndNum(endNum);
		vo.setOrderBy(orderBy);
		
		model.addAttribute("mCate", mCate);
		model.addAttribute("mmCate", mmCate);
		model.addAttribute("orderBy", orderBy);
		model.addAttribute("pageTotalCount", pageTotalCount);
		
		logger.info("플리마켓 전체 상품 컨트롤러 "+mCate+"/"+mmCate);
		model.addAttribute("fleaList", mainFleaMarkeService.getFleaAllList(vo));
		
		return "main/fleaMarket/mainFleaMarket";
	}
	
	//플리마켓 상품 상세 페이지
	@RequestMapping("fleaMarketDetail.do")
	public String fleaMarketDetail(@RequestParam("fCode") String fCode, Model model) {
		logger.info("플리마켓 상품 상세 컨트롤러 "+fCode);
		
		model.addAttribute("fleaDetail", mainFleaMarkeService.getfleaDetail(fCode));
		model.addAttribute("fleaDetailSubImg", mainFleaMarkeService.getfleaDetailSubImg(fCode));
		return "main/fleaMarket/mainFleaMarketDetail";
	}
	
	//구매자 결제정보 불러오기
	@RequestMapping(value="payInfo.do", produces="application/json; charset=utf8")
	@ResponseBody
	public MainFleaMarketVO getPayInfo(MainFleaMarketVO vo) {
		logger.info("구매자 결제정보 컨트롤러 "+vo.getM_id());
		MainFleaMarketVO memberInfo = mainFleaMarkeService.getPayInfo(vo);
		return memberInfo;
	}
	
	//플리마켓 모달 구매자 정보 불러오기
	@RequestMapping(value="fleaBuyingMemberInfo.do", produces="application/json; charset=utf8")
	@ResponseBody
	public MainFleaMarketVO fleaBuyingMemberInfo(MainFleaMarketVO vo) {
		logger.info("플리마켓 모달 구매자 정보 컨트롤러 "+vo.getM_id());
		MainFleaMarketVO memberInfo = mainFleaMarkeService.getFleaBuyingMemberInfo(vo);
		return memberInfo;
	}
	
	//플리마켓 상품 구매
	@RequestMapping("fleaItemBuy.do")
	public String fleaItemBuy(MainFleaMarketVO vo, Model model) {
		logger.info("플리마켓 상품 구매 컨트롤러"+vo.getF_code());
		
		String finalPrice = vo.getFp_sum();
		vo.setFp_sum(finalPrice.replaceAll(",",""));
		
		int leftCount = Integer.parseInt(vo.getF_num())-Integer.parseInt(vo.getFp_count());
		vo.setF_num(String.valueOf(leftCount));
		
		if(leftCount==0) {
			vo.setF_ck("판매완료");
		} else {
			vo.setF_ck("판매중");
		}
		
		vo.setFp_code(mainFleaMarkeService.getFleaPaySeq());
		
		mainFleaMarkeService.fleaPayInsert(vo);
		mainFleaMarkeService.fleaDeliveryInsert(vo);
		mainFleaMarkeService.fleaUpdate(vo);
		
		model.addAttribute("buyComplete", "상품 구매가 완료되었습니다");
		return "forward:/viewFleaMarket.do";
	}
	
	
}
