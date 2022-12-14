package com.ol.ex03.dao;

import java.util.List;
import java.util.Map;

public interface BoardDao {

	public List<Map<String, Object>> list(Map<String, Object> map);
	public int write(Map<String, Object> map);
	public Map<String, Object> detail(int seqNum);
	public int modify(Map<String, Object> map);
	public int remove(int[] seq);
	public List<Map<String, Object>> search(Map<String, Object> map);
	public int addFileAttaches(Map<String, Object> fileList);
	public List<Map<String, Object>> detailFileAttaches(int seqNum);
	public Map<String, Object> downloadFileAttachByNo(int fileSeq);
	public long totalRecord();
	public long findCount(Map<String, Object> map);
	
	// 마이플랫폼
	public List<Map<String, Object>> miplatList();
	public List<Map<String, Object>> miplatSearch(Map<String, Object> map);
	
}
