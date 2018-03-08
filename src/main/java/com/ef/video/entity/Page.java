package com.ef.video.entity;

import java.io.Serializable;
import java.util.List;

public class Page <T> implements Serializable {

	private static final long serialVersionUID = 3265524976080127173L;

	private int totalCount; //总记录数
	
	private int pageSize = 10; //每页显示的数量
	
	private int totalPage; //总页数
	
	private int currentPage = 1; //当前页数
	
	private List<T> list; //分页集合列表
	
	private String url; //分页跳转的URL
	
	public Page() {
	}
	
	public Page(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}


}
