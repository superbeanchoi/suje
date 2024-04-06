package com.suje.controller.adminviews;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.suje.domain.adminviews.AdminQnAVO;
import com.suje.service.adminviews.AdminQnAService;

@Controller
public class AdminQnAController {
    private static final Logger logger = LoggerFactory.getLogger(AdminQnAController.class);
    
    @Autowired 
    private AdminQnAService adminQnAService;
    
    private int totalRowCount; // 전체 레코드 수
    private int pageTotalCount; // 전체 페이지 수
    private int countPerPage = 5; // 한페이지당 레코드 수
    
    // QnA 불러오기 (MAIN)
    @RequestMapping(value = "adminQnA")
    public String adminqna(@RequestParam("page") int page, Model model ) {
        logger.info("스토어 QnA 컨트롤러");
        
        // 전체 테이블 행 수 
        totalRowCount = adminQnAService.getTotalCountPage();
        
        //전체 페이지 수 
        pageTotalCount = totalRowCount / countPerPage;
        if (totalRowCount % countPerPage > 0) pageTotalCount++;
        
        // 부분 페이지 수 계산
        int firstNum = (page - 1) * countPerPage + 1;
        int endNum = page * countPerPage;
        
        AdminQnAVO vo = new AdminQnAVO();
        vo.setFirstNum(firstNum);
        vo.setEndNum(endNum);
        
        model.addAttribute("pageTotalCount", pageTotalCount);
        model.addAttribute("QnAList", adminQnAService.getQnAList(vo));
        
        return "adminviews/adminQnA";
    }
    
 // QnA 관리 (MAIN)
    @RequestMapping(value = "getQnAinfo", method = RequestMethod.GET)
    public String getQnAInfo(@RequestParam("qna_code") String qna_code, Model model) {
        logger.info("Q&A 상세 정보 가져오기 컨트롤러");

        // Q&A 상세 정보를 가져오는 서비스 메서드 호출
        AdminQnAVO qnaInfo = adminQnAService.getQnAInfo(qna_code);
        
        // 가져온 상세 정보를 모델에 추가
        model.addAttribute("qnaInfo", qnaInfo);
        
        // adminQnA 메소드 호출
        return adminqna(1, model);
    }
    
    @RequestMapping(value = "updateadmininfo", method = RequestMethod.POST)
    public String updateAdminInfo(@ModelAttribute("vo") AdminQnAVO qnaInfo, Model model) {
        logger.info("Q&A 정보 업데이트 컨트롤러");

        // Q&A 정보를 업데이트하는 서비스 메소드 호출
        adminQnAService.updateAdminInfo(qnaInfo);
        
        // 업데이트 후 메시지 추가
        model.addAttribute("message", "Q&A 정보가 업데이트되었습니다.");
        
        // 리다이렉트하여 adminQnA 페이지로 이동
        return "redirect:/adminQnA.do?page=1";
    }

    
}