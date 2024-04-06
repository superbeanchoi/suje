package com.suje.controller.main;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.suje.controller.headerHtml.HeaderController;
import com.suje.domain.adminviews.AdminManageVO;
import com.suje.domain.main.MainLoginVO;
import com.suje.service.adminviews.AdminManageService;
import com.suje.service.main.MainLoginService;

@Controller
public class MainLoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(HeaderController.class);
	
	@Autowired
	private MainLoginService mainloginService;
	
	@Autowired
	private AdminManageService AdminManageService;
	
	//멤버 로그인
	@RequestMapping("mainMemberLogin.do")
	public String mainMemberLogin(MainLoginVO vo, HttpSession session, Model model) {
		System.out.println("멤버 로그인 컨트롤러 작동 >> "+vo.getM_id()+" / "+vo.getM_pass());
		MainLoginVO login = mainloginService.getMemberLogin(vo);
		if(login==null) {
			model.addAttribute("errorMessage", "아이디 혹은 비밀번호가 틀렸습니다.");
			return "main/mainLogin";
		}else {   
			session.setAttribute("mainId", login.getM_id());   
			return "redirect: index.jsp";
		}
	}
	//스토어 로그인
	@RequestMapping("mainStoreLogin.do")
	public String mainStoreLogin(MainLoginVO vo, HttpSession session, Model model) {
		System.out.println("스토어 로그인 컨트롤러 작동 >> "+vo.getS_id()+" / "+vo.getS_pass());
		MainLoginVO login = mainloginService.getStoreLogin(vo);
		if(login==null) {
			model.addAttribute("errorMessage", "아이디 혹은 비밀번호가 틀렸습니다.");
			return "main/mainLogin";
		} else if(login.getSa_ck().equals("대기") || login.getSa_ck().equals("보류") || login.getSa_ck().equals("반려")) {
			model.addAttribute("storeAvail", login.getSa_ck());
			return "main";
		}
		else {  
			session.setAttribute("accountProfileImg", login.getS_spname());   
			session.setAttribute("mainId", login.getS_id());   
			/* return "storeAdmin/storeProfile"; */
			return "forward:/storeProfile.do?id=" + vo.getS_id();
		}
	}
	//관리자 로그인
	@RequestMapping("mainAdminLogin.do")
	public String mainAdminLogin(MainLoginVO vo, HttpSession session, Model model) {
		System.out.println("어드민 로그인 컨트롤러 작동 >> "+vo.getMa_id()+" / "+vo.getMa_pass());
		MainLoginVO login = mainloginService.getAdminLogin(vo);
		if(login==null) {
			model.addAttribute("errorMessage", "아이디 혹은 비밀번호가 틀렸습니다.");
			return "main/mainLogin";
		}else {   
			session.setAttribute("mainId", login.getMa_id()); 
			return "forward:/adminmanage.do?page=1";
		}
	}
	
	//멤버 회원가입
	@RequestMapping("newMember.do")
	public String newMember(MainLoginVO vo, Model model) {
		System.out.println("멤버 회원가입 컨트롤러 작동 >> "+vo.getM_id());
		mainloginService.getMemberSignup(vo);
		model.addAttribute("newMemberComple", "회원가입을 성공적으로 완료하였습니다.");
		return "main/mainLogin";
	}
	//멤버 아이디 중복 체크
	@RequestMapping(value="memberIdcheck.do", produces="application/text; charset=utf8")
	@ResponseBody
	public String memberIdcheck(MainLoginVO vo) {
		System.out.println("멤버 아이디 중복체크 컨트롤러 작동 >> "+vo.getM_id());
		MainLoginVO id = mainloginService.getMemberIdCheck(vo);
		String result;
		if(id!=null) {
			result="사용중인 아이디입니다.";
		} else {
			result="사용 가능한 아이디입니다.";
		}
		return result;
	}
	//스토어 회원가입
	@RequestMapping("newStore.do")
	public String newStore(MainLoginVO vo, Model model) {
		System.out.println("스토어 회원가입 컨트롤러 작동 >> "+vo.getS_id()+" / "+vo.getS_pass()+" / "+vo.getS_email()+" / "+vo.getS_tel()+" / "+vo.getS_name()+" / "+vo.getCatem_code()+" / "+vo.getS_addr()+" / "+vo.getS_bnum()+" / "+vo.getS_bank()+" / "+vo.getS_acc());
		mainloginService.getStoreSignup(vo);
		model.addAttribute("newStoreComple", "스토어 입점 신청이 완료되었으며 입점 승인 완료 후 서비스 이용 가능합니다.");
		return "main";
	}
	//스토어 아이디 중복 체크
	@RequestMapping(value="storeIdcheck.do", produces="application/text; charset=utf8")
	@ResponseBody
	public String storeIdcheck(MainLoginVO vo) {
		System.out.println("스토어 아이디 중복체크 컨트롤러 작동 >> "+vo.getS_id());
		MainLoginVO id = mainloginService.getStoreIdCheck(vo);
		String result;
		if(id!=null) {
			result="사용중인 아이디입니다.";
		} else {
			result="사용 가능한 아이디입니다.";
		}
		return result;
	}
	
	//로그아웃
    @RequestMapping("mainLogout.do")
    public String logout(HttpSession session) {
       session.removeAttribute("mainId");
       return "redirect: index.jsp";
    }
	
}
