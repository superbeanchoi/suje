package com.suje.domain.adminviews;

import lombok.Getter;
import lombok.Setter;
import java.util.Date;

@Getter
@Setter
public class AdminQnAVO {
    // qna
    private String qna_code;
    private String qna_title, qna_content, qna_reply, m_id;
    private String qna_qdate, qna_adate; 
    
    // manager
    private String maId;
    private String maPass;
    private String maName;
    private String maTel;
    private String maEmail;
    
    // page
    private int firstNum, endNum, rnum;
}
