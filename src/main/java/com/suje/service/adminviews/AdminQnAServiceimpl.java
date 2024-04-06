package com.suje.service.adminviews;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suje.dao.adminviews.AdminQnADao;
import com.suje.domain.adminviews.AdminQnAVO;

@Service("AdminQnAService")
public class AdminQnAServiceimpl implements AdminQnAService {
    
    @Autowired
    private AdminQnADao adminQnADao; 
    
    @Override
    public List<AdminQnAVO> getQnAList(AdminQnAVO vo) {
        return adminQnADao.getQnAList(vo);
    }
    
    @Override
    public int getTotalCountPage() {
        return adminQnADao.getTotalCountPage();
    }

    @Override
    public AdminQnAVO getQnAInfo(String qna_code) {
        return adminQnADao.getQnAInfo(qna_code);
    }

    @Override
    public void updateAdminInfo(AdminQnAVO qnaInfo) { 
        adminQnADao.updateAdminInfo(qnaInfo);
    }
}
