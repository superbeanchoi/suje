package com.suje.service.main;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suje.dao.main.MainPopularRankDao;
import com.suje.domain.main.MainPopularRankVO;

@Service("MainPopularRankService")
public class MainPopularRankServiceImpl implements MainPopularRankService {

	private static final Logger logger = LoggerFactory.getLogger(MainPopularRankServiceImpl.class);

	@Autowired
	private MainPopularRankDao mainPopullarRankDao;
	
	@Override
	public List<MainPopularRankVO> popularRank(String cate) {
		logger.info("인기랭킹 조회 서비스");
		return mainPopullarRankDao.popularRank(cate);
	}
	
	@Override
	public List<MainPopularRankVO> popularRankGoodsImg(MainPopularRankVO vo) {
		logger.info("스토어 실시간 굿즈 미리보기 서비스");
		return mainPopullarRankDao.popularRankGoodsImg(vo);
	}
}
