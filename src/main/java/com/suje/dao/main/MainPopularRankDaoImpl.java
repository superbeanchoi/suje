package com.suje.dao.main;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suje.domain.main.MainPopularRankVO;

@Repository("MainPopularRankDao")
public class MainPopularRankDaoImpl implements MainPopularRankDao {

	private static final Logger logger = LoggerFactory.getLogger(MainPopularRankDaoImpl.class);

	@Autowired
	private SqlSessionTemplate mybatis;	
	
	@Override
	public List<MainPopularRankVO> popularRank(String cate) {
		logger.info("인기랭킹 조회 마이바티스");
		MainPopularRankVO vo = new MainPopularRankVO();
		vo.setCatem_code(cate);
		return mybatis.selectList("MainPopularRankDao.popularRank", vo);
	}
	
	@Override
	public List<MainPopularRankVO> popularRankGoodsImg(MainPopularRankVO vo) {
		logger.info("스토어 실시간 굿즈 미리보기 마이바티스");
		return mybatis.selectList("MainPopularRankDao.popularRankGoodsImg", vo);
	}
}
