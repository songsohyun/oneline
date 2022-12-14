package com.approval.sh1.dao.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.approval.sh1.dao.ApprovalDao;

@Repository("dao")
public class ApprovalDaoImpl implements ApprovalDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int findIdPw(Map<String, String> map) {
		return sqlSession.selectOne("mapper.selectFindIdPw", map);
	}
	
	@Override
	public int findId(String id) {
		return sqlSession.selectOne("mapper.selectFindId", id);
	}
	
	@Override
	public Map<String, Object> signInMemberInfo(Map<String, String> map) {
		return sqlSession.selectOne("mapper.selectSignInMemberInfo", map);
	}
	
	@Override
	public int listNo() {
		return sqlSession.selectOne("mapper.selectListNextNo");
	}
	
	@Override
	public int saveApproval(Map<String, Object> map) {
		return sqlSession.insert("mapper.insertSaveApproval", map);
	}
	
	@Override
	public int saveHistory(Map<String, Object> map) {
		return sqlSession.insert("mapper.insertSaveHistory", map);
	}
	
	@Override
	public List<Map<String, Object>> list(Map<String, Object> map) {
		return sqlSession.selectList("mapper.selectList", map);
	}
	
	@Override
	public Map<String, Object> detailApprByNo(int apprNo) {
		return sqlSession.selectOne("mapper.selectDetailApprByNo", apprNo);
	}

	@Override
	public int findApprNo(int apprNo) {
		return sqlSession.selectOne("mapper.selectFindApprNo", apprNo);
	}
	
	@Override
	public int modifyApprovalByNo(Map<String, Object> map) {
		return sqlSession.update("mapper.updateModifyApprovalByNo", map);
	}
	
	@Override
	public int cancelByNo(Map<String, Object> map) {
		return sqlSession.update("mapper.updateCancelByNo", map);
	}
	
	@Override
	public List<Map<String, Object>> detailHisByNo(int apprNo) {
		return sqlSession.selectList("mapper.selectDetailHisByNo", apprNo);
	}
	

	
	
	
	
	
	
	
	
	
	@Override
	public String changeApprIdToName(Map<String, Object> apprNoId) {
		return sqlSession.selectOne("mapper.selectChangeApprIdToName", apprNoId);
	}
	
	
	
}
