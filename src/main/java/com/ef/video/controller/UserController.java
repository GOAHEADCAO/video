package com.ef.video.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ef.video.entity.Profession;
import com.ef.video.entity.Role;
import com.ef.video.entity.User;
import com.ef.video.service.ProfessionService;
import com.ef.video.service.RoleService;
import com.ef.video.service.UserService;
import com.ef.video.util.MD5Util;
import com.ef.video.util.MailUtil;
import com.ef.video.util.MapUtil;
import com.ef.video.util.ValidateUtil;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private ProfessionService professionService;
	@RequestMapping("/userDetails")
	public ModelAndView  userDetails(HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("web/all/userDetails");
		return mav;
	}
	//@RequiresRoles("admin")
	@RequestMapping("/addRole")
	public ModelAndView addRole(HttpServletRequest request) throws UnsupportedEncodingException{
		request.setCharacterEncoding("UTF-8");
		ModelAndView mav=new ModelAndView();
	    String id=request.getParameter("userId");
	    String roleId=request.getParameter("role");
	    User user=userService.findUserById(id);
	    List <Role>roles=roleService.queryAll();
	    
	    if(user!=null){
	    	Role role=user.getRole();
	    	List<User>users=new ArrayList<User>();
	    	users.add(user);
	    	if(roles!=null&&roles.size()>0){
	    		if(roleId!=null){
		    		for (Role r : roles) {
					if(r.getId().equals(roleId)){
						
						role.setId(roleId);
						user.setRole(role);
						userService.deleteUserById(user.getId());
						userService.save(user);
					}	
		    		}
		    	}
	    		mav.addObject("users", users);
	    		mav.addObject("role", role);
	    		mav.addObject("roles", roles);
	    		mav.setViewName("web/admin/users/list");
	    	}
	    }else {
	    	mav.setViewName("web/admin/users/main");
	    }
		return mav;
	}
	@RequiresRoles("admin")
	@RequestMapping("/query")
	public ModelAndView query(){
		ModelAndView mav=new ModelAndView();
		List<User> users=userService.findAll();
		if(users!=null&&users.size()>0){
		mav.addObject("users", users);
		mav.setViewName("web/admin/users/list");
		mav.addObject("count", users.size());
		System.out.println("用户查询");
		}
		else{
			System.out.println("用户查询失败");
			mav.addObject("msg", "用户查询失败");
			mav.setViewName("web/admin/users/main");	
		}
		return mav;
	}	
	@RequiresRoles("admin")
	@RequestMapping("/detele")
    public ModelAndView detele(HttpServletRequest request){
    	ModelAndView mav=new ModelAndView();
    	String id=request.getParameter("id");
    	if(StringUtils.isNotBlank(id)){
    		User user=userService.findUserById(id);
    		System.out.println(user);
    		if(user!=null){
        		System.out.println(user);

    			userService.deleteUserById(user.getId());
    			mav.addObject("msg", "删除成功");
    			mav.setViewName("web/admin/users/main");
    			return mav;
    		}
    	}
    	mav.setViewName("web/all/fail");
    	mav.addObject("msg", "删除失败");
    	return mav;
    }

    @RequestMapping("/findByEmail")
	public String findByEmail(HttpServletRequest request, Model model) {
		String email = request.getParameter("email");
		User user = userService.findUserByEmail(email);
		model.addAttribute("user", user);
		return "web/admin/users/login";
	}


	@RequestMapping("/save")
	public String save(HttpServletRequest request, Model model) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// String username=request.getParameter("username");
		String password = MD5Util.generatePassword(request.getParameter("password"));
		// String professionId =request.getParameter("profession");
		String sno = request.getParameter("sno");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		Profession profession = professionService.findById("1");
		User user = new User();
		user.setSno(sno);
		// 设置默认专业 用户名
		user.setProfession(profession);
		user.setUsername(sno);
		user.setScore(100);
		user.setPassword(password);
		user.setEmail(email);
	    Role role=new Role();
		role.setId("8a85df8e5e8ef0a2015e8f0473e30001");
			System.out.println(role);
		user.setRole(role);
		user.setGender(gender);
		user.setCreateDate(new Date());
		if (userService.findUserBySno(sno) != null) {
			model.addAttribute("msg", "用户已经存在");
			return "web/all/register";
		}
		String text = "您好，您正在注册EF！！";
		if (userService.save(user) != null) {
			HashMap<String, User> map = MapUtil.getInstence().getMap();
			String serial = ValidateUtil.number();
			map.put(serial, user);
			MailUtil.sendemail(user.getEmail(), text, serial);
			if (userService.findUserBySno(user.getSno()) != null) {
				model.addAttribute("msg", "注册成功");
				return "web/all/index";
			}

		}
		model.addAttribute("msg", "注册失败,请重新注册");
		return "web/all/register";
}

	@RequestMapping("/modify")
	public ModelAndView modify(@RequestParam String sno, @RequestParam String email) {
		User user = userService.findUserBySno(sno);
		ModelAndView mav = new ModelAndView();
		if (user != null) {
			if (!email.equals(user.getEmail())) {
				mav.addObject("msg", "用户名与邮箱不匹配！");
				mav.setViewName("users/forget");
				return mav;
			}
			HashMap<String, User> map = MapUtil.getInstence().getMap();
			String serial = ValidateUtil.number();
			map.put(serial, user);
			MailUtil.sendemail(email, "修改", serial);
			mav.addObject("msg", "已发送验证到你的邮箱");
			mav.addObject("user", user);
			mav.addObject("serial", serial);
			mav.addObject("user", user);
			mav.setViewName("web/all/modify");
		} else {
			mav.addObject("msg", "用户名不存在，请重新输入");
			mav.setViewName("web/all/forget");
		}
		return mav;
	}


	@RequestMapping("/update")
	public String update(@RequestParam String sno, @RequestParam String password, @RequestParam String serial) {
		
		User user = userService.findUserBySno(sno);
		HashMap<String, User> map = MapUtil.getInstence().getMap();
	    userService.delete(user);
		user.setPassword(MD5Util.generatePassword(password));
		user.setStatus(0);
		userService.save(user);
		map.put(serial, user);
		return "web/all/index";

	}

	@RequestMapping("/validator")
	public String reply(@RequestParam("serial") String serial) {
		User user = validate(serial);
		HashMap<String, User> map = MapUtil.getInstence().getMap();
        
		if (user != null) {
			MailUtil.sendemail(user.getEmail(), "注册成功", serial);
			User u = userService.findUserBySno(user.getSno());
			if(u != null) {
				userService.delete(u);
			}
			if (userService.findUserBySno(user.getSno()) == null) {
				u.setStatus(1);
				userService.save(u);
				map.remove(serial);
				return "web/all/index";
			}
		}
		return "web/all/fail";
	}

	private User validate(String serial) {
		User user = null;
		HashMap<String, User> map = MapUtil.getInstence().getMap();
		if (map.keySet().contains(serial)) {
			user = map.get(serial);
		}
		return user;

	}


}
