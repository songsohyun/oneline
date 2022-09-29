package com.study.project.dao;

import java.util.List;
import java.util.Map;

import com.study.project.vo.PageVo;

public interface BoardDao {

	public List<Map<String, Object>> list(Map<String, Object> map);

	public int insertBoard(Map<String, Object> map);
	
	public List<Map<String, Object>> detailList(String seq);

	public int updateBoard(Map<String, Object> map);

	public void delete(String string);
	
	public int totalCnt(PageVo vo);
	
	public void fileUpload(Map<String, Object> fileMap);
	
	public int selectSeq();
	
	public List<Map<String, Object>> selectFile(String fileSeq);
}
