package com.suje.controller.storeOrder;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.suje.domain.storeOrder.StoreCalculateVO;
import com.suje.service.storeOrder.StoreCalculateService;

@Controller
public class StoreCalculateController {
	private static final Logger logger = LoggerFactory.getLogger(StoreCalculateController.class);
	
	@Autowired
	StoreCalculateService calculateService;
	
	@RequestMapping(value="storeCalculate")
    public String getStoreCalculate(@RequestParam("id") String id, @RequestParam("month") int month, Model model){
        logger.info("getStoreCalculate");
        // id 값을 가지고 service
        List<StoreCalculateVO> calculate = calculateService.getStoreCalculate(id,month);
        
        model.addAttribute("calculateList", calculate);
        model.addAttribute("month",month);
        model.addAttribute("id",id);
        
        return "storeOrder/storeCalculate";
	}
}
