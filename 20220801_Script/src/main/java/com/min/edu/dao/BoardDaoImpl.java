package com.min.edu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.edu.vo.BoardVo;

@Repository
public class BoardDaoImpl implements IBoardDao {

	@Autowired
	private SqlSession sqlSession; 
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public List<BoardVo> selectAll() {
		// TODO Auto-generated method stub
		logger.info("BoardDaoImmpl selectAll.....");
		
		return sqlSession.selectList("com.min.edu.dao.BoardDaoImpl.selectAll");
	}
}
