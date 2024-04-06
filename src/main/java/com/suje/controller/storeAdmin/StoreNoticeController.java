package com.suje.controller.storeAdmin;

import java.util.List;

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

import com.suje.domain.storeAdmin.StoreNoticeVO;
import com.suje.service.storeAdmin.StoreNoticeService;

@Controller
public class StoreNoticeController {

	private static final Logger logger = LoggerFactory.getLogger(StoreNoticeController.class);

	@Autowired
	StoreNoticeService noticeService;



	@RequestMapping(value = "storeNoticeListAll")
	public String storeNoticeListAll(@RequestParam("id") String id, StoreNoticeVO vo, Model model) {

		System.out.println("storeNoticeListAll 실행");
		
		vo.setS_id(id);
		List<StoreNoticeVO> list = noticeService.storeNoticeListAll(vo);
		model.addAttribute("StoreNoticeList", list);

		return "/storeAdmin/storeNotice";

	}

	@RequestMapping(value = "getNotiInfo")
	public String getNotiInfo(@RequestParam("notiNum") int notiNum, @RequestParam("id") String id, StoreNoticeVO vo, Model model) {

		System.out.println("getNotiInfo 실행");
		
		
		vo.setNoti_code(notiNum);
		vo.setS_id(id);
		StoreNoticeVO getListVO = noticeService.getNotiInfo(vo);
		model.addAttribute("getListVO", getListVO);
	
		List<StoreNoticeVO> list = noticeService.storeNoticeListAll(vo);
		model.addAttribute("StoreNoticeList", list);
		
		return "/storeAdmin/storeNotice";

	}

	@RequestMapping(value = "modifyNotiInfo" )
	public String modifyNotiInfo( StoreNoticeVO vo, Model model) {
		
		System.out.println("modifyNotiInfo 실행");
		
		int result = noticeService.modifyNotiInfo(vo);
		model.addAttribute("result", result);
		
		List<StoreNoticeVO> list = noticeService.storeNoticeListAll(vo);
		model.addAttribute("StoreNoticeList", list);
		model.addAttribute("notiComplete", "스토어 공지가 수정되었습니다.");
		return "/storeAdmin/storeNotice";
		
	}
	
	
	@RequestMapping(value = "deleteNotiInfo", method = RequestMethod.POST)
    public String deleteNotiInfo(@RequestParam("notiNum") int notiNum, StoreNoticeVO vo, Model model) {
      
		logger.info("getNoti_code : "+ vo.getNoti_code());
		logger.info("getNoti_content : "+ vo.getNoti_content());
		logger.info("getNotim_date : "+ vo.getNotim_date());
		logger.info("getNotir_date : "+ vo.getNotir_date());
		logger.info("getNotit_code : "+ vo.getNotit_code());
		logger.info("getS_id : "+ vo.getS_id());
		
		int result = noticeService.deleteNotiInfo(notiNum);
        model.addAttribute("result", result);
        
		
		  List<StoreNoticeVO> list = noticeService.storeNoticeListAll(vo);
		  model.addAttribute("StoreNoticeList", list);
		  model.addAttribute("notiComplete", "스토어 공지가 삭제되었습니다.");
		
        return "/storeAdmin/storeNotice"; 
    }
	
	
	
	

}
