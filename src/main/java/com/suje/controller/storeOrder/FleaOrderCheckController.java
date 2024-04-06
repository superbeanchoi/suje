package com.suje.controller.storeOrder;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.suje.domain.storeOrder.FleaOrderCheckVO;
import com.suje.domain.storeOrder.StoreOrderCheckVO;
import com.suje.service.storeOrder.FleaOrderCheckService;

@Controller
public class FleaOrderCheckController {
	private static final Logger logger = LoggerFactory.getLogger(StoreOrderCheckController.class);
	
	@Autowired
	FleaOrderCheckService flordercheckService;
	
	
	@RequestMapping(value="fleaOrderCheck")
    public String getFleaOrderCheck(@RequestParam("id") String id, Model model){
        logger.info("getFleaOrderCheck");
        // id 값을 가지고 service
        List<FleaOrderCheckVO> fleaorderCheck = flordercheckService.getFleaOrderCheck(id);
        model.addAttribute("FleaOrderCheckList", fleaorderCheck);
        return "storeOrder/fleaOrderCheck";
	}
	@RequestMapping(value="fleadelivery", method = RequestMethod.GET)
	@ResponseBody
	public FleaOrderCheckVO getFleaDelivery(@RequestParam Map<String,String> fpCode) {
		
		logger.info("getFleaDelivery");
		FleaOrderCheckVO fleadeliVO = flordercheckService.getFleaDelivery(Integer.parseInt(fpCode.get("fpCode")));
		
		return fleadeliVO;
	}
	
	@RequestMapping(value="fleadeliverycomplete", produces="application/text; charset=utf8")
	@ResponseBody
	public String fleadeliverycomplete(@RequestParam Map<String,String> fpCode) {
		
		logger.info("fleadeliverycomplete");
		flordercheckService.fleadeliverycomplete(Integer.parseInt(fpCode.get("fpCode")));
		return "발송 처리가 완료되었습니다.";
	}
}
