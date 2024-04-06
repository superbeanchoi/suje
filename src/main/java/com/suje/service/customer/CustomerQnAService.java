package com.suje.service.customer;

import java.util.List;

import com.suje.domain.customer.QnAVO;

public interface CustomerQnAService {
	
	public void insertQnA(QnAVO vo);
	
	public QnAVO getCustomerQnAA(int qna_code);
	
	public int getCountPageTotal(String id);
	
	public List<QnAVO> getQnAList(QnAVO vo);

}
