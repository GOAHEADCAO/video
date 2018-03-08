package com.ef.video.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.ef.video.entity.User;
import com.ef.video.service.UserService;
import com.ef.video.util.MD5Util;

@Controller
@SessionAttributes
@RequestMapping("/login")
public class LoginController {
	@Autowired
	private UserService userService;
	//管理员登录
@RequestMapping(value="/login1")
public String login1(HttpServletRequest request,Model model){
	String sno=request.getParameter("sno");
	String password=request.getParameter("password");
	String remember=request.getParameter("rememberMe");
	boolean rememberMe = false;
	if(StringUtils.isNotBlank(remember)){
		rememberMe=true;
	}
		System.out.println("管理员登录");
		String md5Pwd = MD5Util.generatePassword(password);	
		try {
			UsernamePasswordToken token = new UsernamePasswordToken(sno, md5Pwd, rememberMe);
			Subject subject = SecurityUtils.getSubject();
			if(subject.isRemembered()){
				System.out.println("--------remember--------");
			}else{
				System.out.println("-------not remember-------");
			}
			if(userService.findUserBySno(sno).getRole().getName().equals("admin")){
					subject.login(token);
			return "web/admin/users/main";
			}else {
				model.addAttribute("msg", "您不是管理员");
				return "web/all/fail";
			}
		} catch (LockedAccountException lae) {
		    System.out.println("账号已被禁用");
			model.addAttribute("msg", "账号已被禁用");
		} catch (AuthenticationException ae) {
			System.out.println("账号或密码错误");
			model.addAttribute("msg", "账号或密码错误");
		} catch (Exception e) {
			System.out.println("登录异常"+e.getMessage());
			model.addAttribute("msg", "登录异常");
		}
		return "web/all/fail";
}
	@RequestMapping("/logout")
	public ModelAndView logout(){
		ModelAndView mav=new ModelAndView();
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		mav.setViewName("web/all/index");
		mav.addObject("msg", "退出登录");
		mav.addObject("user", null);
		return mav;
		
	}
	//普通用户登录
	@RequestMapping(value="/login")
	public String login(HttpServletRequest request,Model model){
		String sno=request.getParameter("sno");
		String password=request.getParameter("password");
		String remember=request.getParameter("rememberMe");
		boolean rememberMe = false;
		if(StringUtils.isNotBlank(remember)){
			rememberMe=true;
			
		}
		String md5Pwd = MD5Util.generatePassword(password);	
		try {
			UsernamePasswordToken token = new UsernamePasswordToken(sno, md5Pwd, rememberMe);
			Subject subject = SecurityUtils.getSubject();
			if(subject.isRemembered()){
				System.out.println("--------remember--------");
			}else{
				System.out.println("-------not remember-------");
			}
			subject.login(token);
			return "web/normal/index";
		} catch (LockedAccountException lae) {
		    System.out.println("账号已被禁用");
			model.addAttribute("msg", "账号已被禁用");
		} catch (AuthenticationException ae) {
			System.out.println("账号或密码错误");
			model.addAttribute("msg", "账号或密码错误");
		} catch (Exception e) {
			System.out.println("登录异常"+e.getMessage());
			model.addAttribute("msg", "登录异常");
		}
		return "web/all/fail";
}

}
