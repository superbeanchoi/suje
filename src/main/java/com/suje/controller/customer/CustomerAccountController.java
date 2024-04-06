package com.suje.controller.customer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.suje.domain.customer.AccountVO;
import com.suje.domain.customer.CardVO;
import com.suje.service.customer.CustomerAccountService;

@Controller
public class CustomerAccountController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerAccountController.class);

	@Autowired
	private CustomerAccountService service;
	
	@RequestMapping(value = "customerAccount")
	public String selectAccount(@RequestParam String id, Model model)  {
		logger.info("getAccount Controller 실행");
		AccountVO vo = service.getAccount(id);
		model.addAttribute("vo", vo);
		model.addAttribute("id", id);
		return "/customer/customerAccount";
	}
	
	@RequestMapping(value = "updateCAccount", method = RequestMethod.POST)
	public String updateCAccount(@ModelAttribute AccountVO updateCAccount, Model model) {
		logger.info("updateCAccount Controller 실행");
		
		  if (updateCAccount.getM_acc_code() == 0) {
			  service.insertAccount(updateCAccount);
		  }else {
			  service.updateCAccount(updateCAccount);
		  }
		logger.info(updateCAccount.getM_id());
		model.addAttribute("complete", "계좌 정보가 수정되었습니다.");
		return "forward:/customerAccount.do?id=" + updateCAccount.getM_id();	  
	}
	
	@RequestMapping(value = "insertAccount", method=RequestMethod.POST) 
	  public String insertAccount(@ModelAttribute AccountVO insertAccount, Model model) {
		  logger.info("insertAccount Controller 실행");
		  logger.info(insertAccount.getM_id());
		  service.insertAccount(insertAccount);
		  model.addAttribute("complete", "계좌 정보가 등록되었습니다.");
		  return "forward:/customerAccount.do?id=" + insertAccount.getM_id();		  
	  }
	
}
