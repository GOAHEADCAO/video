package com.ef.video.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="ef_bbs_topic")
public class Topic extends BaseEntity {
private String title;
private int type;//话题种类 学习（0） 娱乐（1） 八卦2 其他3
private Set<Comment> comments;
private String content;
private Integer commentsCount;
private int status;
private int isTop;
private int isAudit;
private User publisher;//作者
private int readers;
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}

public Integer getCommentsCount() {
	return commentsCount;
}
public void setCommentsCount(Integer commentsCount) {
	this.commentsCount = commentsCount;
}

public int getIsAudit() {
	return isAudit;
}
public void setIsAudit(int isAudit) {
	this.isAudit = isAudit;
}
@OneToMany(fetch = FetchType.EAGER,cascade=CascadeType.ALL)
@JoinTable(name = "bbs_topic_comment", 
	joinColumns = {@JoinColumn(name = "topic_id")},
	inverseJoinColumns = {@JoinColumn(name = "comment_id")})
public Set<Comment> getComments() {
	return comments;
}
public void setComments(Set<Comment> comments) {
	this.comments = comments;
}
@Column(nullable=false)
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}

public int getType() {
	return type;
}
public void setType(int type) {
	this.type = type;
}
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}
public int getIsTop() {
	return isTop;
}
public void setIsTop(int isTop) {
	this.isTop = isTop;
}
@ManyToOne(fetch=FetchType.EAGER)
@JoinColumn(name="publisher",nullable=false)
public User getPublisher() {
	return publisher;
}
public void setPublisher(User publisher) {
	this.publisher = publisher;
}
public int getReaders() {
	return readers;
}
public void setReaders(int readers) {
	this.readers = readers;
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
	Topic other = (Topic) obj;
	if (this.id == null) {
		if (other.id != null)
			return false;
	} else if (!this.id.equals(other.id))
		return false;
	return true;
}

@Override
public String toString() {
	return "Topic [title=" + title + ", type=" + type + ", content=" + content
			+ ", commentsCount=" + commentsCount + ", status=" + status + ", isTop=" + isTop + ", isAudit=" + isAudit
			+ ", publisher=" + publisher + ", readers=" + readers + "]";
}

}
