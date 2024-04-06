package com.suje.dao.storeAdmin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suje.domain.storeAdmin.StoreGoodsSUVO;
import com.suje.domain.storeAdmin.StoreProfileVO;

@Repository
public class StoreGoodsSUDAOImpl implements StoreGoodsSUDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	    
  	@Override
	public List<StoreGoodsSUVO> storeGoodsMainPage(StoreGoodsSUVO vo){ 
		return mybatis.selectList("StoreGoodsSUDAO.storeGoodsMainPage", vo);
	}

	@Override
	public StoreGoodsSUVO getGoodsInfo(StoreGoodsSUVO vo){ 
		return  mybatis.selectOne("StoreGoodsSUDAO.getGoodsInfo", vo);
	}
	
	@Override
	public List<StoreGoodsSUVO> getGoodsSubImgInfo(StoreGoodsSUVO vo){ 
		System.out.println("==============서브이미지 마이바티스============");
		return mybatis.selectList("StoreGoodsSUDAO.getGoodsSubImgInfo", vo);
	}
	
	
	@Override
	public int updateGoodsSU(StoreGoodsSUVO vo) {
		return mybatis.update("StoreGoodsSUDAO.updateGoodsSU", vo);
	}
    
	@Override
	public int deleteStoreGoodsSU(StoreGoodsSUVO vo) {
		return mybatis.delete("StoreGoodsSUDAO.deleteGoodsSU", vo);
	}
    
    

}
