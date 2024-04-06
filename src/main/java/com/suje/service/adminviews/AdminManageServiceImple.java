package com.suje.service.adminviews;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suje.dao.adminviews.AdminManageDao;
import com.suje.domain.adminviews.AdminManageVO;

@Service("AdminManageService")
public class AdminManageServiceImple implements AdminManageService {

	private static final Logger logger = LoggerFactory.getLogger(AdminManageServiceImple.class);

	@Autowired
	private AdminManageDao AdminManageDao;

	public List<AdminManageVO> getStoreList(AdminManageVO vo) {
		logger.info("스토어 입점관리 서비스");
		return AdminManageDao.getStoreList(vo);
	}

	@Override
	public int getTotalCountPage() {
		// TODO Auto-generated method stub
		logger.info("스토어 입점관리 전체 행 수 추출 서비스");
		return AdminManageDao.getTotalCountPage();
	}
	
	@Override
	public AdminManageVO getStoreInfo(AdminManageVO vo) {
		logger.info("스토어 개별 정보 모달 서비스");
		return AdminManageDao.getStoreInfo(vo);
	}
	
	@Override
	public void storeAvailInsert(AdminManageVO vo) {
		logger.info("스토어 입점 여부 Insert 서비스"+vo.getS_id()+vo.getSa_content()+vo.getSa_ck()+vo.getMa_id());
		AdminManageDao.storeAvailInsert(vo);
	}

}
