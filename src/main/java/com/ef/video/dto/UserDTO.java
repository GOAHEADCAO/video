package com.ef.video.dto;
/**
 * 数据传输对象User
 * @author JH
 *
 */
public class UserDTO {
private String id;
private String username;
private String mobile;
private Integer status;
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getMobile() {
	return mobile;
}
public void setMobile(String mobile) {
	this.mobile = mobile;
}
public Integer getStatus() {
	return status;
}
public void setStatus(Integer status) {
	this.status = status;
}

}
