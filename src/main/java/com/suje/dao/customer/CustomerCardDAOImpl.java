package com.suje.dao.customer;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suje.domain.customer.CardVO;
import com.suje.domain.customer.QnAVO;

@Repository
public class CustomerCardDAOImpl implements CustomerCardDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	@Override
	public CardVO getCard(String id) {
		return mybatis.selectOne("CustomerCardDAO.getCard", id);
	}

	@Override
	public void updateCard(CardVO updateCard) {
		mybatis.update("CustomerCardDAO.updateCard", updateCard);
	}

	@Override
	public void insertCard(CardVO vo) {
		mybatis.insert("CustomerCardDAO.insertCard", vo);
	}
	 
}