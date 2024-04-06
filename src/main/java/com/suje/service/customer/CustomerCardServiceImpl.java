package com.suje.service.customer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suje.dao.customer.CustomerCardDAO;
import com.suje.domain.customer.CardVO;
import com.suje.domain.customer.QnAVO;

@Service
public class CustomerCardServiceImpl implements CustomerCardService {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerAccountServiceImpl.class);
	
	@Autowired
	CustomerCardDAO dao; 
		
	@Override
	public CardVO getCard(String id) {
		return dao.getCard(id);
	}

	@Override
	public void updateCard(CardVO updateCard) {
		dao.updateCard(updateCard);
	}

	@Override
	public void insertCard(CardVO vo) {
		dao.insertCard(vo);
	}

	
}