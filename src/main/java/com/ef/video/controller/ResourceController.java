package com.ef.video.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ef.video.entity.Resource;
import com.ef.video.service.ResourceService;

@Controller
@RequiresRoles("admin")
@RequestMapping("/resource")
public class ResourceController {
	@Autowired
	private ResourceService resourceService;
@RequestMapping("/query")
public ModelAndView query(){
	ModelAndView mav=new ModelAndView();
	List <Resource> resources=resourceService.findAll();
	if(resources!=null&&resources.size()>0){
		mav.setViewName("web/admin/resources/main");
		mav.addObject("resources", resources);
		mav.addObject("count", resources.size());
		mav.addObject("msg", "权限查询成功");
	}else{
	mav.addObject("msg", "权限查询失败");
	mav.setViewName("web/admin/users/main");
	}
	return mav;
}
@RequestMapping("/add")
public ModelAndView add(HttpServletRequest request){
	  try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	ModelAndView mav=new ModelAndView();
	String name=request.getParameter("name");
	String url=request.getParameter("url");
	if(name!=null&&url!=null){
	Resource resource=new Resource();
	resource.setName(name);
	resource.setUrl(url);
	resource.setUpdateDate(new Date());
	if(resourceService.add(resource)){
		mav.addObject("msg", "权限添加成功");
		mav.setViewName("web/all/success");
	}else{
		mav.addObject("msg", "权限添加失败");
	    mav.setViewName("web/all/fail");
	}
	}else{
		mav.setViewName("web/admin/resources/add");
	}
	return mav;
	}
@RequestMapping("/detele")
public ModelAndView detele(HttpServletRequest request){
	ModelAndView mav=new ModelAndView();
	String id=request.getParameter("resourceId");
	if(id!=null)
	if(resourceService.findResourceById(id)){
		mav.addObject("msg", "权限删除成功");
		mav.setViewName("web/all/success");
	}
	else{
		mav.addObject("msg", "权限删除失败");
	    mav.setViewName("web/all/fail");
	}
	return mav;
	}
}
