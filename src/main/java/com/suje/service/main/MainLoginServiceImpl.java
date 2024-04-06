package com.suje.service.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suje.dao.main.MainLoginDao;
import com.suje.domain.main.MainLoginVO;

@Service("MainLoginService")
public class MainLoginServiceImpl implements MainLoginService {

	@Autowired
	private MainLoginDao mainLoginDao;
	
	@Override
	public MainLoginVO getMemberLogin(MainLoginVO vo) {
		System.out.println("멤버 로그인 서비스 작동 >> "+vo.getM_id()+" / "+vo.getM_pass());
		return mainLoginDao.getMemberLogin(vo);
	}
	@Override
	public MainLoginVO getStoreLogin(MainLoginVO vo) {
		System.out.println("스토어 로그인 서비스 작동 >> "+vo.getS_id()+" / "+vo.getS_pass());
		return mainLoginDao.getStoreLogin(vo);
	}
	@Override
	public MainLoginVO getAdminLogin(MainLoginVO vo) {
		System.out.println("어드민 로그인 서비스 작동 >> "+vo.getMa_id()+" / "+vo.getMa_pass());
		return mainLoginDao.getAdminLogin(vo);
	}
	
	@Override
	public void getMemberSignup(MainLoginVO vo) {
		System.out.println("멤버 회원가입 서비스 작동 >> "+vo.getM_id());
		mainLoginDao.getMemberSignup(vo);
	}
	@Override
	public MainLoginVO getMemberIdCheck(MainLoginVO vo) {
		System.out.println("멤버 아이디 중복체크 서비스 작동 >> "+vo.getM_id());
		return mainLoginDao.getMemberIdCheck(vo);
	}
	@Override
	public void getStoreSignup(MainLoginVO vo) {
		System.out.println("스토어 회원가입 서비스 작동 >> "+vo.getS_id());
		mainLoginDao.getStoreSignup(vo);
	}
	@Override
	public MainLoginVO getStoreIdCheck(MainLoginVO vo) {
		System.out.println("스토어 아이디 중복체크 서비스 작동 >> "+vo.getS_id());
		return mainLoginDao.getStoreIdCheck(vo);
	}
}
