package com.suje.dao.adminviews;

import com.suje.domain.adminviews.AdmininfoVO;

public interface Admininfodao {
    AdmininfoVO getAdminInfo(String adminId); 
    void updateAdminExceptId(AdmininfoVO adminVO);
}
