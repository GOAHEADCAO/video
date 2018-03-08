package com.ef.video.util;

import java.util.HashMap;

import com.ef.video.entity.User;

public class MapUtil {
   private static HashMap<String,User> map=new HashMap<String,User>();
   /**
 * @return the map
 */
public HashMap<String, User> getMap() {
	return map;
}
/**
 * @param map the map to set
 */
public void setMap(HashMap<String, User> map) {
	MapUtil.map = map;
}
private MapUtil(){}
   private static MapUtil mapManager=null;
   public  static MapUtil getInstence()
   {
	   if(mapManager==null)
		   synchronized (MapUtil.class) {
			if(mapManager==null)
				mapManager=new MapUtil();
		}
	   return mapManager;
   }
}

