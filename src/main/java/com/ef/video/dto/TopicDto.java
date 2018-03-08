package com.ef.video.dto;

import com.ef.video.entity.User;

public class TopicDto extends CommonQueryDTO{
private String title;
private User publisher;
private String createTime;
private String type;
private Integer top;
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public User getPublisher() {
	return publisher;
}
public void setPublisher(User publisher) {
	this.publisher = publisher;
}
public String getCreateTime() {
	return createTime;
}
public void setcreateTime(String createTime) {
	this.createTime = createTime;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public Integer getTop() {
	return top;
}
public void setTop(Integer top) {
	this.top = top;
}

}
