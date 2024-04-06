package com.suje.service.storeOrder;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suje.dao.storeOrder.StoreOrderListDAO;
import com.suje.domain.category.CategoryVO;
import com.suje.domain.customer.EtcVO;
import com.suje.domain.customer.FinalOrderVO;
import com.suje.domain.storeOrder.StoreOrderListVO;

@Service
public class StoreOrderListServiceImpl implements StoreOrderListService {
	
	@Autowired
	StoreOrderListDAO storeOrderListDao;
	
	// Store - Suje Talk 전체 행 개수 구하기
	@Override
	public int getStoreOrderListCount(String storeID) {
		return storeOrderListDao.getStoreOrderListCount(storeID);
	}
	
	// Suje 톡톡 주문 내역
	@Override
	public List<StoreOrderListVO> getStoreOrderList(StoreOrderListVO vo) {
		return storeOrderListDao.getStoreOrderList(vo);
	}
	
	// SUJE 톡톡 주문 상세 요청 사항
	@Override
	public List<EtcVO> getStoreOrderEtc(int storeOrderNO) {
		return storeOrderListDao.getStoreOrderEtc(storeOrderNO);
	}
	

	
	//최종주문서 insert
	@Override
	public int insertFinalOrderInfo(FinalOrderVO vo) {
		return storeOrderListDao.insertFinalOrderInfo(vo);
	}
	
	// 최종 주문서 정보 불러오기
	@Override
	public FinalOrderVO getStoreFinalOrder(int orderNO) {
		return storeOrderListDao.getStoreFinalOrder(orderNO);
	}
	
	//최종 주문서 정보 수정하기
	@Override
	public int updateFinalOrderinfo(FinalOrderVO vo) {
		return storeOrderListDao.updateFinalOrderinfo(vo);
	}
	
	// 기타 요청 내역 답변 입력
	@Override
	public int insertStoreEtc(EtcVO etcVO) {
		return storeOrderListDao.insertStoreEtc(etcVO);
	}
	
	// 대분류 카테고리 가져오기
	@Override
	public CategoryVO getCateMainName(String id) {
		return storeOrderListDao.getCateMainName(id);
	}
}
