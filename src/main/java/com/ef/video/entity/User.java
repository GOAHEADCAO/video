package com.ef.video.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="ef_user")
@Inheritance(strategy = InheritanceType.JOINED)
public class User extends BaseEntity {
public final static Integer STATUS_YES = 1; //可用
	public final static Integer STATUS_NO = 0; //不可用
	private String username;
	private String password;
    private Integer score;
	private String sno;//学号
	private Profession profession;//专业
	private String gender;
	private Integer status;//状态是否激活
	private Role role;//0为管理员
	private String email;//邮箱qq或者163
	private Set<Topic>topic;
	
	@Column(name="username", unique=true,nullable=false,length=16)
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Column(name="password",nullable=false,length=40)
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Column(name="sno", unique=true,nullable=false,length=9)
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	@OneToOne
	@JoinColumn(name="profession_Id",referencedColumnName="id",nullable=false)
	public Profession getProfession() {
		return profession;
	}
	public void setProfession(Profession profession) {
		this.profession = profession;
	}
	@Column(name="gender",length=10)
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	@Column(name="status",precision=1,columnDefinition="INT default 0")
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	@Column(name="email" ,length=50)
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Column(name="score",columnDefinition="INT default 0")
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	@ManyToOne()
	@JoinColumn(name="role" )
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	@OneToMany(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	@JoinTable(name = "bbs_user_topic", 
	joinColumns = {@JoinColumn(name = "user_id")},
	inverseJoinColumns = {@JoinColumn(name = "topic_id")})
		public Set<Topic> getTopic() {
		return topic;
	}
	public void setTopic(Set<Topic> topic) {
		this.topic = topic;
	}
	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + ", score=" + score + ", sno=" + sno
				+ ", profession=" + profession + ", gender=" + gender + ", status=" + status + ", role=" + role
				+ ", email=" + email + "]"+id;
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
		User other = (User) obj;
		if (this.id == null) {
			if (other.id != null)
				return false;
		} else if (!this.id.equals(other.id))
			return false;
		return true;
	}
	
}
