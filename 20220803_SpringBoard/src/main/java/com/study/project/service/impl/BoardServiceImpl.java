package com.study.project.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.project.dao.BoardDao;
import com.study.project.service.BoardService;
import com.study.project.vo.PageVo;

@Service("service")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;
	
	@Override
	public List<Map<String, Object>> list(Map<String, Object> map) {

//		System.out.println("SearchType : " + map.get("searchType"));
//		System.out.println("searchContent : " + map.get("searchContent"));
		
		
//		String startDate = (String)map.get("startDate");
//		String endDate = (String)map.get("endDate");
		
//		map.put("startDate", startDate.replace("-", ""));
//		map.put("endDate", endDate.replace("-", ""));
		
		System.out.println("BoardServiceImpl Map : " + map);
		return boardDao.list(map);
	}

	@Override
	public int insertBoard(Map<String, Object> map) {
		
		System.out.println("BoardServiceImpl insertBoard " + map.toString());
		
		return boardDao.insertBoard(map);
	}

	@Override
	public List<Map<String, Object>> detailList(String seq) {
		return boardDao.detailList(seq);
	}

	@Override
	public int updateBoard(Map<String, Object> map) {
		System.out.println("BoardServiceImpl updateBoard" + map);
		return boardDao.updateBoard(map);
	}

	@Override
	public void delete(String string) {
		boardDao.delete(string);
	}
	
	@Override
	public int totalCnt(PageVo vo) {
		System.out.println("Service Vo : " + vo.toString());
		return boardDao.totalCnt(vo);
	}
	
	@Override
	public void fileUpload(Map<String, Object> fileMap) {
		System.out.println("BoardServiceImpl fileMap : " + fileMap);
		boardDao.fileUpload(fileMap);
	}
	
	@Override
	public int selectSeq() {
		return boardDao.selectSeq();
	}
	
	@Override
	public List<Map<String, Object>> selectFile(String fileSeq) {
		return boardDao.selectFile(fileSeq);
	}

}
