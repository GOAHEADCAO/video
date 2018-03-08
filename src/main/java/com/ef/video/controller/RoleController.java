package com.ef.video.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ef.video.entity.Resource;
import com.ef.video.entity.Role;
import com.ef.video.service.ResourceService;
import com.ef.video.service.RoleService;
@RequestMapping("/role")
@Controller
@RequiresRoles("admin")
public class RoleController {
	  @Autowired
      private RoleService roleService;
	  @Autowired
      private ResourceService resourceService;
	  @RequestMapping("/editResources")
	  public ModelAndView editResources(HttpServletRequest request){
		  try {
				request.setCharacterEncoding("utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		  	ModelAndView mav=new ModelAndView();
		  	String roleId=request.getParameter("roleId");
		  	System.out.println("roleid:"+roleId);
		  	Role role=roleService.findRoleById(roleId);
		  	if(role!=null){
		  		mav.addObject("role", role);
		  		Set <Resource> sets=role.getResources();
		  		mav.addObject("sets",sets);
		  		mav.setViewName("web/admin/roles/editResource");
		  	}else{
		  		mav.addObject("msg","你没有权限修改修改");
		  		mav.setViewName("web/all/fail");
		  	}
		  	return mav;
		  }
	  @RequestMapping("/addResources")
	  public ModelAndView addResources(HttpServletRequest request){
		  try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	  	ModelAndView mav=new ModelAndView();
	  	String roleId=request.getParameter("roleId");
	  	String res=request.getParameter("resources");
	  	Role role=roleService.findRoleById(roleId);
	  	
	  	if(role!=null){
	  		if(StringUtils.trim(res)!=null){
	  			String [] resAry=res.split(";");
	  			Set <Resource>sets =new HashSet<Resource>();
	  			Resource r;
	  			for(int i=0;i<resAry.length;i++){
	  				r=resourceService.findByUrl(resAry[i].trim());
	  				if(r!=null){
	  					r.setUpdateDate(new Date());
	  					sets.add(r);
	  				}else {
	  					r=new Resource();
	  					r.setUrl(resAry[i].trim());
	  					r.setName(resAry[i].substring(resAry[i].indexOf("\\")+1));
	  					r.setCreateDate(new Date());
	  					sets.add(r);
	  				}
	  				role.setResources(sets);
	  			}
	  			roleService.save(role);
	  		}
	  		mav.addObject("role", role);
	  		mav.addObject("msg", "权限修改成功\n"+role);
	  		mav.setViewName("web/all/success");
	  	}else{
	  		mav.addObject("msg","权限修改失败");
	  		mav.setViewName("web/all/fail");
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
  	String res=request.getParameter("resources");

	if(name!=null){
		Role role=roleService.findRoleByName(name.trim());
		if(role==null){
			role=new Role();
			role.setName(name);
			role.setCreateDate(new Date());
			roleService.save(role);
		System.out.println(role);
		if(StringUtils.trim(res)!=null){
  			String [] resAry=res.split(";");
  			Set <Resource>sets =new HashSet<Resource>();
  			Resource r;
  			for(int i=0;i<resAry.length;i++){
  				r=resourceService.findByUrl(resAry[i].trim());
  				System.out.println(resAry[i]);
  				if(r!=null){
  					r.setUpdateDate(new Date());
  					sets.add(r);
  					System.out.println(r);
  				}else {
  					r=new Resource();
  					r.setUrl(resAry[i].trim());
  					r.setName(resAry[i].substring(resAry[i].indexOf("\\")+1));
  					r.setCreateDate(new Date());
  					sets.add(r);
  				}
  			}
  			role.setResources(sets);	
  		}
		roleService.save(role);
	    mav.addObject("msg", "添加成功");
	    mav.setViewName("web/all/success");
	    return mav;
		}
	    }
	    mav.addObject("msg", "添加失败,角色已经存在，请重新添加");
		mav.setViewName("web/all/fail");
	return mav;
}
@RequestMapping("/detele")
public ModelAndView delete(HttpServletRequest request){
	ModelAndView mav=new ModelAndView();
	String roleId=request.getParameter("roleId");
	roleService.deleteById(roleId);
	mav.addObject("msg", "删除成功");
	mav.setViewName("web/all/success");
	return mav;
}

@RequestMapping("/query")
public ModelAndView query(){
	ModelAndView mav=new ModelAndView();
    List<Role> roles=roleService.queryAll();
    if(roles==null||roles.size()==0){
    	mav.setViewName("web/admin/users/main");
    	mav.addObject("msg", "没有角色");
    }
    else{
      System.out.println("roles:"+roles.size());
    	mav.addObject("count",roles.size());
    	mav.addObject("roles", roles);
    	mav.setViewName("web/admin/roles/main");
    }
	return mav;
}

}
