package com.suje.service.storeAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suje.dao.storeAdmin.StoreNotiInfoDAO;
import com.suje.domain.storeAdmin.StoreNoticeVO;


@Service
public class StoreNotiInfoServiceImple implements StoreNotiInfoService {

	@Autowired
	StoreNotiInfoDAO dao;


	
	@Override
	public void insertStoreNotiInfo(StoreNoticeVO notiVO) {
		System.out.println("=> 스토어 공지등록 Service");
	  dao.insertStoreNotiInfo(notiVO);
	}

}