package com.suje.service.main;

import java.util.List;

import com.suje.domain.main.MainPopularRankVO;

public interface MainPopularRankService {
	public List<MainPopularRankVO> popularRank(String cate);
	public List<MainPopularRankVO> popularRankGoodsImg(MainPopularRankVO vo);
}
