package com.study.start.project.service;

import java.util.List;
import java.util.Map;

import com.study.start.project.paging.Pagination;

public interface ProjectService {

	Map selectUser(Map<String, Object> map);

	List<Map> getlist(Map<String, Object> map);
	
	int nextSeq();
	
	int inserList(Map<String, Object> map);
	
	int insertHistory(Map map);
	
	List<Map> selectHistory(Map map);
	
	Pagination paging(Map<String, Object> params,int currentPage);
}
