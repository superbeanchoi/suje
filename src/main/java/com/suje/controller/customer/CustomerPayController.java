package com.suje.controller.customer;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.Printer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.suje.domain.customer.PayVO;
import com.suje.service.customer.CustomerPayService;

@Controller
public class CustomerPayController {

	private static final Logger logger = LoggerFactory.getLogger(CustomerPayController.class);

	@Autowired
	private CustomerPayService service;	
	private final int pageCountNum = 5; // 각 페이지별 출력되는 목록의 수

	// 1. 주문제작 결제내역 페이지 연결(초기 페이징)
	@RequestMapping(value= "getPayList")
	public String payList(
			@RequestParam("id") String id, 
			@RequestParam("orderPage") int orderPage,
			@RequestParam("fleaPage") int fleaPage,
			@RequestParam("cancelPage") int cancelPage,
			@RequestParam("returnPage") int returnPage, 
			Model model, 
			PayVO vo) {

		logger.info("getPayList");
		
		// 각 항목 전체 페이지 수
		Map<String,Integer> countResultMap = service.getCountPageTotal(id);
		
		countResultMap.put("orderPurchCount",totalCountPage(Integer.parseInt(String.valueOf(countResultMap.get("orderPurchCount")))));
		countResultMap.put("cancelCount",totalCountPage(Integer.parseInt(String.valueOf(countResultMap.get("cancelCount")))));
		countResultMap.put("returnCount",totalCountPage(Integer.parseInt(String.valueOf(countResultMap.get("returnCount")))));
		countResultMap.put("fleaPurchCount",totalCountPage(Integer.parseInt(String.valueOf(countResultMap.get("fleaPurchCount")))));
		System.out.println(countResultMap);
		
		// 2. 주문제작 부분 페이지 수 계산
		int orderFirstNum = (orderPage - 1) * pageCountNum + 1;
		int orderEndNum = orderPage * pageCountNum;	

		// 2. 플리마켓 부분 페이지 수 계산
		int fleaFirstNum = (fleaPage - 1) * pageCountNum + 1;
		int fleaEndNum = fleaPage * pageCountNum;
		
		// 3. 취소내역 부분 페이지 수 계산
		int cancelFirstNum = (cancelPage - 1) * pageCountNum + 1;
		int cancelEndNum = cancelPage * pageCountNum;
		
		// 4. 반품내역 부분 페이지 수 계산
		int returnFirstNum = (returnPage - 1) * pageCountNum + 1;
		int returnEndNum = returnPage * pageCountNum;
		
		// 맵 형식으로 Service , Repository, Mapper 값 전달
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("id", id);
		
		resultMap.put("orderFirstNum", orderFirstNum);
		resultMap.put("orderEndNum", orderEndNum);
		
		resultMap.put("fleaFirstNum", fleaFirstNum);
		resultMap.put("fleaEndNum", fleaEndNum);
		
		resultMap.put("cancelFirstNum", cancelFirstNum);
		resultMap.put("cancelEndNum", cancelEndNum);
		
		resultMap.put("returnFirstNum", returnFirstNum);
		resultMap.put("returnEndNum", returnEndNum);
		
		// 맵형식으로 JSP 페이지 값 전달 처리
		Map<String,Object> ResultList = service.getPayList(resultMap);
		
		model.addAttribute("id", id);
		model.addAttribute("ResultList", ResultList);
		model.addAttribute("countResultMap", countResultMap);
		
		return "/customer/customerOrderList";
	}
	
	// 전체 페이지의 수를 반환하는 메소드
	public int totalCountPage(int totalCountPage) {
		if((totalCountPage/pageCountNum)<0) {
			totalCountPage = 1;
		}else {
			totalCountPage = totalCountPage/pageCountNum;
		}
		return totalCountPage;
	}
	
	
	// 구매확정 처리
	@RequestMapping(value = "purchConfirm")
	public String purchConfirm(
			@RequestParam("id") String id,
			@RequestParam("payNO") int payNo
			) {
		
		logger.info("////////// purchConfirm - 아이디값 체크 = {}",id);
		logger.info("////////// purchConfirm - 결제번호 체크 = {}",payNo);
		
		int state = service.insertPurchConfirm(id, payNo);
		 
		logger.info("////////// purchConfirm - 결과 값 체크 = {}",state);
		
		return "redirect:getPayList.do?id=" + id + "&orderPage=1&fleaPage=1&cancelPage=1&returnPage=1";
	}
	
	
	
	// 플리마켓 결제내역 결제취소 요청하기 (insert = 신규 글 저장 처리 요청)
	@RequestMapping(value = "insertFleaPayCancel", method = RequestMethod.POST)
	public String insertFleaPayCancel(@ModelAttribute("vo") PayVO vo, Model model) {
		
		logger.info("insertFleaPayCancel 실행 = {}",vo.getM_id());
		
		service.insertFleaPayCancel(vo);
		model.addAttribute("vo", vo);
		
		System.out.println("insertFleaPayCancel 컨트롤러 실행");
	
		return "redirect:getPayList.do?id=" + vo.getM_id() + "&orderPage=1&fleaPage=1&cancelPage=1&returnPage=1";
	}

	// 주문제작 결제내역 반품 요청하기 (insert = 신규 글 저장 처리 요청)
	@RequestMapping(value = "insertOrderPayReturn", method = RequestMethod.POST)
	public String insertOrderPayReturn(@ModelAttribute("vo") PayVO vo, Model model) {
		logger.info("insertOrderPayReturn 실행 = {}",vo.getM_id());
		logger.info("insertOrderPayReturn 실행 = {}",vo.getP_code());
		logger.info("insertOrderPayReturn 실행 = {}",vo.getRt_code());
		logger.info("insertOrderPayReturn 실행 = {}",vo.getRt_date());
		logger.info("insertOrderPayReturn 실행 = {}",vo.getRt_why());
		
		service.insertOrderPayReturn(vo);
		model.addAttribute("vo", vo);
		
		logger.info("insertOrderPayReturn 컨트롤러 실행");
		
		return "redirect:getPayList.do?id=" + vo.getM_id() + "&orderPage=1&fleaPage=1&cancelPage=1&returnPage=1";
	}
	
	// 주문제작 결제내역 결제취소 요청하기 (insert = 신규 글 저장 처리 요청)
	@RequestMapping(value = "insertOrderPayCancel", method = RequestMethod.POST)
	public String insertOrderPayCancel(@ModelAttribute("vo") PayVO vo, Model model, HttpSession session) {
		
		logger.info("insertOrderPayCancel 컨트롤러 실행");
		logger.info("insertOrderPayCancel 실행 = {}",vo.getM_id());
		
		int state = service.insertOrderPayCancel(vo);
		
		model.addAttribute("state",state);
		
		return "redirect:getPayList.do?id=" + vo.getM_id() + "&orderPage=1&fleaPage=1&cancelPage=1&returnPage=1";

	}
	
	
}
