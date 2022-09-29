package com.min.edu.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.edu.dao.IBoardDao;
import com.min.edu.vo.BoardVo;

@Service
public class BoardServiceImpl implements IBoardService {

	@Autowired
	private IBoardDao dao;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public List<BoardVo> selectAll() {
		logger.info("BoardServiceImmpl selectAll.....");
		
		return dao.selectAll();
	}
}
