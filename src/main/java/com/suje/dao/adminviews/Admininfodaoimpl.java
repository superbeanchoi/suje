package com.suje.dao.adminviews;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suje.domain.adminviews.AdmininfoVO;

@Repository
public class Admininfodaoimpl implements Admininfodao {
    
    @Autowired
    private SqlSessionTemplate mybatis;

    @Override
    public AdmininfoVO getAdminInfo(String adminId) { 
        System.out.println("Repository 실행: 관리자 정보 가져오기");
        return mybatis.selectOne("com.suje.dao.adminviews.Admininfodao.getAdminInfo", adminId); 
    }

    @Override
    public void updateAdminExceptId(AdmininfoVO adminVO) {
        System.out.println("Repository 실행: 아이디 제외 관리자 정보 업데이트");
        mybatis.update("com.suje.dao.adminviews.Admininfodao.updateAdminExceptId", adminVO); 
    }
}
