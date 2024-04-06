package com.suje.controller.customer;

import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.suje.domain.customer.FileUploadTestVO;
import com.suje.service.customer.FileUploadTestService;

@Controller
public class FileUploadTestController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerAccountController.class);
	
	@Autowired
	FileUploadTestService service;
	
	
	@RequestMapping(value = "flieUpload")
	public String fileUpload(Model model) {
		
		FileUploadTestVO vo = service.getFileName(10);
		
		model.addAttribute("vo",vo);
		System.out.println();
		return "/customer/fileUploadTest";
	}
	
	@RequestMapping(value = "getFileValue", method = RequestMethod.POST)
	public String getFIle(@ModelAttribute FileUploadTestVO form) throws IOException{
		
		System.out.println(form.getS_ppname());
//		
//		// DB 이미지 파일 정보 저장
//		int state = service.uploadTest(uploadImg);
//		logger.info("업데이트 상태 = {}",state);
		
		return "/customer/fileUploadTest";
	}
}
