package com.suje.controller.fleaMarket;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.suje.domain.category.CategoryVO;
import com.suje.domain.fleaMarket.FleaGoodsVO;
import com.suje.service.category.CategoryMainService;
import com.suje.service.felaMarket.FleaGoodsSUService;


@Controller
public class fleaGoodsSUController {
	private static final Logger logger = LoggerFactory.getLogger(fleaGoodsSUController.class);

	@Autowired
	FleaGoodsSUService goodsService;
	
	@Autowired
	CategoryMainService categoryService;
	
	// 플리마켓 전체 상품 리스트 조회
	@RequestMapping(value = "fleaGoodsListAll")
	public String fleaGoodsListAll(@RequestParam("id") String id, FleaGoodsVO vo, Model model) {
		
		logger.info("/////////////////////////////  fleaGoodsListAll 실행");

		vo.setS_id(id);
		
		List<FleaGoodsVO> getFleaListAllVO = goodsService.fleaGoodsListAll(vo);
		List<CategoryVO> cateMainList = categoryService.getCateMain();
		
		model.addAttribute("cateMainList", cateMainList);
		model.addAttribute("fleaGoodsListAll", getFleaListAllVO);

		return "/fleaMarket/fleaGoodsSearchUpdate";
	}
	
	// 플리마켓 상품 상세정보 조회
	@RequestMapping(value = "getFleaInfo")
	@ResponseBody
	public Map<String,Object> getFleaInfo(@RequestParam Map<String,String> valueMap, FleaGoodsVO vo, Model model) 
	{
		
		logger.info("/////////////////////////////  getFleaInfo 실행");
		
		vo.setS_id(valueMap.get("id"));
		vo.setF_code(valueMap.get("fleaNum"));
		
		// 상품 상세 정보 불러오기
		FleaGoodsVO getFleaListVO = goodsService.getFleaInfo(vo);
		System.out.println("/////////////////////////////  상품 상세 정보 불러오기 실행");
		logger.info("getFleaListVO ===>"  + getFleaListVO);
		logger.info("중분류 ===>"  + getFleaListVO.getCatemm_code());
		logger.info("소분류 ===>"  + getFleaListVO.getCates_code());
		
		// 상품 서브 이미지 불러오기
		List<FleaGoodsVO> getSubImgListVO = goodsService.getFleaSubImgInfo(vo);
		System.out.println("/////////////////////////////  상품 서브 이미지 불러오기 실행");
		
		
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("getFleaListVO", getFleaListVO);
		resultMap.put("getSubImgListVO", getSubImgListVO);

		return resultMap;
	}

	// 플리마켓 상품 정보 수정
	@RequestMapping(value = "modifyGoodsSU", method = RequestMethod.POST)
	@ResponseBody
	public String modifyGoodsSU(FleaGoodsVO vo, Model model) {
		System.out.println("스토어 작품 수정///////////////");
		logger.info("/////////////////////////////   modifyGoodsSU 실행");

		int result = goodsService.modifyGoodsSU(vo);
		model.addAttribute("result", result);
		model.addAttribute("fleaInfoSuccess", "플리마켓 상품이 수정되었습니다.");
		
		return "forward:/fleaGoodsListAll.do?id="+vo.getS_id();
	}
	
	
	@RequestMapping(value= "deleteGoodsSU")
	public String deleteGoodsSU(FleaGoodsVO vo, Model model) {
		
		logger.info("/////////////////////////////   deleteGoodsSU 실행");
		System.out.println("delete VO      :    " + vo.getS_id());
		int result = goodsService.deleteGoodsSU(vo);
		model.addAttribute("result", result);
		model.addAttribute("fleaInfoSuccess", "플리마켓 상품이 삭제되었습니다.");
		
		return "forward:/fleaGoodsListAll.do?id="+vo.getS_id();
	}
	

} 







