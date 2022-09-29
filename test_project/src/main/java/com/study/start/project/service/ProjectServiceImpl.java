package com.study.start.project.service;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.study.start.project.dao.ProjectDao;
import com.study.start.project.paging.Pagination;

@Service("projectService")
public class ProjectServiceImpl implements ProjectService{
	
	@Resource(name="projectDao")
	private ProjectDao projectDao;
	
	@Override
	public Map selectUser(Map<String, Object> map) {
		
		return projectDao.selectUser(map);
		
	}

	@Override
	public List<Map> getlist(Map<String, Object> map) {
		
		return projectDao.selectList(map);
		
	}
	
	@Override
	public int nextSeq() {
		
		return projectDao.nextSeq();
		
	}

	@Override
	public int inserList(Map<String, Object> map) {
		
		return projectDao.inserList(map);
	}

	@Override
	public int insertHistory(Map map) {
		
		return projectDao.insertHistory(map);
		
	}

	@Override
	public List<Map> selectHistory(Map map) {
		return projectDao.selectHistory(map);
	}

	@Override
	public Pagination paging(Map<String, Object> params, int currentPage) {
		
		int totalRecodes = projectDao.getTotalRecodes(params);
		
		Pagination pagination = new Pagination(totalRecodes, currentPage);
		pagination.initValues();
		
		return pagination;
	}
	
	

}
