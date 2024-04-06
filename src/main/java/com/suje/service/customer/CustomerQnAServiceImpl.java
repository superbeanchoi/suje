package com.suje.service.customer;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suje.dao.customer.CustomerQnADAO;
import com.suje.domain.customer.QnAVO;

@Service
public class CustomerQnAServiceImpl implements CustomerQnAService {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerQnAServiceImpl.class);

	@Autowired
	CustomerQnADAO dao;
	
	@Override
	public void insertQnA(QnAVO vo) {
		System.out.println("=> Q&A작성 Service 실행");
		dao.insertQnA(vo);
	}
	
	@Override
	public QnAVO getCustomerQnAA(int qna_code) {
		System.out.println("=> CustomerQnAAService 실행");
		QnAVO vo = dao.getCustomerQnAA(qna_code);
		return vo;
	}

	@Override
	public int getCountPageTotal(String id) {
		logger.info("getCountPageTotal // Service");
		return dao.getCountPageTotal(id);
	}
	
	@Override
	public List<QnAVO> getQnAList(QnAVO vo) {
		logger.info("getQnAList // Service");
		return dao.getQnAList(vo);
	}
	
}
