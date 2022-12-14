package com.ol.ex03.dao.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ol.ex03.dao.BoardDao;

@Repository("dao")
public class BoardDaoImpl implements BoardDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, Object>> list(Map<String, Object> map) {
		return sqlSession.selectList("mapper.list", map);
	}
	
	@Override
	public int write(Map<String, Object> map) {
		return sqlSession.insert("mapper.insertBoard", map);
	}
	
	@Override
	public Map<String, Object> detail(int seqNum) {
		return sqlSession.selectOne("mapper.selectBoardBySeq", seqNum);
	}
	
	@Override
	public int modify(Map<String, Object> map) {
		return sqlSession.insert("mapper.updateBoardBySeq", map);
	}
	

	@Override
	public int remove(int[] seq) {
		return sqlSession.delete("mapper.deleteBoardsBySeq", seq);
	}
	
	@Override
	public List<Map<String, Object>> search(Map<String, Object> map) {
		return sqlSession.selectList("mapper.selectBoardSearch", map);
	}
	
	@Override
	public long totalRecord() {
		return sqlSession.selectOne("mapper.selectTotalRecord");
	}
	
	@Override
	public long findCount(Map<String, Object> map) {
		return sqlSession.selectOne("mapper.selectFindCount", map);
	}
	
	@Override
	public int addFileAttaches(Map<String, Object> fileList) {
		return sqlSession.insert("mapper.insertAddFileAttachesBySeq", fileList);
	}
	
	@Override
	public List<Map<String, Object>> detailFileAttaches(int seqNum) {
		return sqlSession.selectList("mapper.selectFileAttachesBySeq", seqNum);
	}
	
	@Override
	public Map<String, Object> downloadFileAttachByNo(int fileSeq) {
		return sqlSession.selectOne("mapper.selectFileAttachBySeq", fileSeq);
	}
	
	// 마이플랫폼
	@Override
	public List<Map<String, Object>> miplatList() {
		return sqlSession.selectList("mapper.selectMiplatList");
	}
	
	@Override
	public List<Map<String, Object>> miplatSearch(Map<String, Object> map) {
		return sqlSession.selectList("mapper.selectMiplatSearch", map);
	}
	
}
