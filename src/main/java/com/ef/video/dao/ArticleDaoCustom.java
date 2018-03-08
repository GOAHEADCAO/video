package com.ef.video.dao;

import java.util.List;
import java.util.Map;

import com.ef.video.dto.ArticleQueryDto;
import com.ef.video.dto.CurrentArticleInfoDTO;
import com.ef.video.entity.Article;
import com.ef.video.entity.Page;

public interface ArticleDaoCustom {

    Page<Article> queryArticlePage(ArticleQueryDto articleQueryDTO);

    List<Article> queryArticleList(ArticleQueryDto articleQueryDTO);

    List<Map<String, Object>> queryStatisMapList(ArticleQueryDto articleQueryDTO);
    
    List<Article> queryNextArticleList(CurrentArticleInfoDTO currentArticleInfoDTO);
    
    List<Article> queryPreArticleList(CurrentArticleInfoDTO currentArticleInfoDTO);

}
