package com.suje.dao.adminviews;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suje.domain.adminviews.AdminManageVO;
import com.suje.service.adminviews.AdminManageServiceImple;

@Repository("AdminManageDao")
public class AdminManageDaoImpl implements AdminManageDao {

	private static final Logger logger = LoggerFactory.getLogger(AdminManageServiceImple.class);

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public List<AdminManageVO> getStoreList(AdminManageVO vo) {
		logger.info("스토어 입점관리 마이바티스");
		return (List<AdminManageVO>)(Object) mybatis.selectList("AdminManageDao.getStoreList", vo);
	}
	
	@Override
	public int getTotalCountPage() {
		logger.info("스토어 입점관리 전체 행 수 추출 마이바티스");
		return mybatis.selectOne("AdminManageDao.getTotalCountPage");
	}
	
	@Override
	public AdminManageVO getStoreInfo(AdminManageVO vo) {
		logger.info("스토어 개별 정보 모달 마이바티스");
		return mybatis.selectOne("AdminManageDao.getStoreInfo", vo);
	}
	
	@Override
	public void storeAvailInsert(AdminManageVO vo) {
		logger.info("스토어 입점 여부 Insert 마이바티스"+vo.getS_id()+vo.getSa_content()+vo.getSa_ck()+vo.getMa_id());
		mybatis.update("AdminManageDao.storeAvailInsert", vo);
	}

}
