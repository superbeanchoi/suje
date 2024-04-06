package com.suje.dao.main;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suje.domain.main.MainRealTimeReviewVO;

@Repository("MainRealTimeReviewDao")
public class MainRealTimeReviewDaoImpl implements MainRealTimeReviewDao {

    private static final Logger logger = LoggerFactory.getLogger(MainRealTimeReviewDaoImpl.class);

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<MainRealTimeReviewVO> getreviewList(MainRealTimeReviewVO vo) {
        logger.info("실시간후기 목록 가져오기 - sqlSession");
        return sqlSession.selectList("getreviewList", vo);
    }

    @Override
    public int getTotalCountPage() {
        logger.info("실시간후기 전체 행 수 추출(페이징) - sqlSession");
        return sqlSession.selectOne("MainRealTimeReviewDao.getTotalCountPage");
    }

    @Override
    public void updateLikeCount(int reviewId) {
        logger.info("좋아요 수 업데이트 - 서비스");
        sqlSession.update("updateLikeCount", reviewId);
    }

    @Override
    public int getUpdatedLikes(int reviewId) {
        logger.info("좋아요 수 업데이트 후 좋아요 뷰 - 서비스");
        return sqlSession.selectOne("getUpdatedLikes", reviewId);
    }
}
