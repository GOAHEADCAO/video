package com.ef.video.dao;

import org.springframework.data.jpa.repository.Query;

import com.ef.video.entity.Document;

public interface DocumentDao extends CommonDao<Document,String>{
    @Query("select d from Document d where d.name=?1")
	public Document find(String logImageName);

}
