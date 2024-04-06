package com.suje.service.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suje.dao.customer.FileUploadTestDAO;
import com.suje.domain.customer.FileUploadTestVO;

@Service
public class FileUploadTestServiceImpl implements FileUploadTestService {
	
	
	@Autowired
	FileUploadTestDAO fileDAO;
	
	@Override
	public int uploadTest(String uploadFile) {
		return fileDAO.uploadTest(uploadFile);
	}
	
	@Override
	public FileUploadTestVO getFileName(int no) {
		return fileDAO.getFileName(no);
	}
}
