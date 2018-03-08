package com.ef.video.dao;

import org.springframework.data.jpa.repository.Query;

import com.ef.video.entity.Article;

public interface ArticleDao extends ArticleDaoCustom,CommonDao<Article,String>{
    @Query("select count (*) from Article")
	public Integer getNumber();

}
