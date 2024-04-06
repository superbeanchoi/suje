package com.suje.dao.customer;

import com.suje.domain.customer.FileUploadTestVO;

public interface FileUploadTestDAO {
	
	public int uploadTest(String uploadFile);
	public FileUploadTestVO getFileName(int no); 
}
