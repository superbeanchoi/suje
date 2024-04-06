package com.suje.domain.storeAdmin;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StoreGoodsSUVO {
	//goods
	String g_code;
	int cates_code, catemm_code, catem_code; 
	String catem_name, cates_name, catemm_name;
	String s_id, g_date, g_redate, g_content; 
	String g_pname, g_spname, g_ppath, g_psize;
	
	//goods_sub
	String gs_code;
	String gs_psize, gs_pname, gs_spname, gs_ppath;  
    MultipartFile goodsupMainimg;  //메인 이미지 (1개)
    List<MultipartFile> goodsupSubimg;  //서브 이미지 (다수)
	
	
}
