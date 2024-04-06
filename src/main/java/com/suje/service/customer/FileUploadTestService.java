package com.suje.service.customer;

import com.suje.domain.customer.FileUploadTestVO;

public interface FileUploadTestService {

	public int uploadTest(String uploadFile);
	public FileUploadTestVO getFileName(int no); 
}
