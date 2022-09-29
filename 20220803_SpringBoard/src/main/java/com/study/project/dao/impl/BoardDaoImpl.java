package com.study.project.dao.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.study.project.dao.BoardDao;
import com.study.project.vo.PageVo;

@Repository("dao")
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, Object>> list(Map<String, Object> map) {
		
//		System.out.println("SearchType : " + map.get("searchType"));
//		System.out.println("searchContent : " + map.get("searchContent"));
		
		System.out.println("BoardDaoImpl Map : " + map);
		
		return sqlSession.selectList("mapper.list", map);
	}

	@Override
	public int insertBoard(Map<String, Object> map) {
		
		System.out.println("BoardDaoImpl insertBoard" + map.toString());
		
		return sqlSession.insert("mapper.insertBoard", map);
	}

	@Override
	public List<Map<String, Object>> detailList(String seq) {
		return sqlSession.selectList("mapper.detail", seq);
	}

	@Override
	public int updateBoard(Map<String, Object> map) {
		System.out.println("BoardDaoImpl updateBoard" + map);
		return sqlSession.update("mapper.updateBoard", map);
	}
	
	@Override
	public void delete(String string) {
		sqlSession.delete("mapper.delete", string);
	}
	
	@Override
	public int totalCnt(PageVo vo) {
		System.out.println("Dao Vo : "+ vo.toString());
		return sqlSession.selectOne("mapper.totalCnt", vo);
	}
	
	@Override
	public void fileUpload(Map<String, Object> fileMap) {
		System.out.println("BoardDaoImpl fileMap : " + fileMap);
		sqlSession.insert("mapper.fileUpload", fileMap);
	}
	
	@Override
	public int selectSeq() {
		return sqlSession.selectOne("mapper.selectSeq");
	}
	
	@Override
	public List<Map<String, Object>> selectFile(String fileSeq) {
		return sqlSession.selectList("mapper.selectFile", fileSeq);
	}
}
