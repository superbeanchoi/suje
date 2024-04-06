package com.suje.controller.adminviews;

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

import com.suje.domain.adminviews.AdmininfoVO;
import com.suje.service.adminviews.Admininfoservice;

@Controller
public class Admininfocontroller {
    private static final Logger logger = LoggerFactory.getLogger(Admininfocontroller.class);

    @Autowired
    private Admininfoservice info;

    @RequestMapping(value = "/admininfo.do")
    public String getAdminInfo(@RequestParam String id, Model model) {
        logger.info("관리자 정보 가져오기 컨트롤러 실행");

        AdmininfoVO vo = info.getAdminInfo(id);

        model.addAttribute("adminInfo", vo); 

        logger.info("관리자 정보: {}", vo);

        return "adminviews/admininfo";
    }

    @RequestMapping(value = "/updateAdmin.do", method = RequestMethod.POST)
    public String updateAdminInfo(@ModelAttribute AdmininfoVO vo, HttpSession session, Model model) {
        logger.info("관리자 정보 업데이트 컨트롤러 실행");

        info.updateAdminExceptId(vo);

        // 세션에서 현재 로그인한 관리자의 아이디 가져오기
        String adminId = (String) session.getAttribute("mainId");

        // 업데이트된 관리자 정보를 다시 가져와 모델에 추가
        AdmininfoVO updatedInfo = info.getAdminInfo(adminId);
        model.addAttribute("adminInfo", updatedInfo); 
        model.addAttribute("mainId", adminId); 

        model.addAttribute("message", "관리자 정보가 성공적으로 수정되었습니다.");

        logger.info("업데이트된 관리자 정보: {}", updatedInfo);

        // 관리자 정보 페이지로 리다이렉트
        return "redirect:/admininfo.do?id=" + adminId;
    }
}
