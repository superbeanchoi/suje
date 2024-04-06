package com.suje.domain.customer;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class FinalOrderVO {
   
   int fo_code, fo_sum, fo_num, o_code, cates_code, catemm_code, deli_code;
   String fo_date, fo_size,  fo_etc;
   
   String catemm_name, cates_name,deli_type,storeID;
   
   // 결제 정보 관련 변수
   String m_acc_bank,card_company,m_id,card_num, m_acc_num;
   long p_code;
   
   // 프로필 사진 관련
   String s_spname;
}