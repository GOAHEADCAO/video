package com.ef.video.dao;

import org.springframework.data.jpa.repository.Query;

import com.ef.video.entity.Resource;

public interface ResourceDao extends CommonDao<Resource,String> {
    @Query ("select r from Resource r where r.url=?1 ")
	public Resource findResourceByUrl(String url);

}
