package com.ef.video.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ef.video.dao.RoleDao;
import com.ef.video.entity.Role;
@Service
public class RoleService extends CommonService{
	
	@Autowired
	private RoleDao roleDao;
	
	public Role findRoleById(String id){
		Role role =roleDao.findOne(id);
		if(role!=null){
			System.out.println("roleService : findbyId "+role);
			return role; 
		}else {
			System.out.println("roleService : findbyId :角色不存在");
			return null;
		}
	}
public boolean save(Role role){
	roleDao.save(role);
	return true;
}
public boolean deleteById(String roleId){
	roleDao.delete(roleId);
	return true;
}
public boolean update(Role role){
	return false;
}
public List<Role> queryAll(){
	
	return roleDao.findAll();
}
public Role findRoleByName(String name) {
	Role role=roleDao.findRoleByName(name);
	if( role!=null)
		return role;
	return null;
}
}

