package com.suje.service.customer;

import com.suje.domain.customer.CardVO;

public interface CustomerCardService {

	public CardVO getCard(String id);
	
	public void updateCard(CardVO updateCard);
	  
	public void insertCard(CardVO vo);
	 
	
}
