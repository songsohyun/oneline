package com.ol.ex03.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ol.ex03.dao.BoardDao;
import com.ol.ex03.service.BoardService;

@Service("service")
public class BoardServiceImpl implements BoardService{

	@Resource(name="dao")
	private BoardDao boardDao;
	
	@Override
	public List<Map<String, Object>> list(Map<String, Object> map) {
		return boardDao.list(map);
	}
	
	@Override
	public int write(Map<String, Object> map) {
		return boardDao.write(map);
	}
	
	@Override
	public Map<String, Object> detail(int seqNum) {
		return boardDao.detail(seqNum);
	}
	
	@Override
	public int modify(Map<String, Object> map) {
		return boardDao.modify(map);
	}
	
	@Override
	public int remove(int[] seq) {
		return boardDao.remove(seq);
	}
	
	@Override
	public List<Map<String, Object>> search(Map<String, Object> map) {
		return boardDao.search(map);
	}
	
	@Override
	public long totalRecord() {
		return boardDao.totalRecord();
	}
	
	@Override
	public long findCount(Map<String, Object> map) {
		return boardDao.findCount(map);
	}
	
	@Override
	public int addFileAttaches(Map<String, Object> fileList) {
		return boardDao.addFileAttaches(fileList);
	}
	
	@Override
	public List<Map<String, Object>> detailFileAttaches(int seqNum) {
		return boardDao.detailFileAttaches(seqNum);
	}
	
	@Override
	public Map<String, Object> downloadFileAttachByNo(int fileSeq) {
		return boardDao.downloadFileAttachByNo(fileSeq);
	}
	
	// 마이플랫폼
	@Override
	public List<Map<String, Object>> miplatList() {
		return boardDao.miplatList();
	}
	
	@Override
	public List<Map<String, Object>> miplatSearch(Map<String, Object> map) {
		return boardDao.miplatSearch(map);
	}
	

}
