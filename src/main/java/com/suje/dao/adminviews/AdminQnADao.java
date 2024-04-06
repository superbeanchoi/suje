package com.suje.dao.adminviews;

import java.util.List;

import com.suje.domain.adminviews.AdminQnAVO;

public interface AdminQnADao {
    List<AdminQnAVO> getQnAList(AdminQnAVO vo);
    int getTotalCountPage();
    AdminQnAVO getQnAInfo(String qna_code); 
    void updateAdminInfo(AdminQnAVO qnaInfo); 
}
