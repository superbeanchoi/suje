package com.suje.dao.customer;

import com.suje.domain.customer.CardVO;

public interface CustomerCardDAO {
	
	public CardVO getCard(String id);
	
	public void updateCard(CardVO updateCard);
	  
	public void insertCard(CardVO vo); 
	 
	
}
