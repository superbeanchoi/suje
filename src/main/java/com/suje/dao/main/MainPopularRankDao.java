package com.suje.dao.main;

import java.util.List;

import com.suje.domain.main.MainPopularRankVO;

public interface MainPopularRankDao {
	public List<MainPopularRankVO> popularRank(String cate);
	public List<MainPopularRankVO> popularRankGoodsImg(MainPopularRankVO vo);
}
