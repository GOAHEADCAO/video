package com.ef.video.dao;

import java.util.List;
import java.util.Map;

import com.ef.video.dto.TopicDto;
import com.ef.video.entity.Page;
import com.ef.video.entity.Topic;

public interface TopicDaoCustom {
	 Page<Topic> queryTopicPage(TopicDto topic);

	    List<Topic> queryTopicList(TopicDto topic);

	    List<Map<String, Object>> queryStatisMapList(TopicDto topic);
	    
	    List<Topic> queryNextTopicList(TopicDto topic);
	    
	    List<Topic> queryPreTopicList(TopicDto topic);

}
