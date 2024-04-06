package com.suje.dao.storeAdmin;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suje.domain.storeAdmin.StoreNoticeVO;


@Repository
public class StoreNotiInfoDAOImple implements StoreNotiInfoDAO {

	@Autowired
	SqlSessionTemplate mybatis;

	@Override
	public void insertStoreNotiInfo(StoreNoticeVO vo) {
		System.out.println("=> 스토어 공지등록 Repository");
		
		mybatis.insert("StoreNotiInfoDAO.insertStoreNotiInfo", vo);

		System.out.println("insertStoreNotiInfo vo :"+ vo);

	}

}