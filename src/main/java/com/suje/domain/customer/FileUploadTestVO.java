package com.suje.domain.customer;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@ToString
@Setter
public class FileUploadTestVO {
	
	private String textTest1,rvp_ppath;
	private String textTest2;
	private String textTest3;
	
	private String s_ppname;
	private String s_pname;
	private long s_size;
	
	private MultipartFile file;
	
	@Setter(value = AccessLevel.NONE) private String saveDir = "C:/workspaces/SujeWebProject/src/main/webapp/resources/DB/";
	
	public MultipartFile getFile() {
		return file;
	}


	public void setFile(MultipartFile file) {
		this.file = file;

		if (!file.isEmpty()) {
			this.s_pname = file.getOriginalFilename(); // 파일의 실제 파일명 가져오기 + 실제 파일명 변수에 값 저장
			this.s_size = file.getSize(); // 파일의 용량 저장

			// DB서버 저장용 파일명 만들기
			UUID uuid = UUID.randomUUID();
			s_ppname = uuid.toString() + "_" + s_pname;

			// 파일의 경로 변경
			File f = new File(saveDir + s_ppname);

			// IO 입출력 관련 예외처리
			try {
				file.transferTo(f); // 변경된 경로에 저장 처리
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	
}
