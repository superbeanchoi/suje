package com.suje.controller.storeAdmin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.suje.domain.storeAdmin.StoreAccountVO;
import com.suje.service.storeAdmin.StoreAccountService;

@Controller 
public class StoreAccountController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreAccountController.class);
	
    @Autowired
   StoreAccountService accountService;
   
    @RequestMapping(value="storeAccountInfo")
    public String showStoreAccount(@RequestParam String id, Model model) {
    	logger.info("Controller 실행 showStoreAccount");
    	StoreAccountVO vo = accountService.getAccountById(id);
        
        model.addAttribute("vo", vo);
        
        return "/storeAdmin/storeAccountInfo"; 
    }
    
    @RequestMapping(value="updateAccount", method=RequestMethod.POST)
    public String updateAccount(@ModelAttribute StoreAccountVO updateAccount) {
    	logger.info("Controller 실행 updateAccount");
    	accountService.updateAccount(updateAccount);  
        return "redirect:/storeAccountInfo.do?id=" + updateAccount.getS_id();
    }
}
    
