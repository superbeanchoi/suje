package com.suje.dao.storeAdmin;

import java.util.List;

import com.suje.domain.storeAdmin.StoreNoticeVO;

public interface StoreNoticeDAO {

	 public List<StoreNoticeVO> storeNoticeListAll(StoreNoticeVO vo); 
	 public StoreNoticeVO getNotiInfo(StoreNoticeVO vo);
	 public int modifyNotiInfo(StoreNoticeVO vo);
	 public int deleteNotiInfo(int notiNum);
	 
}
