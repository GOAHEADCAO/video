package com.ef.video.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Table(name="ef_document")
@Entity
public class Document extends BaseEntity {
private  String  name;
private String path;
private String uploadName;
@Column(name ="name")
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
@Column(name="path")
public String getPath() {
	return path;
}
public void setPath(String path) {
	this.path = path;
}
@Column(name="uploadName")
public String getUploadName() {
	return uploadName;
}
public void setUploadName(String uploadName) {
	this.uploadName = uploadName;
}
@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((this.id == null) ? 0 : this.id.hashCode());
	return result;
}
@Override
public boolean equals(Object obj) {
	if (this == obj)
		return true;
	if (obj == null)
		return false;
	if (getClass() != obj.getClass())
		return false;
	Document other = (Document) obj;
	if (this.id == null) {
		if (other.id != null)
			return false;
	} else if (!this.id.equals(other.id))
		return false;
	return true;
}
}
