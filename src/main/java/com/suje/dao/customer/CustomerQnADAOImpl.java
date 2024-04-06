package com.suje.dao.customer;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suje.domain.customer.QnAVO;

@Repository
public class CustomerQnADAOImpl implements CustomerQnADAO {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerOrderDAOImpl.class);
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	@Override
	public void insertQnA(QnAVO vo) {
		System.out.println("=> Q&A 작성 Repository");
		mybatis.insert("CustomerDAO.insertQnA", vo);
		System.out.println("insertQnA vo : " + vo);
	}
	
	@Override
	public QnAVO getCustomerQnAA(int qna_code) {
		System.out.println("CustomerQnADAOImpl => getCustmerQnAA 실행");
		return mybatis.selectOne("CustomerDAO.getCustomerQnAA", qna_code);
	}

	@Override
	public int getCountPageTotal(String id) {
		logger.info("getCountPageTotal // Repository");
		return mybatis.selectOne("CustomerDAO.getCountPageTotal", id);
	}
	
	@Override
	public List<QnAVO> getQnAList(QnAVO vo) {
		logger.info("getQnAList // Repository");
		return mybatis.selectList("CustomerDAO.getQnAList", vo);
	}
	
	
}