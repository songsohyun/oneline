package com.study.start.project.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("projectDao")
public interface ProjectDao {

	Map selectUser(Map<String, Object> map);
	List<Map> selectList(Map map);
	int nextSeq();
	int inserList(Map<String, Object> map);
	int insertHistory(Map map);
	List<Map> selectHistory(Map map);
	int getTotalRecodes(Map<String, Object> map);
}
