package com.suje.controller.adminviews;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.suje.domain.adminviews.AdminManageVO;
import com.suje.domain.adminviews.AdminPntVO;
import com.suje.service.adminviews.AdminPntService;

@Controller
public class AdminPntController {

	private static final Logger logger = LoggerFactory.getLogger(AdminPntController.class);
	
	@Autowired
	private AdminPntService adminPntService;
	
	private int totalRowCount; // 전체 레코드 수
	private int pageTotalCount; // 전체 페이지 수
	private int countPerPage = 5; // 한페이지당 레코드 수
	
	// 스토어 벌점 정보
	@RequestMapping(value = "adminpnt")
	public String adminPnt(@RequestParam("page") int page, Model model) {
		logger.info("스토어 벌점정보 컨트롤러");

		// 전체 테이블 행 수
		logger.info("스토어 벌점정보 전체 행 수 추출 컨트롤러");
		totalRowCount = adminPntService.getTotalCountPage();
		
		//전체 페이지 수
		pageTotalCount = totalRowCount / countPerPage;
		if(totalRowCount%countPerPage > 0) pageTotalCount++;

		// 부분 페이지 수 계산
		int firstNum = (page - 1) * countPerPage + 1;
		int endNum = page * countPerPage;

		AdminPntVO vo = new AdminPntVO();
		vo.setFirstNum(firstNum);
		vo.setEndNum(endNum);
		
		model.addAttribute("pageTotalCount", pageTotalCount);
		model.addAttribute("pntList", adminPntService.getAdminPnt(vo));
		return "adminviews/adminpnt";
	}
	
	//스토어 이름으로 아이디 검색
	@RequestMapping(value="storeIdSearch.do", produces="application/json; charset=utf8")
	@ResponseBody
	public List<AdminPntVO> storeIdSearch(AdminPntVO vo, Model model) {
		logger.info("스토어 아이디 검색 컨트롤러"+vo.getS_name());
		List<AdminPntVO> storeInfo = adminPntService.getStoreIdSearch(vo);
		return storeInfo;
	}
	
	//스토어 벌점 등록
	@RequestMapping("pntInsert.do")
	public String pntInsert(@RequestParam("adminId") String adminId, AdminPntVO vo, Model model) {
		vo.setMa_id(adminId);
		logger.info("스토어 벌점 등록 컨트롤러"+"/"+vo.ma_id+"/"+vo.s_id+"/"+vo.de_score+"/"+vo.de_why);
		adminPntService.pntInsert(vo);
		model.addAttribute("degradeInfo", "해당 스토어에 대한 벌점이 갱신 되었습니다.");
		return "forward:/adminpnt.do?page=1";
	}
}
