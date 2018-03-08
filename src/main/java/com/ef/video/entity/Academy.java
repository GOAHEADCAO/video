package com.ef.video.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="ef_academy")
public class Academy extends BaseEntity{
public String name;
public List<Profession>professions;
@Column(name="ac_name",length=40)
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
@OneToMany(cascade=CascadeType.ALL,mappedBy="academy")
public List<Profession> getProfessions() {
	return professions;
}
public void setProfessions(List<Profession> professions) {
	this.professions = professions;
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
	Academy other = (Academy) obj;
	if (this.id == null) {
		if (other.id != null)
			return false;
	} else if (!this.id.equals(other.id))
		return false;
	return true;
}

}
