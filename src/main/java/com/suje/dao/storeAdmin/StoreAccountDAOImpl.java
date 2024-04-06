package com.suje.dao.storeAdmin;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suje.domain.storeAdmin.StoreAccountVO;

@Repository
public class StoreAccountDAOImpl implements StoreAccountDAO {

	@Autowired
	SqlSessionTemplate mybatis;

	@Override
	public StoreAccountVO getAccountById(String id) {
		return mybatis.selectOne("StoreAccountDAO.getAccountById", id);
	}

	@Override
	public void updateAccount(StoreAccountVO updateAccount) {
		mybatis.update("StoreAccountDAO.updateAccount", updateAccount);
	}
	
}
