package com.suje.service.storeAdmin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suje.dao.storeAdmin.StoreNoticeDAO;
import com.suje.domain.storeAdmin.StoreNoticeVO;


@Service
public class StoreNoticeServiceImple implements StoreNoticeService {

	@Autowired
	StoreNoticeDAO dao;


	
	@Override
	public List<StoreNoticeVO> storeNoticeListAll(StoreNoticeVO vo) {
		
		System.out.println("=> 스토어 공지 조회 Service");
	  return dao.storeNoticeListAll(vo);
	}
	
	@Override
	public StoreNoticeVO getNotiInfo(StoreNoticeVO vo){
		System.out.println("=> 스토어 공지내용 조회 Service");
		return dao.getNotiInfo(vo);
	}
	
	@Override
	public int modifyNotiInfo(StoreNoticeVO vo) {
		System.out.println("=> 스토어 공지내용 수정 Service");
		return dao.modifyNotiInfo(vo);
		
	}

	@Override
	public int deleteNotiInfo(int notiNum) {
		System.out.println("=> 스토어 공지 삭제 Service");
		return dao.deleteNotiInfo(notiNum);
		
	}
	
	
	
 
}