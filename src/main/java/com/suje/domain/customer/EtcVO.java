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
public class EtcVO {
	
	private int etc_code, o_code, etc_type_code;
	private String etc_spname, etc_ppath, etc_pname, etc_psize,etc_content, etc_date, o_content,s_spname; 
	private String s_id,m_id,s_name,m_name;
	
	// 요청사항 출력용
	private String content, o_date;
	
	//컨트롤 이미지 정보 저장용
	private MultipartFile uploadImgFile;
	
	@Setter(value = AccessLevel.NONE) private String saveDir = "C:/workspaces/SujeStore/src/main/webapp/resources/img/DBServer/";
	
	public void setUploadImgFile(MultipartFile uploadImgFile) {
		
		this.uploadImgFile = uploadImgFile;
		
		if(!uploadImgFile.isEmpty()) {
			
			this.etc_pname = uploadImgFile.getOriginalFilename(); //파일의 업로드직전 이름
			this.etc_psize = String.valueOf(uploadImgFile.getSize()); // 파일의 용량
			
			UUID uuid = UUID.randomUUID(); // 무작위 36자리 이름 정하는 메소드 
			String ext = FilenameUtils.getExtension(uploadImgFile.getOriginalFilename()); //파일의 확장자
			
			this.etc_spname = uuid.toString() + "." + ext;
			File fPath = new File(saveDir + etc_spname); // 파일의 경로정보 변경
			this.etc_ppath = saveDir + etc_spname; // -- 
			
			// IO 입출력 관련 예외처리
			try {
				uploadImgFile.transferTo(fPath); // DBServe 폴더에 이미지 업로드
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
	}
	
	
}