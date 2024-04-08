package com.suje.controller.fleaMarket;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.suje.domain.category.CategoryVO;
import com.suje.domain.fleaMarket.FleaGoodsVO;
import com.suje.service.category.CategoryMainService;
import com.suje.service.felaMarket.FleaGoodsInfoService;

@Controller
public class FleaGoodsInfoController {
	private static final Logger logger = LoggerFactory.getLogger(FleaGoodsInfoController.class);

	@Autowired
	FleaGoodsInfoService fleaInfoService;

	@Autowired
	CategoryMainService categoryService;

	// 플리마켓 상품 등록 메인 페이지
	@RequestMapping(value = "fleaGoodsInfoMain")
	public String fleaGoodsInfoMain(Model model) {

		List<CategoryVO> cateMainList = categoryService.getCateMain();
		model.addAttribute("cateMainList", cateMainList);

		return "/fleaMarket/fleaGoodsInfo";
	}
	
	// 플리마켓 전체 상품 정보(서브이미지 포함) 등록
	@RequestMapping(value = "insertFleaGoodsInfo", method = RequestMethod.POST)
	public String insertFleaGoodsInfo(@ModelAttribute FleaGoodsVO vo, Model model) throws Exception {
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>컨트롤러");

		
		String fileName = null;
		String originalFileName = null;
		MultipartFile imgFiles = vo.getFleaupMainimg();
		List<MultipartFile> imgSubFiles = vo.getFleaupSubimg();

		logger.info(">>>>>>>>>>>> imgFiles :" + imgFiles);
		logger.info(">>>>>>>>>>>> vo :" + vo);

		logger.info("내용 >>"+vo.getF_content()+"/ "+vo.getF_num()+"/"+vo.getF_sum()+"");
		if (!imgFiles.isEmpty()) { // file객체가 비어있지 않다면
			String fCode = fleaInfoService.getFcodeSeq();
			
			//메인 이미지를 DB에 넣는 로직
			originalFileName = imgFiles.getOriginalFilename().substring(0, imgFiles.getOriginalFilename().lastIndexOf(".")); // 파일의
			String ext1 = FilenameUtils.getExtension(imgFiles.getOriginalFilename()); // 파일의 확장자 
			UUID uuid1 = UUID.randomUUID(); // 파일의 새로운 닉네임 
			fileName = uuid1+"."+ext1; //파일의 실제 이름+랜덤값+파일의 확장자 >> 새로운 파일명 지정
			imgFiles.transferTo(new File("C:\\workspaces\\SujeStore\\src\\main\\webapp\\resources\\img\\DBServer\\" + fileName));

			vo.setF_pname(originalFileName);
			vo.setF_spname(fileName);
			vo.setF_code(fCode); 

			//flea테이블 DB에 INSERT
			fleaInfoService.insertFleaInfo(vo);
			
			//서브 이미지를 DB에 넣는 로직
			for (MultipartFile file : imgSubFiles) {
				originalFileName = file.getOriginalFilename(); //파일의 실제 이름
				String ext2 = FilenameUtils.getExtension(file.getOriginalFilename()); // 파일의 확장자 
				UUID uuid2 = UUID.randomUUID(); // 파일의 새로운 닉네임 
				fileName = uuid2+"."+ext2; //파일의 실제 이름+랜덤값+파일의 확장자 >> 새로운 파일명 지정
				file.transferTo(new File("C:\\workspaces\\SujeStore\\src\\main\\webapp\\resources\\img\\DBServer\\" + fileName));

				vo.setFs_pname(originalFileName);
				vo.setFs_spname(fileName);
				vo.setF_code(fCode); 
				
				//flea_sub DB에 INSERT
				fleaInfoService.insertFleaSubInfo(vo);
			}

		}

		model.addAttribute("insertVO", vo);
		model.addAttribute("insertFleaInfoSuccess", "플리마켓 상품이 등록되었습니다.");
		System.out.println("///////////////////////////////플리마켓 등록 컨트롤러");

		logger.info(vo.getS_id());

		return "forward:/fleaGoodsListAll.do?id=" + vo.getS_id();
	}

}
