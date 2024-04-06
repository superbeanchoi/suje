package com.suje.service.main;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suje.dao.main.MainRealTimeReviewDao;
import com.suje.domain.main.MainRealTimeReviewVO;

@Service("MainRealTimeReviewService")
public class MainRealTimeReviewServiceImpl implements MainRealTimeReviewService {
    
    private static final Logger logger = LoggerFactory.getLogger(MainRealTimeReviewServiceImpl.class); 
    
    @Autowired
    private MainRealTimeReviewDao mainRealTimeReviewDao; 
    
    @Override
    public List<MainRealTimeReviewVO> getreviewList(MainRealTimeReviewVO vo) {
        logger.info("실시간 후기 view 실행 서비스임플");
        return mainRealTimeReviewDao.getreviewList(vo); 
    }
    
    @Override
    public int getTotalCountPage() {
        logger.info("실시간 후기 페이징(총 페이지 수) 실행 서비스임플");
        return mainRealTimeReviewDao.getTotalCountPage(); 
    }
   
    @Override
    public void updateLikeCount(int reviewId) {
        logger.info("실시간 후기 업데이트 실행 서비스임플");
        mainRealTimeReviewDao.updateLikeCount(reviewId); 
    }
    @Override
    public int getUpdatedLikes(int reviewId) {
    	logger.info("실시간 후기 업데이트 실행후 좋아요 뷰 서비스임플");
    	return mainRealTimeReviewDao.getUpdatedLikes(reviewId);
    }
}
