package com.ef.video.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ef.video.dao.UserDao;
import com.ef.video.entity.User;

@Service
public class UserService {
	@Autowired
	private UserDao userDao;
public User findUserBySno(String sno){
	System.out.println("findUserBySno");
	return userDao.findUserBySno(sno);
}

public User findUserByEmail(String email){
	return userDao.findUserByEmail(email);
}
public User save(User user ){
	return userDao.save(user);
}
public User findUserByName(String username) {
	return userDao.findUserByName(username);
}
@Transactional
public boolean update(User user) {
	System.out.println("UserDao---------"+user.getPassword()+"----"+user.getSno());
   return userDao.update(user.getSno());	
}

public void delete(User u) {
	System.out.println("delete  u"+u);
	userDao.delete(u.getId());
	System.out.println("delete after "+u);
}
public void deleteUserById(String id) {
	userDao.delete(id);
}

public User findUserById(String id) {
	return userDao.findOne(id);
	
}

public List<User> findAll() {
	return userDao.findAll();
}
}
