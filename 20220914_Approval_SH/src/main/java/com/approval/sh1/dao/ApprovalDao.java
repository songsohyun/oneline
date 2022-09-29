package com.approval.sh1.dao;

import java.util.List;
import java.util.Map;

public interface ApprovalDao {
	public int findIdPw(Map<String, String> map);
	public int findId(String id);
	public Map<String, Object> signInMemberInfo(Map<String, String> map);
	public int listNo();
	public int saveApproval(Map<String, Object> map);
	public int saveHistory(Map<String, Object> map);
	public List<Map<String, Object>> list(Map<String, Object> map);
	public Map<String, Object> detailApprByNo(int apprNo);
	public int findApprNo(int apprNo);
	public int modifyApprovalByNo(Map<String, Object> map);
	public int cancelByNo(Map<String, Object> map);
	public List<Map<String, Object>> detailHisByNo(int apprNo);
	
	
	
	public String changeApprIdToName(Map<String, Object> apprNoId);
}
