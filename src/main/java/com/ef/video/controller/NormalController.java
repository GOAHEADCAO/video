package com.ef.video.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ef.video.entity.User;
import com.ef.video.service.ProfessionService;
import com.ef.video.service.RoleService;
import com.ef.video.service.UserService;

@Controller
@RequestMapping("/normal")
public class NormalController {
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private ProfessionService professionService;
	@RequestMapping("/user/main")
	public ModelAndView main_video(HttpServletRequest request){
		
		String sno=request.getParameter("sno");
		User u=(User) request.getSession().getAttribute("user");
		ModelAndView mav=new ModelAndView();
		Subject subject=SecurityUtils.getSubject();
		if(!subject.isAuthenticated()){
			mav.addObject("msg", "请先登录");
			mav.setViewName("web/all/fail");
			return mav;
		}
		if(u==null){
			mav.addObject("msg", "请先登录");
			mav.setViewName("web/all/fail");
			return mav;
		}
		else{
			System.out.println(u);
		User user=userService.findUserBySno(sno);
		if(user!=null){
			System.out.println(user);
			if(!u.equals(user)){
				System.out.println(user.hashCode()+" u: "+u.hashCode());
				mav.addObject("msg", "你不是当前用户");
				mav.setViewName("web/all/fail");
				return mav;
			}
			Integer score=user.getScore();
		if(score>=0){
			user.setScore(score-50);
			userService.save(user);
			mav.setViewName("web/normal/video/main");
			return mav;
		}else {
			mav.addObject("msg", "积分不足，无法观看");
			mav.setViewName("web/normal/video/recharge");
			return mav;
		}
		}else{
			mav.addObject("msg", "用户不存在");
			mav.setViewName("web/all/fail");
			return mav;
		}
		}
		
	}
}
