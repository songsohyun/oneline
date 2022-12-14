package com.ol.ex03.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.regex.Matcher;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ol.ex03.service.BoardService;
import com.ol.ex03.util.MyFileUtils;
import com.ol.ex03.util.PageUtils;
import com.tobesoft.platform.PlatformRequest;
import com.tobesoft.platform.PlatformResponse;
import com.tobesoft.platform.data.ColumnInfo;
import com.tobesoft.platform.data.Dataset;
import com.tobesoft.platform.data.DatasetList;
import com.tobesoft.platform.data.VariableList;

@Controller
public class BoardController {

	@Resource(name="service")
	private BoardService boardService;
	
	@RequestMapping("/")
	public String index() {
		return "redirect:/list";
	}
	
	@RequestMapping("list")
	public String list(HttpServletRequest request, Map<String, Object> map, Model model) {
		
		long totalRecord = boardService.totalRecord();
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));
		
		PageUtils pageUtils = new PageUtils();
		pageUtils.setPageEntity(totalRecord, page);
		
		map.put("beginRecord", pageUtils.getBeginRecord());
		map.put("endRecord", pageUtils.getEndRecord());
		
		List<Map<String, Object>> list = boardService.list(map);
		model.addAttribute("list", list);
		model.addAttribute("paging", pageUtils.getPagingOrigin(request.getContextPath() + "/list"));

		return "board/list";
	}
	
	@RequestMapping("writePage")
	public String writePage(Model model) {
		return "board/addDetailModify";
	}
	
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String write(MultipartHttpServletRequest multipartRequest, HttpServletResponse response, Model model) throws IOException {
		
		String writer = multipartRequest.getParameter("writer");
		String id = multipartRequest.getParameter("id");
		String title = multipartRequest.getParameter("title");
		String content = multipartRequest.getParameter("content");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memName", writer);
		map.put("memId", id);
		map.put("boardSubject", title);
		map.put("boardContent", content);
		
		// ????????? ????????????
		int res = boardService.write(map);

		// ?????? ?????? ??????
		List<MultipartFile> files = multipartRequest.getFiles("files");
		
		// ???????????? ???????????? ?????? ?????? ????????????
		if(res == 1) {
			
			for(MultipartFile multipartFile : files) {
				
				if(multipartFile.isEmpty() == false && files.isEmpty() == false) {
					
					// ??????????????? ?????? ??????
					String origin = multipartFile.getOriginalFilename();
					origin = origin.substring(origin.lastIndexOf("\\") + 1);
						
					// ??????????????? ????????? ??????
					String saved = MyFileUtils.getUuidName(origin);
					
					// ??????????????? ?????? ??????
					String sep = Matcher.quoteReplacement(File.separator);
					String path = "C:" + sep + "upload";
					
					// ?????? ??????(????????????) ????????? ?????????
					File dir = new File(path);
					if(dir.exists() == false) {
						dir.mkdirs();
					}
					
					// ????????????
					File file = new File(dir, saved);
					
					// ???????????? ?????????
					multipartFile.transferTo(file);
					
					// ???????????? ???????????? ????????? ?????????
					Map<String, Object> fileList = new HashMap<String, Object>();
					fileList.put("realName", origin);
					fileList.put("saveName", saved);
					fileList.put("savePath", path);
					fileList.put("listSeq", map.get("seq"));
					
					int res2 = boardService.addFileAttaches(fileList);		
							
				}
				
			}
			
		}

		model.addAttribute("addRes", res);
		return "board/result";		
	}
	
	
	@RequestMapping("detailPage")
	public String detailPage(String seq, Model model) {
		Optional<String> opt = Optional.ofNullable(seq);
		int seqNum = Integer.parseInt(opt.orElse("0"));
		
		// ????????? ??????
		Map<String, Object> map = boardService.detail(seqNum);
		
		// ???????????? ?????? ??????
		List<Map<String, Object>> map2 = boardService.detailFileAttaches(seqNum);
		
		model.addAttribute("listOne", map);
		model.addAttribute("fileList", map2);
		
		return "board/addDetailModify";
	}
	
	
	@RequestMapping("download")
	@ResponseBody
	public ResponseEntity<FileSystemResource> download(@RequestHeader("User-Agent") String userAgent, @RequestParam int fileSeq) {
		
		// ???????????? ?????? ??? ?????? ?????? ??????
		Map<String, Object> map = boardService.downloadFileAttachByNo(fileSeq);
		File file = new File((String)map.get("savePath"), (String)map.get("saveName"));
		
		// ????????? ?????????
		FileSystemResource resource = new FileSystemResource(file);
		
		// ???????????? ??? ????????? ????????? ??????
		if(resource.exists() == false) {
			return new ResponseEntity<FileSystemResource>(HttpStatus.NOT_FOUND);
		}
		
		// ???????????? ??????
		HttpHeaders headers = new HttpHeaders();
		
		// ???????????? ?????? ?????????(?????????????????? ????????? ??????)
		String origin = (String)map.get("realName");
		try {
			
			// IE(userAgent??? Trident??? ??????)
			if(userAgent.contains("Trident")) {
				origin = URLEncoder.encode(origin, "UTF-8").replaceAll("\\+", " ");
			}
			// Micro Edge(userAgent??? Edge??? ??????)
			else if(userAgent.contains("Edge")) {
				origin = URLEncoder.encode(origin, "UTF-8");
			}
			// ?????????(Chrome ???)
			else {
				origin = new String(origin.getBytes("UTF-8"), "ISO-8859-1");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		headers.add("Content-Disposition", "attachment; filename=" + origin);
		headers.add("Content-Length", file.length() + "");
		
		
		return new ResponseEntity<FileSystemResource>(resource, headers, HttpStatus.OK);
	}
	
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public String modify(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		String writer = request.getParameter("writer");
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seq", seq);
		map.put("memName", writer);
		map.put("memId", id);
		map.put("boardSubject", title);
		map.put("boardContent", content);
		
		int res = boardService.modify(map);
		model.addAttribute("modifyRes", res);
		return "board/result";

	}
	
	@RequestMapping(value="remove", method=RequestMethod.POST)
	public String remove(int[] ckOne, HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		int res = boardService.remove(ckOne);	
		model.addAttribute("removeRes", res);
		return "board/result";
		
	}
	
	@RequestMapping(value="search")
	public String search(HttpServletRequest request, Model model) {
		
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));
		
		String column = request.getParameter("column");
		String query = request.getParameter("query");
		String startDay = request.getParameter("startDay");
		String endDay = request.getParameter("endDay");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("column", column);
		map.put("query", query);
		map.put("startDay", startDay);
		map.put("endDay", endDay); 
		
		long findCount = boardService.findCount(map);
		
		PageUtils pageUtils = new PageUtils();
		pageUtils.setPageEntity(findCount, page);
		map.put("beginRecord", pageUtils.getBeginRecord());
		map.put("endRecord", pageUtils.getEndRecord());
		
		List<Map<String, Object>> list = boardService.search(map);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", pageUtils.getPagingOrigin(request.getContextPath() + "/search?column=" + column + "&query=" + query + "&startDay=" + startDay + "&endDay=" + endDay));
		model.addAttribute("column", column);
		model.addAttribute("query", query);
		model.addAttribute("startDay", startDay);
		model.addAttribute("endDay", endDay);
		
		return "board/list";
	}
	
	@RequestMapping("miplat")
	public void miplat(@RequestParam Map<String, Object> map, HttpServletResponse response, HttpServletRequest request) throws IOException {
	
		PlatformRequest pReq = new PlatformRequest(request, "UTF-8");
		pReq.receiveData();
		
		DatasetList searchDsl = pReq.getDatasetList();
		Dataset dSearch = searchDsl.getDataset("searchList");
		
		String searchType = dSearch.getColumnAsString(0, "searchType") == null ? "" : dSearch.getColumnAsString(0, "searchType");
		String searchTxt = dSearch.getColumnAsString(0, "keyword") == null ? "" : dSearch.getColumnAsString(0, "keyword");
		String startDate = dSearch.getColumnAsString(0, "startDate") == null ? "" : dSearch.getColumnAsString(0, "startDate");
		String endDate = dSearch.getColumnAsString(0, "endDate") == null ? "" : dSearch.getColumnAsString(0, "endDate");
	    
		/*
	    VariableList v1 = pReq.getVariableList();
	    String searchType = v1.getValueAsString("searchType");
	    String searchTxt = v1.getValueAsString("keyword");
	    String startDate = v1.getValueAsString("startDate");
	    String endDate = v1.getValueAsString("endDate");
	    */
		
	    map.put("column", searchType);
	    map.put("query", searchTxt);
	    map.put("startDay", startDate);
	    map.put("endDay", endDate);
	    		
		// List<Map<String, Object>> list = boardService.miplatList();
	    List<Map<String, Object>> list = boardService.miplatSearch(map);
		
		Dataset ds = new Dataset("boardList");
		ds.addColumn("seq", ColumnInfo.COLTYPE_INT, 256);
		ds.addColumn("name", ColumnInfo.COLTYPE_STRING, 256);
		ds.addColumn("id", ColumnInfo.COLTYPE_STRING, 256);
		ds.addColumn("title", ColumnInfo.COLTYPE_STRING, 256);
		ds.addColumn("content", ColumnInfo.COLTYPE_STRING, 256);
		ds.addColumn("regDate", ColumnInfo.COLTYPE_STRING, 256);
		ds.addColumn("uptDate", ColumnInfo.COLTYPE_STRING, 256);
		ds.addColumn("viewCnt", ColumnInfo.COLTYPE_STRING, 256);
		ds.addColumn("useYN", ColumnInfo.COLTYPE_STRING, 256);
		
		for(int i = 0; i < list.size(); i++) {
			int row = ds.appendRow();
			int seq = Integer.parseInt(list.get(i).get("seq").toString());
			ds.setColumn(row, "seq", seq);
			ds.setColumn(row, "name", list.get(i).get("memName").toString());
			ds.setColumn(row, "id", list.get(i).get("memId").toString());
			
			String title = list.get(i).get("boardSubject") == null ? "" : list.get(i).get("boardSubject").toString();
			ds.setColumn(row, "title", title);
			
			String content = list.get(i).get("boardContent") == null ? "" : list.get(i).get("boardContent").toString();
			ds.setColumn(row, "content", content);
			
			String regDate = list.get(i).get("regDate") == null ? "" : list.get(i).get("regDate").toString();
			ds.setColumn(row, "regDate", regDate);
			
			String uptDate = list.get(i).get("uptDate") == null ? "" : list.get(i).get("uptDate").toString();
			ds.setColumn(row, "uptDate", uptDate);
			
			String viewCnt = list.get(i).get("viewCnt") == null ? "" : list.get(i).get("viewCnt").toString();
			ds.setColumn(row, "viewCnt", viewCnt);
			
			String useYN = list.get(i).get("useYn") == null ? "" : list.get(i).get("useYn").toString();
			ds.setColumn(row, "useYN", useYN);
		
		}
		
		DatasetList dsl = new DatasetList();
		dsl.add(ds);
		VariableList v2 = new VariableList();
				
		PlatformResponse pRes = new PlatformResponse(response, PlatformRequest.JSP_XML, "UTF-8");
		pRes.sendData(v2, dsl);
		
		ds.setId("boardList");
		
	}
	

}
