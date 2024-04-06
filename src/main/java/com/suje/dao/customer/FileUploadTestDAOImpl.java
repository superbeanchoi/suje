package com.suje.dao.customer;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.suje.domain.customer.FileUploadTestVO;

@Repository
public class FileUploadTestDAOImpl implements FileUploadTestDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	@Override
	public int uploadTest(String uploadFile) {
		return mybatis.update("FilUploadDAO.uploadTest",uploadFile);
	}
	
	@Override
	public FileUploadTestVO getFileName(int no) {
		return mybatis.selectOne("FilUploadDAO.getFileName",no);
	}
}
