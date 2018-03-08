package com.ef.video.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ef.video.dao.ResourceDao;
import com.ef.video.entity.Resource;
@Service
public class ResourceService extends CommonService<Resource, String> {
	@Autowired
	private ResourceDao resourceDao;
	
public List <Resource>findAll(){
	return resourceDao.findAll();
}

public boolean add(Resource resource) {
	if(resourceDao.save(resource)!=null)
	return true;
	else 
		return false;
}

public boolean findResourceById(String id) {
	resourceDao.delete(id);
	return true;
}

public Resource findByUrl(String url) {
	Resource r=resourceDao.findResourceByUrl(url);
	if(r!=null){
		System.out.println( r+"===================================================");
		return r;
	}
	else
		return null;
}
}
