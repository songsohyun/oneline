package com.study.start.dao;

import java.util.List;
import java.util.Map;

import com.study.start.model.BoardVO;

public interface BoardDAO {
	List<BoardVO> selectBoardList();

	int write(BoardVO boardVo);

	int delete(List<Integer> check);
	
	List<BoardVO> searchBoardList(Map map);

	Map paging();

	int totalCount(Map map);
}
