package com.ef.video.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ef.video.dao.ProfessionDao;
import com.ef.video.entity.Profession;

@Service
public class ProfessionService {
	@Autowired
	private ProfessionDao professionDao;
public Profession findById(String id){
	return professionDao.getOne(id);
}
}
