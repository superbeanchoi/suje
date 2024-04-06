package com.suje.dao.customer;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suje.domain.customer.MemberVO;
import com.suje.domain.customer.ReviewVO;

@Repository
public class CustomerInfoDAOImpl implements CustomerInfoDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	@Override
	public MemberVO getCustomerInfo(String id) {	
		System.out.println("CustomerInfoDAOImpl => getCustomerInfo 실행");
		return mybatis.selectOne("CustomerDAO.getCustomerInfo",id);
		
	}
	
	@Override
	public int updateMypageInfo(MemberVO vo) {	
		System.out.println("CustomerInfoDAOImpl => updateMypageInfo 실행");
		return mybatis.update("CustomerDAO.updateMypageInfo", vo);
	}
	
	@Override
	public List<ReviewVO> getCustomerReview(String id) {		
		System.out.println("CustomerInfoDAOImpl => getCustomerReview 실행");
		return mybatis.selectList("CustomerDAO.getCustomerReview", id);
	}

	
}
