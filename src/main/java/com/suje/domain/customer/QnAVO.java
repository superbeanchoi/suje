package com.suje.domain.customer;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class QnAVO {
	int qna_code;
	String m_id, qna_title, qna_content, qna_reply, qna_qdate, qna_adate;
	
	// 페이징 관련 메소드
	private int totalPageCount, firstNum, endNum;
}
