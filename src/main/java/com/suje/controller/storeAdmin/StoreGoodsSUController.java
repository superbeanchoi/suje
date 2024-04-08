package com.suje.controller.storeAdmin;

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
import com.suje.domain.storeAdmin.StoreGoodsSUVO;
import com.suje.service.category.CategoryMainService;
import com.suje.service.storeAdmin.StoreGoodsSUService;
import com.suje.service.storeAdmin.StoreProfileService;

@Controller
public class StoreGoodsSUController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(StoreGoodsSUController.class);
	
	@Autowired
	StoreGoodsSUService goodsService;
	
	@Autowired
	CategoryMainService categoryService;
	
	@RequestMapping(value="storeGoodsMainPage")
	public String storeGoodsMainPage(@RequestParam("id") String id, StoreGoodsSUVO vo, Model model){
		
		
		logger.info("/////////////////////////////  스토어 메인 전체 리스트 조회 실행");

		vo.setS_id(id);
		
		List<StoreGoodsSUVO> goodsListAllVO = goodsService.storeGoodsMainPage(vo);
		List<CategoryVO> cateMainList = categoryService.getCateMain();
		
		
		model.addAttribute("cateMainList",cateMainList);
		model.addAttribute("goodsListAllVO", goodsListAllVO);
		
		return "/storeAdmin/storeGoodsSearchUpdate";
	}
	
	// 스토어 작품 상세정보 조회
		@RequestMapping(value = "getGoodsInfo")
		@ResponseBody
		public Map<String,Object> getGoodsInfo(@RequestParam Map<String,String> valueMap, StoreGoodsSUVO vo, Model model) 
		{
			
			
			vo.setS_id(valueMap.get("id"));
			vo.setG_code(valueMap.get("goodsNum"));
			
			// 작품 상세 정보 불러오기
			StoreGoodsSUVO getGoodsListVO = goodsService.getGoodsInfo(vo);
			System.out.println("/////////////////////////////  스토어 작품 상세 정보 불러오기 실행");
			
			
			// 작품 서브 이미지 불러오기
			List<StoreGoodsSUVO> getSubImgListVO = goodsService.getGoodsSubImgInfo(vo);
			System.out.println("/////////////////////////////  스토어 작품 서브 이미지 불러오기 실행");
			
			
			Map<String,Object> resultMap = new HashMap<String, Object>();
			resultMap.put("getGoodsListVO", getGoodsListVO);
			resultMap.put("getSubImgListVO", getSubImgListVO);

			return resultMap;
		}
	
	
	
    @RequestMapping(value="updateGoodsSU", method=RequestMethod.POST)
    @ResponseBody
    public String updateGoodsSU(StoreGoodsSUVO vo, Model model) {
    	
    	logger.info("/////////////////////////////  작품 목록 수정 updateGoodsSU 실행");
    	int result = goodsService.updateGoodsSU(vo);
    	model.addAttribute("result", result);
    	
    	//상품 리스트 불러오기	
    	List<StoreGoodsSUVO> goodsListAllVO = goodsService.storeGoodsMainPage(vo);
    	Map<String,Object> resultMap = new HashMap<String, Object>();
    	
    	resultMap.put("getGoodsListVO", goodsListAllVO);
		
        return "forward:/storeGoodsMainPage.do?id=" + vo.getS_id();
    }
	
	  @RequestMapping("deleteStoreGoodsSU.do") 
	  public String deleteStoreGoodsSU(StoreGoodsSUVO vo, Model model) {
	  
		  int result = goodsService.deleteStoreGoodsSU(vo);
	      model.addAttribute("result", result);
	      model.addAttribute("StoreInfoSuccess", "스토어 피드가 삭제되었습니다.");
	  
	  return "forward:/storeGoodsMainPage.do?id=" + vo.getS_id();
	  }
	 
    

	
}
