package com.suje.controller.customer;

import java.util.List;

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

import com.suje.domain.customer.QnAVO;
import com.suje.service.customer.CustomerQnAService;

@Controller
public class CustomerQnAController {

	private static final Logger logger = LoggerFactory.getLogger(CustomerQnAController.class);

	@Autowired
	private CustomerQnAService service;	
	private final int pageCountNum = 5; // 각 페이지별 출력되는 목록의 수

	// Q&A 작성하기 (insert = 신규 글 저장 처리 요청)
	@RequestMapping(value = "insertQnA", method = RequestMethod.POST)
	public String insertQnA(@ModelAttribute("vo") QnAVO vo, Model model) {
		
		System.out.println(vo.getQna_title());
		System.out.println(vo.getQna_content());

		service.insertQnA(vo);
		model.addAttribute("vo", vo);

		System.out.println("insertQnA 컨트롤러 실행");

		return "redirect:getQnAList.do?id=" + vo.getM_id() + "&page=1";
	}

	// Q&A 답변 불러오기
	@RequestMapping(value = "customerQnAAModal")
	@ResponseBody
	public QnAVO getCustomerQnAA(@RequestParam("resultAnserNo") int id, Model model) {
		logger.info("getCustomerQnAA");
		QnAVO vo = service.getCustomerQnAA(id);
		return vo;
	}

	
	// Q&A 페이지 연결(초기 페이징)
	@RequestMapping(value= "getQnAList")
	public String customerQnA(
			@RequestParam("id") String id,
			@RequestParam("page") int page,
			Model model,
			QnAVO vo) {
		logger.info("getQnAList");
	
	  // Q&A 전체 페이지 수 계산
	int totalCountPage = service.getCountPageTotal(id);
	
	if((totalCountPage/pageCountNum)<0) {
		totalCountPage = 1;
	}else {
		totalCountPage = totalCountPage/pageCountNum;
	}
		
	// 부분 페이지 수 계산
	int firstNum = (page-1) * pageCountNum + 1;
	int endNum = page * pageCountNum;
	
	vo.setM_id(id);
	vo.setFirstNum(firstNum);
	vo.setEndNum(endNum);
	List<QnAVO> qnaList = service.getQnAList(vo);
	
	model.addAttribute("totalCountPage", totalCountPage);
	model.addAttribute("qnaListTotal", qnaList);
	model.addAttribute("id", id);
	
	return "/customer/customerQnA";

	}


}
