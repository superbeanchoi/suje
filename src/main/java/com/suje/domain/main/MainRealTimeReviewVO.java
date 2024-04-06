package com.suje.domain.main;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MainRealTimeReviewVO {
	// page
    private int firstNum, endNum, rnum;
    // photo_riview_test 
    private String RVP_PSIZE, RVP_PNAME, RVP_SPNAME, RVP_PPATH,RVP_CODE, RV_CODE;                                                                                                                                                                                                                                                          
    // riview_test 
    private String RV_CONTENT, RV_DATE, RV_LIKE, RV_STAR, p_code;
}
