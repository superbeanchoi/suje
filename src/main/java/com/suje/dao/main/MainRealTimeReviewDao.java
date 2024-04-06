package com.suje.dao.main;

import java.util.List;

import com.suje.domain.main.MainRealTimeReviewVO;

public interface MainRealTimeReviewDao {
	List<MainRealTimeReviewVO> getreviewList(MainRealTimeReviewVO vo);
    int getTotalCountPage();
    void updateLikeCount(int reviewId);
    int getUpdatedLikes(int reviewId);
}
