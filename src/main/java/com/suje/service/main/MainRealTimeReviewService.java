package com.suje.service.main;

import java.util.List;

import com.suje.domain.main.MainRealTimeReviewVO;

public interface MainRealTimeReviewService {
	
	
	List<MainRealTimeReviewVO> getReviewList(MainRealTimeReviewVO vo);
    int getTotalCountPage();
    void updateLikeCount(int reviewId);
    int getUpdatedLikes(int reviewId);
}
