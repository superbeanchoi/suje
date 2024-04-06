package com.suje.dao.customer;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suje.domain.customer.AccountVO;
import com.suje.domain.customer.CardVO;

@Repository
public class CustomerAccountDAOImpl implements CustomerAccountDAO {

	@Autowired
	SqlSessionTemplate mybatis;

	@Override
	public AccountVO getAccount(String id) {
		return mybatis.selectOne("CustomerAccountDAO.getAccount", id);
	}

	@Override
	public void updateCAccount(AccountVO updateCAccount) {
		mybatis.update("CustomerAccountDAO.updateCAccount", updateCAccount);
	}
	
	@Override
	public void insertAccount(AccountVO vo) {
		mybatis.insert("CustomerAccountDAO.insertAccount", vo);
	}
	
}
