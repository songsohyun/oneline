package com.min.edu.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class LoginDaoImpl implements ILoginDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public Map<String, Object> login(Map<String, Object> map) {
		
		System.out.println("LoginDaoImpl login : " + map);
		
		Map<String, Object> rMap = sqlSession.selectOne("mapper.login", map);
			
		System.out.println("dao : " + rMap);
		
		return rMap;
	}
	
}
