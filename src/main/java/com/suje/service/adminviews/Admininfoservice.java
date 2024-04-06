package com.suje.service.adminviews;

import com.suje.domain.adminviews.AdmininfoVO;

public interface Admininfoservice {
    AdmininfoVO getAdminInfo(String adminId); 
    void updateAdminExceptId(AdmininfoVO adminVO);
}
