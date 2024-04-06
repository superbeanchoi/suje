package com.suje.service.adminviews;

import java.util.List;

import com.suje.domain.adminviews.AdminQnAVO;

public interface AdminQnAService {
    List<AdminQnAVO> getQnAList(AdminQnAVO vo);
    int getTotalCountPage();
    AdminQnAVO getQnAInfo(String qna_code);
    void updateAdminInfo(AdminQnAVO qnaInfo); 
}
