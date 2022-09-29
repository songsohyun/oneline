package com.approval.sh1.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.approval.sh1.dao.ApprovalDao;
import com.approval.sh1.service.ApprovalService;

@Service("service")
public class ApprovalServiceImpl implements ApprovalService {

	@Resource(name="dao")
	private ApprovalDao approvalDao;
	
	@Override
	public int findIdPw(Map<String, String> map) {
		return approvalDao.findIdPw(map);
	}	
	
	@Override
	public int findId(String id) {
		return approvalDao.findId(id);
	}

	@Override
	public Map<String, Object> signInMemberInfo(Map<String, String> map) {
		return approvalDao.signInMemberInfo(map);
	}
	
	@Override
	public int listNo() {
		return approvalDao.listNo();
	}
	
	@Override
	public int saveApproval(Map<String, Object> map) {
		return approvalDao.saveApproval(map);
	}
	
	@Override
	public int saveHistory(Map<String, Object> map) {
		return approvalDao.saveHistory(map);
	}
	
	@Override
	public List<Map<String, Object>> list(Map<String, Object> map) {
		return approvalDao.list(map);
	}
	
	@Override
	public Map<String, Object> detailApprByNo(int apprNo) {
		return approvalDao.detailApprByNo(apprNo);
	}
	
	@Override
	public int findApprNo(int apprNo) {
		return approvalDao.findApprNo(apprNo);
	}
	
	@Override
	public int modifyApprovalByNo(Map<String, Object> map) {
		return approvalDao.modifyApprovalByNo(map);
	}
	
	@Override
	public int cancelByNo(Map<String, Object> map) {
		return approvalDao.cancelByNo(map);
	}
	
	@Override
	public List<Map<String, Object>> detailHisByNo(int apprNo) {
		return approvalDao.detailHisByNo(apprNo);
	}
	

	
	
	
	
	
	
	
	
	
	
	@Override
	public String changeApprIdToName(Map<String, Object> apprNoId) {
		return approvalDao.changeApprIdToName(apprNoId);
	}
	
	
	
}
