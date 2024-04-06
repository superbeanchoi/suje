package com.suje.service.adminviews;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suje.dao.adminviews.AdminPntDao;
import com.suje.domain.adminviews.AdminPntVO;

@Service("adminPntService")
public class AdminPntServiceImpl implements AdminPntService {

	private static final Logger logger = LoggerFactory.getLogger(AdminPntServiceImpl.class);
	
	@Autowired
	private AdminPntDao adminPntDao;
	
	@Override
	public List<AdminPntVO> getAdminPnt(AdminPntVO vo) {
		logger.info("스토어 벌점정보 서비스");
		return adminPntDao.getAdminPnt(vo);
	}
	
	@Override
	public int getTotalCountPage() {
		// TODO Auto-generated method stub
		logger.info("스토어 벌점정보 전체 행 수 추출 서비스");
		return adminPntDao.getTotalCountPage();
	}
	
	@Override
	public List<AdminPntVO> getStoreIdSearch(AdminPntVO vo) {
		logger.info("스토어 아이디 검색 서비스"+vo.getS_name());
		return adminPntDao.getStoreIdSearch(vo);
	}
	
	@Override
	public void pntInsert(AdminPntVO vo) {
		logger.info("스토어 벌점 등록 서비스"+"/"+vo.ma_id+"/"+vo.s_id+"/"+vo.de_score+"/"+vo.de_why);
		adminPntDao.pntInsert(vo);
	}
	
}
