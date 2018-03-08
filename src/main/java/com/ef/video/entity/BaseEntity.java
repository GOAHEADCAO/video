package com.ef.video.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
@MappedSuperclass
public class BaseEntity extends SequenceIdEntity implements Serializable{
	private static final long serialVersionUID = -1287263291861081044L;
	
//创建时间
protected  Date createDate;
//更新时间
protected Date updateDate;
@Column(name="create_date" ,updatable=false)
public Date getCreateDate() {
	return createDate;
}
public void setCreateDate(Date createDate) {
	this.createDate = createDate;
}
@Column(name="update_date")
public Date getUpdateDate() {
	return updateDate;
}
public void setUpdateDate(Date updateDate) {
	this.updateDate = updateDate;
}

}

