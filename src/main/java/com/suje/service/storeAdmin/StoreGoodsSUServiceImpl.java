package com.suje.service.storeAdmin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suje.dao.storeAdmin.StoreGoodsSUDAO;
import com.suje.domain.storeAdmin.StoreGoodsSUVO;
import com.suje.domain.storeAdmin.StoreProfileVO;

@Service
public class StoreGoodsSUServiceImpl implements StoreGoodsSUService{

	@Autowired
	StoreGoodsSUDAO dao;
	
	@Override
	public List<StoreGoodsSUVO> storeGoodsMainPage(StoreGoodsSUVO vo){ 
		return dao.storeGoodsMainPage(vo);
	}

	@Override
	public StoreGoodsSUVO getGoodsInfo(StoreGoodsSUVO vo){ 
		return dao.getGoodsInfo(vo);
	}
	
	@Override
	public List<StoreGoodsSUVO> getGoodsSubImgInfo(StoreGoodsSUVO vo){ 
		return dao.getGoodsSubImgInfo(vo);
	}
	
	@Override
	public int updateGoodsSU(StoreGoodsSUVO vo) {
		int result = dao.updateGoodsSU(vo);
		return result;
	}
		
	@Override
	public int deleteStoreGoodsSU(StoreGoodsSUVO vo) {
		int result = dao.deleteStoreGoodsSU(vo);
		return result;
	}
}


