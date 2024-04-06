package com.suje.dao.adminviews;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suje.domain.adminviews.AdminPntVO;

@Repository("adminPntDao")
public class AdminPntDaoImpl implements AdminPntDao {

	private static final Logger logger = LoggerFactory.getLogger(AdminPntDaoImpl.class);
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public List<AdminPntVO> getAdminPnt(AdminPntVO vo) {
		logger.info("스토어 입점관리 마이바티스");
		return (List<AdminPntVO>)(Object) mybatis.selectList("AdminPntDao.getAdminPnt", vo);
	}
	
	@Override
	public int getTotalCountPage() {
		logger.info("스토어 벌점정보 전체 행 수 추출 마이바티스");
		return mybatis.selectOne("AdminPntDao.getTotalCountPage");
	}
	
	@Override
	public List<AdminPntVO> getStoreIdSearch(AdminPntVO vo) {
		String storeName = vo.getS_name();
		logger.info("스토어 아이디 검색 마이바티스"+storeName);
		return mybatis.selectList("AdminPntDao.getStoreIdSearch", vo);
	}
	
	@Override
	public void pntInsert(AdminPntVO vo) {
		logger.info("스토어 벌점 등록 마이바티스"+"/"+vo.ma_id+"/"+vo.s_id+"/"+vo.de_score+"/"+vo.de_why);
		
		mybatis.insert("AdminPntDao.pntInsert", vo);
	}
}
