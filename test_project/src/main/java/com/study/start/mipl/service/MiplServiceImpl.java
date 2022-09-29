package com.study.start.mipl.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.start.mipl.dao.MiplDao;

@Service("miplService")
public class MiplServiceImpl implements MiplService{
	
	@Autowired
	MiplDao miplDao;

	@Override
	public List<Map<String, Object>> selectList() {
		return miplDao.selectList();
	}

}
