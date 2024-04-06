package com.suje.dao.adminviews;

import java.util.List;

import com.suje.domain.adminviews.AdminQnAVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminQnADaoImpl implements AdminQnADao {
    
    private static final Logger logger = LoggerFactory.getLogger(AdminQnADaoImpl.class);
    
    @Autowired
    private SqlSessionTemplate sqlSession;
    
    @Override
    public List<AdminQnAVO> getQnAList(AdminQnAVO vo) {
        logger.info("QnA 목록 가져오기 - sqlSession");
        return sqlSession.selectList("AdminQnADao.getQnAList", vo);
    }
    
    @Override
    public int getTotalCountPage() {
        logger.info("QnA 전체 행 수 추출 - sqlSession");
        return sqlSession.selectOne("AdminQnADao.getTotalCountPage");
    }

    @Override
    public AdminQnAVO getQnAInfo(String qna_code) { 
        logger.info("QnA 상세정보 추출 - sqlSession");
        return sqlSession.selectOne("AdminQnADao.getQnAInfo", qna_code);
    }

    @Override
    public void updateAdminInfo(AdminQnAVO qnaInfo) {
        logger.info("QnA 업데이트 - sqlSession");
        sqlSession.update("AdminQnADao.updateAdminInfo", qnaInfo);
    }
}
