package com.suje.service.adminviews;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.suje.dao.adminviews.Admininfodao;
import com.suje.domain.adminviews.AdmininfoVO;

@Service
@Transactional
public class Admininfoserviceimpl implements Admininfoservice {

    @Autowired
    private Admininfodao admininfodao;

    @Override
    public AdmininfoVO getAdminInfo(String adminId) {
        System.out.println("Service 실행: 관리자 정보 가져오기");
        return admininfodao.getAdminInfo(adminId);
    }

    @Override
    public void updateAdminExceptId(AdmininfoVO adminVO) {
        System.out.println("Service 실행: 아이디 제외 관리자 정보 업데이트");
        admininfodao.updateAdminExceptId(adminVO);
    }
}
