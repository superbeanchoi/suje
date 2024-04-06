package com.suje.domain.customer;

import org.springframework.stereotype.Service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO {
	String m_id, m_pass, m_name, m_tel, m_email, m_sex;
	String m_date,m_birth;
}
