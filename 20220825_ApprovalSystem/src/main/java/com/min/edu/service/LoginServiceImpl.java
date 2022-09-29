package com.min.edu.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.edu.dao.ILoginDao;

@Service
public class LoginServiceImpl implements ILoginService {

	@Autowired
	private ILoginDao dao;
	
	@Override
	public Map<String, Object> login(Map<String, Object> map) {
		System.out.println("LoginServiceImpl login : " + map);
		
		Map<String, Object> rMap = dao.login(map);
		
		System.out.println("service : " + rMap);
		
		return rMap;
	}
	
}
