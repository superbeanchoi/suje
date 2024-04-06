package com.suje.dao.main;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suje.domain.main.MainLoginVO;

@Repository("MainLoginDao")
public class MainLoginDaoImpl implements MainLoginDao {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public MainLoginVO getMemberLogin(MainLoginVO vo) {
		System.out.println("멤버 로그인 마이바티스 작동 >> "+vo.getM_id()+" / "+vo.getM_pass());
		return mybatis.selectOne("MainLoginDao.getMemberLogin", vo);
	}
	@Override
	public MainLoginVO getStoreLogin(MainLoginVO vo) {
		System.out.println("스토어 로그인 마이바티스 작동 >> "+vo.getS_id()+" / "+vo.getS_pass());
		return mybatis.selectOne("MainLoginDao.getStoreLogin", vo);
	}
	@Override
	public MainLoginVO getAdminLogin(MainLoginVO vo) {
		System.out.println("어드민 로그인 마이바티스 작동 >> "+vo.getMa_id()+" / "+vo.getMa_pass());
		return mybatis.selectOne("MainLoginDao.getAdminLogin", vo);
	}
	
	@Override
	public void getMemberSignup(MainLoginVO vo) {
		System.out.println("멤버 회원가입 마이바티스 작동 >> "+vo.getM_id());
		mybatis.insert("MainLoginDao.getMemberSignup", vo);
	}
	@Override
	public MainLoginVO getMemberIdCheck(MainLoginVO vo) {
		System.out.println("멤버 아이디 중복체크 마이바티스 작동 >> "+vo.getM_id());
		return mybatis.selectOne("MainLoginDao.getMemberIdCheck", vo);
	}
	@Override
	public void getStoreSignup(MainLoginVO vo) {
		System.out.println("스토어 회원가입 마이바티스 작동 >> "+vo.getS_id());
		mybatis.insert("MainLoginDao.getStoreSignup", vo);
		mybatis.insert("MainLoginDao.getStoreAvailInsert", vo);
	}
	@Override
	public MainLoginVO getStoreIdCheck(MainLoginVO vo) {
		System.out.println("스토어 아이디 중복체크 마이바티스 작동 >> "+vo.getS_id());
		return mybatis.selectOne("MainLoginDao.getStoreIdCheck", vo);
	}
}
