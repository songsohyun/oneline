package com.study.start.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.study.start.dao.BoardDAO;
import com.study.start.model.BoardVO;
import com.study.start.model.Paging;

@Service("boardService")
public class BoardServiceImple implements BoardService{
	
	@Autowired
	private BoardDAO boardMapper;
	
	@Override
	@Transactional
	public List selectBoardList() {
		return boardMapper.selectBoardList();
	}

	@Override                                                                                                                              
	public int writeService(BoardVO boardVo) {
		
		Date today= new Date();
		boardVo.setREG_DATE(today);
		
		int cnt = boardMapper.write(boardVo);
		return cnt;
		
	}

	@Override
	public int delete(List<Integer> check) {
		return boardMapper.delete(check);
	}

	@Override
	public List search(Map map) {
		return boardMapper.searchBoardList(map);
	}
	
	@Override
	public Paging paging(Map<String, String> map){
		int currentPage = 1;
		
		if(map.containsKey("currentPage")){
			currentPage = Integer.parseInt(map.get("currentPage"));
		}
		
		int totalRecodes = boardMapper.totalCount(map);
		
		Paging paging = new Paging(totalRecodes, currentPage);
		paging.initValues();
		return paging;
		
	}

}
