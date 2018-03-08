package com.ef.video.dao;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import com.ef.video.entity.User;

public interface UserDao extends CommonDao<User,String> {
	@Query("select u from User u where u.sno=?1")
    public User findUserBySno(String sno);
	@Query("select u from User u where u.email=?1")
	public User findUserByEmail(String email);
	@Query("select u from User u where u.username=?1")
	public User findUserByName(String username);
	@Modifying
	@Query("update User u set u.status=0 where u.sno=?1")
	public boolean update(String sno);
}
