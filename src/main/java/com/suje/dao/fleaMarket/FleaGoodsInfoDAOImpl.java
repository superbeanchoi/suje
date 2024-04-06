package com.suje.dao.fleaMarket;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suje.domain.fleaMarket.FleaGoodsVO;

@Repository
public class FleaGoodsInfoDAOImpl implements FleaGoodsInfoDAO {

	@Autowired
	SqlSessionTemplate mybatis;

	@Override
	public void insertFleaInfo(FleaGoodsVO vo) {
		System.out.println("=> 플리마켓 상품 등록 Service");
		mybatis.insert("FleaGoodsInfoDAO.insertFleaInfo", vo);
	}

	@Override
	public void insertFleaSubInfo(FleaGoodsVO vo) {
		System.out.println("=> 플리마켓 서브이미지 등록 Service");
		mybatis.insert("FleaGoodsInfoDAO.insertFleaSubInfo", vo);
	}

	@Override
	public String getFcodeSeq() {
		System.out.println("=> getFcodeSeq Service");
		return mybatis.selectOne("FleaGoodsInfoDAO.getFcodeSeq");
	}

}
