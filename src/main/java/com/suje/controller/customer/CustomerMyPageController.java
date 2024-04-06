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

import com.suje.domain.customer.MemberVO;
import com.suje.service.customer.CustomerInfoService;

@Controller
public class CustomerMyPageController {

	private static final Logger logger = LoggerFactory.getLogger(CustomerMyPageController.class);

	@Autowired
	private CustomerInfoService service;

	@RequestMapping(value = "customerMyPage")
	public String getCustomerInfo(@RequestParam String id, Model model) {

		MemberVO vo = service.getCustomerInfo(id);
		System.out.println("=> CustomerMyPageController  => getCustomerInfo 실행");
		model.addAttribute("vo", vo);
		return "/customer/customerMyPage";
	}

	// 회원 정보 수정 처리.
	@RequestMapping(value = "mypageModify", method = RequestMethod.POST)
	public String updateMypageInfo(@ModelAttribute MemberVO vo, Model model) {
		System.out.println("updateMypage 컨트롤 실행");

		int infoVO = service.updateMypageInfo(vo);
		model.addAttribute("infoVO", infoVO);
		System.out.println(infoVO);
		model.addAttribute("complete", "계정 정보가 수정되었습니다.");
		System.out.println(vo.getM_id());
		return "forward:/customerMyPage.do?id=" + vo.getM_id();

	}
}
