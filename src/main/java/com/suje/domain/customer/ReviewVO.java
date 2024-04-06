package com.suje.domain.customer;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ReviewVO {
	
	private int rv_code, fo_code, pt_code, o_code, cates_code, deli_code;
	private int rv_like, rv_star, p_sum, fo_sum, fo_num, p_code;
	private String rv_content, rv_date, p_date, p_ck, p_ck_date, fo_date, fo_size, fo_etc, m_id, o_date;
	
	// 리뷰 포토 테이블
	private int rvp_code;
	private String rvp_psize, rvp_pname, rvp_spname, rvp_ppath;
	
	//파일 이미지 업로드
	private MultipartFile reviewImg;
	
	// 페이징 관련 메소드
	private int totalPageCount, firstNum, endNum;
	
	@Setter(value = AccessLevel.NONE) private String saveDir = "C:/workspaces/SujeWebProject/src/main/webapp/resources/img/DBServer/";

	public void setReviewImg(MultipartFile reviewImg) {
		this.reviewImg = reviewImg;
		
		this.rvp_pname = reviewImg.getOriginalFilename();
		this.rvp_psize = String.valueOf(reviewImg.getSize());
		
		UUID uuid = UUID.randomUUID(); // 무작위 36자리 이름 정하는 메소드
		String ext = FilenameUtils.getExtension(reviewImg.getOriginalFilename()); //파일의 확장자
		this.rvp_spname = uuid.toString() + "." + ext;
		
		File fPath = new File(saveDir + rvp_spname);
		this.rvp_ppath = saveDir+rvp_spname;
		
		try {
			reviewImg.transferTo(fPath); // DBServe 폴더에 이미지 업로드
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
}
