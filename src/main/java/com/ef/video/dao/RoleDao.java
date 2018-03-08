package com.ef.video.dao;

import org.springframework.data.jpa.repository.Query;

import com.ef.video.entity.Role;

public interface RoleDao extends CommonDao<Role,String>{
    @Query("select r from Role r where r.name=?1")
	public Role findRoleByName(String name);


}
