package com.suje.dao.main;

import java.util.List;

import com.suje.domain.main.MainFleaMarketVO;

public interface MainFleaMarketDao {
	public int getTotalAllCountPage();
	public int getLimitTotalCountPage(MainFleaMarketVO vo);
	public List<MainFleaMarketVO> getFleaAllList(MainFleaMarketVO vo);
	public MainFleaMarketVO getfleaDetail(String fCode);
	public List<MainFleaMarketVO> getfleaDetailSubImg(String fCode);
	public MainFleaMarketVO getPayInfo(MainFleaMarketVO vo);
	public MainFleaMarketVO getFleaBuyingMemberInfo(MainFleaMarketVO vo);
	public String getFleaPaySeq();
	public void fleaPayInsert(MainFleaMarketVO vo);
	public void fleaDeliveryInsert(MainFleaMarketVO vo);
	public void fleaUpdate(MainFleaMarketVO vo);
}
