package com.ef.video.service;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ef.video.dao.CommentDao;
import com.ef.video.dao.TopicDao;
import com.ef.video.dto.TopicDto;
import com.ef.video.entity.Comment;
import com.ef.video.entity.Page;
import com.ef.video.entity.Topic;

@Service
public class BBSservice {
@Autowired
private TopicDao topicDao;
@Autowired
private CommentDao commentDao;
	
@Autowired
public void setTopicDao(TopicDao topicDao) {
	this.topicDao = topicDao;
}
@Autowired
public void setCommentDao(CommentDao commentDao) {
	this.commentDao = commentDao;
}

	public Page<Topic> findAllTopic(TopicDto topic) {
		return topicDao.queryTopicPage(topic);
	}
	public boolean save(Topic topic) {
		System.out.println("save topic");
	topicDao.save(topic);
		return true;
	}
	public Topic findTopicById(String id) {
		return topicDao.findOne(id);
		
	}
	public void deleteTopic(Topic topic) {
		System.out.println("deleteTopic"+topic);
	   topicDao.delete(topic);
	   
	}
	public void saveComment(Comment comment) {
		System.out.println(" sasveComment");
		commentDao.save(comment);
		
	}
	public Comment findCommentById(String id) {
		return commentDao.findOne(id);
	}
	public void deleteComment(Comment comment) {
		System.out.println("deleteComment");
		commentDao.delete(comment);
		
	}
	public void deleteAllComment(Set<Comment> comments) {
		commentDao.deleteInBatch(comments);
	}
	
}
