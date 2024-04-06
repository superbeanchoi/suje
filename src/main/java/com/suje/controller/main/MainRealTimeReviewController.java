package com.suje.controller.main;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.suje.domain.main.MainRealTimeReviewVO;
import com.suje.service.main.MainRealTimeReviewService;

@Controller
public class MainRealTimeReviewController {
    private static final Logger logger = LoggerFactory.getLogger(MainRealTimeReviewController.class);
    
    @Autowired
    private MainRealTimeReviewService mainRealTimeReviewService;
    private int totalRowCount; // 전체 레코드 수
    private int pageTotalCount; // 전체 페이지 수
    private int countPerPage = 10; // 한페이지당 레코드 수

    @Autowired
    private HttpSession session;

    @RequestMapping(value = "viewRealTimeReview.do")
    public String viewRealTimeReview(@RequestParam("page") int page, Model model) {
        logger.info("실시간 후기 view 실행 컨트롤러");
        
        // 전체 레코드 수 가져오기
         totalRowCount = mainRealTimeReviewService.getTotalCountPage();
        
        // 전체 페이지 수 
         pageTotalCount = totalRowCount / countPerPage;
        if (totalRowCount % countPerPage > 0) pageTotalCount++;
        
        // 부분 페이지 수 계산
        int firstNum = (page - 1) * countPerPage + 1;
        int endNum = page * countPerPage;
        
        MainRealTimeReviewVO vo = new MainRealTimeReviewVO();
        vo.setFirstNum(firstNum);
        vo.setEndNum(endNum);
        
        // 세션에서 mainId 가져오기
        String mainId = (String) session.getAttribute("mainId");
        
        model.addAttribute("mainId", mainId);
        model.addAttribute("pageTotalCount", pageTotalCount);
        model.addAttribute("reviewList", mainRealTimeReviewService.getreviewList(vo));
        
        return "main/mainRealTimeReview";
    }

    
    @RequestMapping(value="reviewUpdate.do", method=RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<Map<String, Object>> updateReview(@RequestParam("reviewId") int reviewId) {
        logger.info("실시간 후기 Update 실행 컨트롤러");

        mainRealTimeReviewService.updateLikeCount(reviewId);

        // 업데이트된 좋아요 수를 조회하는 로직 추가
        int updatedLikes = mainRealTimeReviewService.getUpdatedLikes(reviewId);

        Map<String, Object> response = new HashMap<>();
        response.put("updatedLikes", updatedLikes);

        return new ResponseEntity<>(response, HttpStatus.OK);
    }
}
