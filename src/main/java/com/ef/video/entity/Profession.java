package com.ef.video.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="ef_profession")
public class Profession extends BaseEntity{
public String name;
public Academy academy;
@Column(name="name",length=40)
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
@ManyToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
@JoinColumn(name="academy_Id")
public Academy getAcademy() {
	return academy;
}
public void setAcademy(Academy academy) {
	this.academy = academy;
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
	Profession other = (Profession) obj;
	if (this.id == null) {
		if (other.id != null)
			return false;
	} else if (!this.id.equals(other.id))
		return false;
	return true;
}

}
