package com.suje.dao.customer;

import java.util.List;
import java.util.Map;

import com.suje.domain.customer.QnAVO;

public interface CustomerQnADAO {
	
	public void insertQnA(QnAVO vo);
	
	public QnAVO getCustomerQnAA(int qna_code);
	
	public int getCountPageTotal(String id);
	
	public List<QnAVO> getQnAList(QnAVO vo);

}
