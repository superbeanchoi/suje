package com.suje.domain.customer;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CardVO {
	
	private int card_code, card_cvc, card_pass;
	private String m_id, card_company, card_num;
	String card_adate;

}
