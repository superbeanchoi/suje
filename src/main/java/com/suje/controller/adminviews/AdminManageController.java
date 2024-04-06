package com.suje.controller.adminviews;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.suje.domain.adminviews.AdminManageVO;
import com.suje.service.adminviews.AdminManageService;

@Controller
public class AdminManageController {

	private static final Logger logger = LoggerFactory.getLogger(AdminManageController.class);

	@Autowired
	private AdminManageService AdminManageService;

	private int totalRowCount; // 전체 레코드 수
	private int pageTotalCount; // 전체 페이지 수
	private int countPerPage = 5; // 한페이지당 레코드 수
	
	// 스토어 입점 관리(MAIN)
	@RequestMapping(value = "adminmanage")
	public String adminStore(@RequestParam("page") int page, Model model) {
		logger.info("스토어 입점관리 컨트롤러");

		// 전체 테이블 행 수
		totalRowCount = AdminManageService.getTotalCountPage();
		
		//전체 페이지 수
		pageTotalCount = totalRowCount / countPerPage;
		if(totalRowCount%countPerPage > 0) pageTotalCount++;

		// 부분 페이지 수 계산
		int firstNum = (page - 1) * countPerPage + 1;
		int endNum = page * countPerPage;

		AdminManageVO vo = new AdminManageVO();
		vo.setFirstNum(firstNum);
		vo.setEndNum(endNum);
		
		model.addAttribute("pageTotalCount", pageTotalCount);
		model.addAttribute("storeList", AdminManageService.getStoreList(vo));

		return "adminviews/adminmanage";
	}
	
	//스토어 정보 모달
	@RequestMapping(value="storeAvailInfo.do", produces="application/json; charset=utf8")
	@ResponseBody
	public AdminManageVO storeAvailInfo(AdminManageVO vo, Model model) {
		logger.info("스토어 개별 정보 모달 컨트롤러"+vo.getS_id()+vo.getMa_id());
		AdminManageVO storeInfo = AdminManageService.getStoreInfo(vo);
		storeInfo.setMa_id(vo.getMa_id());
		return storeInfo;
	}
	
	//스토어 입점 여부 Insert
	@RequestMapping("storeAvailInsert.do")
	public String storeAvailInsert(AdminManageVO vo, Model model) {
		logger.info("스토어 입점 여부 Insert 컨트롤러"+vo.getS_id()+vo.getSa_content()+vo.getSa_ck()+vo.getMa_id());
		AdminManageService.storeAvailInsert(vo);
		model.addAttribute("storeAvail", "스토어의 입점 여부가 업데이트 되었습니다.");
		return "forward:/adminmanage.do?page=1";
	}
}
