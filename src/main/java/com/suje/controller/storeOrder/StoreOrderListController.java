package com.suje.controller.storeOrder;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.suje.domain.category.CategoryVO;
import com.suje.domain.customer.EtcVO;
import com.suje.domain.customer.FinalOrderVO;
import com.suje.domain.storeOrder.StoreOrderListVO;
import com.suje.service.category.CategoryMainService;
import com.suje.service.storeOrder.StoreOrderListService;


@Controller
public class StoreOrderListController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreOrderListController.class);
	
	@Autowired
	private StoreOrderListService storeService;
	
	@Autowired
	private CategoryMainService cateService;
	
	private final int  pageCountNum = 5; // 각 페이지별 출력되는 목록의 수
	
	// Store SUJE 톡톡 페이지 연결(초기 페이징)
	@RequestMapping(value = "storeSujeTalk")
	public String getStoreOrderList(
			@RequestParam("id") String storeID,
			@RequestParam("page") int page,
			Model model,
			StoreOrderListVO vo) {
		
		logger.info("getStoreOrderList");
		System.out.println(storeID);
		// 전체 페이지 수 계산
		int totalCountPage = storeService.getStoreOrderListCount(storeID);		
		
		if((totalCountPage/pageCountNum) < 0) {
			totalCountPage = 1;
		}else {
			totalCountPage = totalCountPage/pageCountNum;
		}
		
		// 부분 페이지 수 계산
		int firstNum = (page-1) * pageCountNum + 1 ;
		int endNum = page * pageCountNum;
		
		vo.setS_id(storeID);
		vo.setFirstNum(firstNum);
		vo.setEndNum(endNum);
		
		List<StoreOrderListVO> storeOrderList = storeService.getStoreOrderList(vo);
		
		model.addAttribute("totalCountPage",totalCountPage);
		model.addAttribute("storeOrderList",storeOrderList);
		model.addAttribute("id",storeID);
		
		return "/storeOrder/storeSujeTalk";
	}
	
	
	//SUJE 톡톡 기타 요청 내역 - 비동기
	@RequestMapping(value = "storeSujeTalkEtc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getStoreOrderEtc(@RequestParam Map<String,String> storeOrderNO) {
		
		logger.info("정상작동확인 = getStoreOrderEtc = {}",storeOrderNO.get("storeOrderNO") );
		return getOrderEtcList(Integer.parseInt(storeOrderNO.get("storeOrderNO")),0);
		
	}
	
	
	// SUJE 톡톡 기타 요청 내역 답변 입력 - 비동기
	@RequestMapping(value="insertStoreEtc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertStoreEtc(@ModelAttribute EtcVO etcVO) {
		
		logger.info("정상작동확인 = insertStoreEtc" );
		int state = storeService.insertStoreEtc(etcVO);
		Map<String, Object> resultMap = getOrderEtcList(etcVO.getO_code(),state);
		
		return resultMap;
	}
	
	

	
	// 최종 주문서 등록하기
	@RequestMapping(value="fianlOrderController", method = RequestMethod.POST)
	public String insertStoreFinalOrder(@ModelAttribute("vo") FinalOrderVO vo, Model model) {
		
		logger.info(" = {}",vo.getO_code());
		logger.info("insertStoreFinalOrder => 연결 성공");
		storeService.insertFinalOrderInfo(vo);
				return"redirect: storeSujeTalk.do?id="+ vo.getStoreID() +"&page=1";
	}
	
	
	// 최종 주문서 정보 불러오기
	@RequestMapping(value="getStoreFinalOrder", method = RequestMethod.POST)
	@ResponseBody
	public FinalOrderVO getStoreFinalOrder(@RequestParam Map<String,String> orderNo) {
		
		logger.info("getStoreFinalOrder => 연결 성공 = {}",orderNo.get("orderNO"));
		FinalOrderVO orderVO = storeService.getStoreFinalOrder(Integer.parseInt(orderNo.get("orderNO")));
		
		return orderVO;
	}
	
	
	//최종 주문서 정보 수정하기
	@RequestMapping(value="updateFinalOrderinfo", method = RequestMethod.POST)
	public String updateFinalOrderinfo(@ModelAttribute("vo") FinalOrderVO vo, Model model) {
		
		logger.info("updateFinalOrderinfo 실행");
		logger.info("updateFinalOrderinfo 실행 = {}",vo.getCates_code());
		int updateState = storeService.updateFinalOrderinfo(vo);
		
		model.addAttribute("updateState",updateState);
		return"forward:storeSujeTalk.do?id="+ vo.getStoreID() +"&page=1";
	}
	
	// 스토어 카테고리 대분류 가져오기
	@RequestMapping(value = "getCateMainName", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getCateMainName(@RequestParam Map<String,String> sId){
		
		logger.info("getCateMainName 실행");
		// 대분류 이름, 코드 가져오기
		CategoryVO cateMainVO = storeService.getCateMainName(sId.get("storeId"));
		List<CategoryVO> cateMidList = cateService.getCateMid(cateMainVO.getCatem_code());
		
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("cateMainVO", cateMainVO);
		resultMap.put("cateMidList", cateMidList);
		
		return resultMap;
	}
	// ================================================= Controller 내부 사용 메소드 ==============
	// 주문 요청사항 , 최종 주문서 정보 불러오는 메소드
	private Map<String, Object> getOrderEtcList(int storeOrderNO,int state) {

		// Map 형식으로 JSP에 값 전달을 위해 Map 객체화
		Map<String, Object> resultMap = new HashMap<String, Object>();

		// 주문 상세(기타) 요청 사항 리스트
		List<EtcVO> storeOrderDetailList = storeService.getStoreOrderEtc(storeOrderNO);

		// 주문 상세(기타)요청 사항이 없을 경우 최초 접수된 요청 내용을 출력 하기 위한 명령어
		for (EtcVO vo : storeOrderDetailList) {
			if (vo.getEtc_content() == null) {
				vo.setContent(vo.getO_content());
			} else {
				vo.setContent(vo.getEtc_content());
			}
		}

		// 최종 주문서 불러오기
		FinalOrderVO finalVO = storeService.getStoreFinalOrder(storeOrderNO);

		resultMap.put("etcList", storeOrderDetailList);
		resultMap.put("finalOrder", finalVO);
		resultMap.put("state", state);
		
		return resultMap;
	}
	
}
