package com.ef.video.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.ef.video.dao.DocumentDao;
import com.ef.video.entity.Document;
@Service
public class DocumentService {
	@Autowired
private DocumentDao documentDao;
public boolean saveDocument(Document document){
	if(document!=null){
		documentDao.save(document);
		return true;
	}
	return false;
}
public List<Document>findAllDocumentByPage(){

return documentDao.findAll();
}
public Document findDocumentByName(String logImageName) {
	return documentDao.find(logImageName);
}
}
