package com.suje.dao.main;

import java.util.List;

import com.suje.domain.main.MainVO;

public interface MainDao {
	public List<MainVO> getRecentRealTimeReview();
	public List<MainVO> getRecentStoreFeed();
}
