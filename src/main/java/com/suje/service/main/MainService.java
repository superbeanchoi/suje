package com.suje.service.main;

import java.util.List;

import com.suje.domain.main.MainVO;

public interface MainService {
	public List<MainVO> getRecentRealTimeReview();
	public List<MainVO> getRecentStoreFeed();
}
