package com.ef.video.dto;

import java.util.Date;

public class CurrentArticleInfoDTO {
	
	//文章ID
	private String articleId;
	
	//时间
	private Date articleDate;
	
	//当前文章的排序
	private Integer orderNo;

	public String getArticleId() {
		return articleId;
	}

	public void setArticleId(String articleId) {
		this.articleId = articleId;
	}

	public Date getArticleDate() {
		return articleDate;
	}

	public void setArticleDate(Date articleDate) {
		this.articleDate = articleDate;
	}

	public Integer getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

}

