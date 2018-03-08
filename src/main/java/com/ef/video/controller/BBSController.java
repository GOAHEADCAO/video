package com.ef.video.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ef.video.dto.AjaxResult;
import com.ef.video.dto.TopicDto;
import com.ef.video.entity.Comment;
import com.ef.video.entity.Page;
import com.ef.video.entity.Topic;
import com.ef.video.entity.User;
import com.ef.video.service.BBSservice;
import com.ef.video.service.UserService;

@Controller
@RequestMapping("/BBS")
public class BBSController {
	@Autowired
	private UserService userService;
	@Autowired
	private BBSservice bbsService;
@RequestMapping("/getAllTopic")	
public ModelAndView getAllTopic(HttpServletRequest request,HttpServletResponse response){
	    ModelAndView mav=new ModelAndView();
	try {
		request.setCharacterEncoding("utf-8");
	String title=request.getParameter("title");
	String publisher=request.getParameter("publisher");
	String createDate=request.getParameter("createDate");
	String type=request.getParameter("type");
	String currentPageStr = request.getParameter("currentPage");
	String pageSizeStr = request.getParameter("pageSize");
	int currentPage = 1;
	int pageSize = 5;
	if(StringUtils.isNotBlank(currentPageStr)){
		currentPage = Integer.parseInt(currentPageStr);
	}
	if(StringUtils.isNotBlank(pageSizeStr)){
		pageSize = Integer.parseInt(pageSizeStr);

	}
	TopicDto topic=new TopicDto();
	topic.setcreateTime(createDate);
	topic.setCurrentPage(currentPage);
	topic.setPageSize(pageSize);
	User u=userService.findUserBySno(publisher);
	if(u!=null)
	topic.setPublisher(u);
	topic.setType(type);
	topic.setTitle(title);
	System.out.println(title+publisher);
	Page <Topic> page= bbsService.findAllTopic(topic);
	mav.addObject("page", page);
	mav.addObject("type",type);
	mav.addObject("topic", topic);
	mav.setViewName("web/all/bbs/index");
	} catch (Exception e) {
		e.printStackTrace();
	}
	return mav;
}

@RequestMapping("/addTopic")	
public ModelAndView addTopic(HttpServletRequest request,HttpServletResponse response) throws ParseException{
	try {
		request.setCharacterEncoding("utf-8");
	} catch (UnsupportedEncodingException e1) {
		e1.printStackTrace();
	}
	Topic topic=new Topic();
	ModelAndView mav=new ModelAndView();
	 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	 Subject sub=SecurityUtils.getSubject();
	 if(!sub.isAuthenticated()){
		 mav.addObject("msg", "您还未登陆，请登录");
		 mav.setViewName("web/all/index");
		 return mav;
	 }
	String title=request.getParameter("title");
	String type=request.getParameter("type");
	String createDate=request.getParameter("createDate");
	String updateDate=request.getParameter("updateDate");
	String publisher=request.getParameter("publisher");
	String content=request.getParameter("content");
	User u=null;
	if(StringUtils.isNotBlank(publisher)){
		u=userService.findUserBySno(publisher);
		if(u!=null){
			u.getTopic().add(topic);
			topic.setPublisher(u);
		}
		else{
			 mav.addObject("msg", "当前用户不存在");
			 mav.setViewName("web/all/index");
			 return mav;
		}
	}
	if(StringUtils.isNotBlank(type)){
		topic.setType(Integer.parseInt(type));
	}
    if(StringUtils.isNotBlank(title)){
		topic.setTitle(title);
	}
    if(StringUtils.isNotBlank(content)){
		topic.setContent(content);
	}
	if(StringUtils.isNotBlank(createDate)){
		topic.setCreateDate(sdf.parse(createDate));
	}
	if(StringUtils.isNotBlank(updateDate)){
		topic.setUpdateDate(sdf.parse(updateDate));
	}
	if(topic.getTitle().equals(null)||topic.getPublisher()==null){
		mav.addObject("msg", "主题或话题者不能为空");
		mav.setViewName("web/all/fail");
		return mav;
	}
	else{
	topic.setCommentsCount(0);
	System.out.println(topic);
	userService.save(u);
	mav.addObject("msg", "保存成功");
	mav.setViewName("web/all/success");
	return mav;
	}
}

@RequestMapping("/getTopicDetail")	
public ModelAndView getTopicDetail(HttpServletRequest request,HttpServletResponse response){
	ModelAndView mav=new ModelAndView();
	String id=request.getParameter("id");
	if(StringUtils.isNotBlank(id)){
		Topic topic=bbsService.findTopicById(id);
		if(topic!=null){
			topic.setCommentsCount(topic.getCommentsCount()+1);
			bbsService.save(topic);
			mav.addObject("topic", topic);
			mav.setViewName("web/all/bbs/topicDetails");
		}
		else{
			mav.addObject("msg", "找不到");
			mav.setViewName("web/all/fail");
		}
	}
	return mav;
}

@RequestMapping("/deleteTopic")	
public ModelAndView deleteTopic(HttpServletRequest request,HttpServletResponse response){
	ModelAndView mav=new ModelAndView();
	 Subject sub=SecurityUtils.getSubject();
	 if(!sub.isAuthenticated()){
		 mav.addObject("msg", "您还未登陆，请登录");
		 mav.setViewName("web/all/index");
		 return mav;
	 }
	String id=request.getParameter("id");
	String userId=request.getParameter("userId");
	if(StringUtils.isNotBlank(id)){
		Topic topic=bbsService.findTopicById(id);
		if(topic!=null){
			System.out.println(topic);
			if(StringUtils.isNotBlank(userId)){
			User u=userService.findUserById(userId);
			if(u!=null){
			u.getTopic().remove(topic);
			userService.save(u);
			bbsService.deleteTopic(topic);
			mav.addObject("topic", topic);
			mav.setViewName("redirect:/BBS/getAllTopic.do");
			return mav;
			}
		}}
	}
			mav.addObject("msg", "找不到");
			mav.setViewName("web/all/fail");
	return mav;
}
@RequestMapping("admin/topic/ajax/audit")
@ResponseBody
public AjaxResult ajaxTopicAudit(HttpServletRequest request){
	
	AjaxResult ajaxResult = new AjaxResult();
	ajaxResult.setSuccess(false);
	String id = request.getParameter("id");
	String auditFlag = request.getParameter("auditFlag");
	try {
		if(StringUtils.isNotBlank(id) ){
		if(StringUtils.isNotBlank(auditFlag) && auditFlag.equals("1")){
			    Topic topic=bbsService.findTopicById(id);
				topic.setIsAudit(1);
				this.bbsService.save(topic);
				ajaxResult.setSuccess(true);
				return ajaxResult;
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return ajaxResult;
}
@RequestMapping("admin/topic/ajax/Top")
@ResponseBody
public AjaxResult ajaxTopicTop(HttpServletRequest request){
	AjaxResult ajaxResult = new AjaxResult();
	ajaxResult.setSuccess(false);
	String id = request.getParameter("id");
	String auditFlag = request.getParameter("auditFlag");
	try {
		if(StringUtils.isNotBlank(id) ){
		if(StringUtils.isNotBlank(auditFlag) && auditFlag.equals("1")){
			    Topic topic=bbsService.findTopicById(id);
				topic.setIsTop(1);;
				this.bbsService.save(topic);
				ajaxResult.setSuccess(true);
				return ajaxResult;
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return ajaxResult;
}
/*
 * 评论控制器
 */
@RequestMapping("/addComment")	
public ModelAndView addComment(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
	try{
		 Subject sub=SecurityUtils.getSubject();
		 if(!sub.isAuthenticated()){
			 mav.addObject("msg", "您还未登陆，请登录");
			 mav.setViewName("web/all/index");
			 return mav;
		 }
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String content=request.getParameter("content");
	String publisher=request.getParameter("publisher");
	Comment comment=null;
	if(StringUtils.isNotBlank(id)){
		if(StringUtils.isBlank(content)){
			mav.addObject("comment", "评论不能为空");
			mav.addObject("id",id);
			mav.setViewName("web/all/bbs/comment/addComment");
			return mav;
		}
		Topic topic=bbsService.findTopicById(id);
		if(topic!=null){
			comment=new Comment();
			comment.setTopic(topic);
			comment.setContent(content);
			comment.setCreateDate(new Date());
			if(StringUtils.isNotBlank(publisher)){
				User u=userService.findUserBySno(publisher);
			if(u!=null){
			comment.setPublisher(u);
			if(u.getTopic().remove(topic)){
				topic.getComments().add(comment);	
			u.getTopic().add(topic);
			userService.save(u);
			}else{
				topic.getComments().add(comment);	
				bbsService.save(topic);
			}
			mav.setViewName("redirect:/BBS/getTopicDetail.do?id="+id);
				}
			}else{
				mav.addObject("msg", "您未登录，请先登录");
				mav.setViewName("redirect:/web_/normal/login.jsp");
			}
		}
	}else	
	mav.setViewName("web/all/bbs/comment/addComment");
	}catch(Exception e){
		e.printStackTrace();
	}
return mav;
}
@RequestMapping("/deleteComment")	
public ModelAndView deletetComment(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
	String id=request.getParameter("id");
	String userId=request.getParameter("userId");
	String topicId=request.getParameter("topicId");
	if(StringUtils.isNotBlank(id)){
		Comment comment=bbsService.findCommentById(id);
		if(comment!=null){
			if(StringUtils.isNotBlank(userId)&&StringUtils.isNotBlank(topicId)){
				User u=userService.findUserById(userId);
			   Topic topic=bbsService.findTopicById(topicId);
			       if(u!=null){
			    	   if(topic!=null){
			    		   if(u==topic.getPublisher()){
			    			   u.getTopic().remove(topic);
			    			   topic.getComments().remove(comment);
			   			       u.getTopic().add(topic);
			   		           userService.save(u);
			   		    	   bbsService.deleteComment(comment);
				    	   }else{
							    topic.getComments().remove(comment);
						    	bbsService.save(topic);
						    	bbsService.deleteComment(comment);
				    	   }
			    	   }
				mav.setViewName("redirect:/BBS/getTopicDetail.do?id="+topicId);
				return mav;
		}
			}
	     }
		}
		mav.setViewName("redirect:/BBS/getAllTopic.do?type=tongguo");
	return mav;
	}
}
