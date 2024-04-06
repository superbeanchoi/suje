package com.suje.controller.storeAdmin;

import java.io.File;
import java.util.List;
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
import com.suje.domain.storeAdmin.StoreGoodsSUVO;
import com.suje.service.category.CategoryMainService;
import com.suje.service.storeAdmin.StoreGoodsInfoService;
@Controller
public class StoreGoodsInfoController {
	private static final Logger logger = LoggerFactory.getLogger(StoreGoodsSUController.class);

	@Autowired
	StoreGoodsInfoService goodsInfoService;
	
	@Autowired
	CategoryMainService categoryService;
	

	// 스토어 작품 등록 메인 페이지
		@RequestMapping(value = "storeGoodsInfo")
		public String storeGoodsInfoMain(Model model) {

			List<CategoryVO> cateMainList = categoryService.getCateMain();
			model.addAttribute("cateMainList", cateMainList);

			System.out.println("///////////////////////////////스토어 작품 등록 메인 페이지");

			return "/storeAdmin/storeGoodsInfo";
		}
	
	
	// 스토어 전체 작품 정보(서브이미지 포함) 등록
		@RequestMapping(value = "insertStoreGoodsInfo", method = RequestMethod.POST)
		public String insertStoreGoodsInfo(@ModelAttribute StoreGoodsSUVO vo, Model model) throws Exception {
			System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 스토어 작품 등록 컨트롤러");

			
			String fileName = null;
			String originalFileName = null;
			MultipartFile imgFiles = vo.getGoodsupMainimg();
			List<MultipartFile> imgSubFiles = vo.getGoodsupSubimg();

			logger.info(">>>>>>>>>>>> imgFiles :" + imgFiles);
			logger.info(">>>>>>>>>>>> vo :" + vo);

			logger.info("내용 >>"+vo.getG_content()+"/ ");
			if (!imgFiles.isEmpty()) { // file객체가 비어있지 않다면
				String gCode = goodsInfoService.getGcodeSeq();
				
				//메인 이미지를 DB에 넣는 로직
				originalFileName = imgFiles.getOriginalFilename().substring(0, imgFiles.getOriginalFilename().lastIndexOf(".")); // 파일의
				String ext1 = FilenameUtils.getExtension(imgFiles.getOriginalFilename()); // 파일의 확장자 
				UUID uuid1 = UUID.randomUUID(); // 파일의 새로운 닉네임 
				fileName = uuid1+"."+ext1; //파일의 실제 이름+랜덤값+파일의 확장자 >> 새로운 파일명 지정
				imgFiles.transferTo(new File("C:\\workspaces\\SujeStore\\src\\main\\webapp\\resources\\img\\DBServer\\" + fileName));

				vo.setG_pname(originalFileName);
				vo.setG_spname(fileName);
				vo.setG_code(gCode); 

				//goods테이블 DB에 INSERT
				goodsInfoService.insertStoreInfo(vo);
				
				//서브 이미지를 DB에 넣는 로직
				for (MultipartFile file : imgSubFiles) {
					originalFileName = file.getOriginalFilename(); //파일의 실제 이름
					String ext2 = FilenameUtils.getExtension(file.getOriginalFilename()); // 파일의 확장자 
					UUID uuid2 = UUID.randomUUID(); // 파일의 새로운 닉네임 
					fileName = uuid2+"."+ext2; //파일의 실제 이름+랜덤값+파일의 확장자 >> 새로운 파일명 지정
					file.transferTo(new File("C:\\workspaces\\SujeStore\\src\\main\\webapp\\resources\\img\\DBServer\\" + fileName));

					vo.setGs_pname(originalFileName);
					vo.setGs_spname(fileName);
					vo.setG_code(gCode); 
					
					//goods_sub DB에 INSERT
					goodsInfoService.insertStoreSubInfo(vo);
				}

			}

			model.addAttribute("insertGoodsVO", vo);
			model.addAttribute("insertStoreInfoSuccess", "스토어 작품이 등록되었습니다.");

			System.out.println("///////////////////////////////스토어 등록 컨트롤러");

			logger.info(vo.getS_id());

			return "forward:/storeGoodsInfo.do?id=" + vo.getS_id();
			
		}
	

}