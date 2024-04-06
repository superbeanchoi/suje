package com.suje.controller.customer;

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

import com.suje.domain.customer.CardVO;
import com.suje.service.customer.CustomerCardService;

@Controller
public class CustomerCardController {

	private static final Logger logger = LoggerFactory.getLogger(CustomerCardController.class);
	
	@Autowired
	private CustomerCardService service;
	
	// 회원 카드정보 가져오기
	@RequestMapping(value = "customerCard")
	public String selectCard(@RequestParam String id, Model model) {
		logger.info("getCard Controller 실행");
		CardVO vo = service.getCard(id);
		model.addAttribute("vo", vo);
		model.addAttribute("id", id);
		return "/customer/customerCard";
	}
		
	// 회원 카드정보 수정하기.
	@RequestMapping(value = "updateCard", method = RequestMethod.POST)
	public String updateCard(@ModelAttribute CardVO updateCard, Model model) {
		logger.info("updateCard Controller 실행");
		
		  if (updateCard.getCard_code() == 0) {
			  service.insertCard(updateCard);
		  }else {
			  service.updateCard(updateCard);
		  }
		logger.info(updateCard.getM_id());
		model.addAttribute("complete", "카드 정보가 수정되었습니다.");
		return "forward:/customerCard.do?id=" + updateCard.getM_id();	  
	  }
	  
	  // 회원 카드 정보 등록하기	  
	  @RequestMapping(value = "insertCard", method=RequestMethod.POST) 
	  public String insertCard(@ModelAttribute CardVO insertCard, Model model) {
		  logger.info("insertCard Controller 실행");
		  logger.info(insertCard.getM_id());
		  service.insertCard(insertCard);
		  model.addAttribute("complete", "카드 정보가 등록되었습니다.");
		  return "forward:/customerCard.do?id=" + insertCard.getM_id();		  
	  }

	
}
