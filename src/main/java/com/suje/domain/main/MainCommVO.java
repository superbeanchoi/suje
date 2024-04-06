package com.suje.domain.main;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MainCommVO {

	//comu_post
	public String comup_code, m_id, comuc_code, comup_title, comup_content, comup_date, comup_redate, comup_count, comup_like;
	
	//replyCount
	public String reCnt;
	
	//comu_cate
	public String comuc_name;
	
	//comu_reply
	public String comur_code, comur_content, comur_date;
	
	//comu_post_photo
	public String cpp_code, cpp_pname, cpp_spname, cpp_ppath, cpp_psize;
	List<MultipartFile> comup_img;
	
	//Page
	public int firstNum, endNum, rnum;
	
}
