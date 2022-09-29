package com.study.start.mipl.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.start.mipl.service.MiplService;
import com.tobesoft.platform.PlatformRequest;
import com.tobesoft.platform.PlatformResponse;
import com.tobesoft.platform.data.ColumnInfo;
import com.tobesoft.platform.data.Dataset;
import com.tobesoft.platform.data.DatasetList;
import com.tobesoft.platform.data.VariableList;

@Controller
public class MiplController {
	
	@Resource(name="miplService")
	MiplService miplService;
	
	@RequestMapping("/dataList")
	public void dataList(HttpServletResponse response) throws IOException{
		
		System.out.println("svn 업데이트 확인");
		
		List<Map<String, Object>> list = miplService.selectList();
		
		Dataset ds = new Dataset("java_board");
		
		ds.addColumn("seq", ColumnInfo.COLUMN_TYPE_STRING, 250);
		ds.addColumn("mem_id", ColumnInfo.COLUMN_TYPE_STRING, 250);
		ds.addColumn("mem_name", ColumnInfo.COLUMN_TYPE_STRING, 250);
		ds.addColumn("board_subject", ColumnInfo.COLUMN_TYPE_STRING, 250);
		ds.addColumn("board_content", ColumnInfo.COLUMN_TYPE_STRING, 250);
		ds.addColumn("reg_date", ColumnInfo.COLUMN_TYPE_STRING, 250);
		ds.addColumn("upt_date", ColumnInfo.COLUMN_TYPE_STRING, 250);
		ds.addColumn("view_cnt", ColumnInfo.COLUMN_TYPE_STRING, 250);
		
		for(Map<String, Object> map : list){
			int row = ds.appendRow();
			ds.setColumn(row, "seq", map.get("SEQ").toString());
			ds.setColumn(row, "mem_id", map.get("MEM_ID").toString());
			ds.setColumn(row, "mem_name", map.get("MEM_NAME").toString());
			ds.setColumn(row, "board_subject", map.get("BOARD_SUBJECT").toString());
			ds.setColumn(row, "board_content", map.get("BOARD_CONTENT").toString());
			ds.setColumn(row, "reg_date", map.get("REG_DATE").toString());
			ds.setColumn(row, "upt_date", map.get("UPT_DATE").toString());
			ds.setColumn(row, "view_cnt", map.get("VIEW_CNT").toString());
		}
		
		VariableList vl = new VariableList();
		DatasetList dl = new DatasetList();
		
		dl.addDataset(ds);
		PlatformResponse pRes = new PlatformResponse(response, PlatformRequest.JSP_XML, "UTF-8");
		pRes.sendData(vl, dl);
		
	}
	
}
