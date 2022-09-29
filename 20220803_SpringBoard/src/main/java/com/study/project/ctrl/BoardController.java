package com.study.project.ctrl;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.study.project.service.BoardService;
import com.study.project.vo.PageVo;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "list")
	public String list(@RequestParam Map<String, Object> map, Model model, PageVo vo
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		 
		 System.out.println("SearchType : " + map.get("searchType"));
		 System.out.println("searchContent : " + map.get("searchContent"));
		 		 
		 List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		 
		 if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "10";
			}
		 
		 vo = new PageVo();
		 vo.setSearchType((String)map.get("searchType"));
		 vo.setSearchContent(((String)map.get("searchContent")));
		 vo.setStartDate(((String)map.get("startDate")));
		 vo.setEndDate(((String)map.get("endDate")));
		 int total = boardService.totalCnt(vo);
		 vo = new PageVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		 vo.setSearchType((String)map.get("searchType"));
		 vo.setSearchContent(((String)map.get("searchContent")));
		 vo.setStartDate(((String)map.get("startDate")));
		 vo.setEndDate(((String)map.get("endDate")));
		 
		 System.out.println("------------------------------------------------------------");
		 
		 
		 System.out.println("=============================================================");
		 
		 
		 System.out.println("Total : " + vo.getTotal());
			
		 map.put("start", vo.getStart());
		 map.put("end", vo.getEnd());
		 
		 System.out.println(map);
		 
		 list = boardService.list(map);
		 
		 System.out.println("::::::::::::: " + list);
		 
		 
		 System.out.println("Vo : " + vo.toString());
		 model.addAttribute("list", list);
		 model.addAttribute("searchMap", map);
		 model.addAttribute("paging", vo);
		 
		 return "board/list";
	 }
	
//	@RequestMapping(value = "getBoardList", method = RequestMethod.POST)
//    @ResponseBody
//    public List<Map<String, Object>> getBoardList(HttpServletRequest request, HttpServletResponse response,
//    		@RequestParam Map<String, Object> map, 
//    		@RequestParam(value="nowPage", required=false)String nowPage
//          , @RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception {
//		
//		if (nowPage == null && cntPerPage == null) {
//			nowPage = "1";
//			cntPerPage = "10";
//		} else if (nowPage == null) {
//			nowPage = "1";
//		} else if (cntPerPage == null) { 
//			cntPerPage = "10";
//		}
//		
//		System.out.println("11111111111111111111111111111111111111");
//		
//		System.out.println(map);
//		
//		PageVo vo = new PageVo();
//		int iNowPage = Integer.parseInt((String)map.get("nowPage"));
//		int iCntPerPage = Integer.parseInt(cntPerPage);
//		
//		System.out.println(nowPage + "/" + cntPerPage);
//		
//		vo.calcStartEnd(iNowPage, iCntPerPage);
//		
//		System.out.println("22222222222222222222222222222222222222");
//		
//		map.put("start", vo.getStart());
//		map.put("end", vo.getEnd());
//		
//		System.out.println("Before Ajax...");
//		System.out.println("Ajax map : " + map);
//        List<Map<String, Object>> boardDtoList = boardService.list(map);
//
//        System.out.println("After Ajax...");
//        
//        System.out.println("Ajax Value : " + boardDtoList);
//        
//        return boardDtoList;
//    }
	
	@RequestMapping(value = "getBoardList", method = RequestMethod.POST)
	public String getBoardList(@RequestParam Map<String, Object> map, Model model, PageVo vo
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		
		 vo = new PageVo();
		 vo.setSearchType((String)map.get("searchType"));
		 vo.setSearchContent(((String)map.get("searchContent")));
		 vo.setStartDate(((String)map.get("startDate")));
		 vo.setEndDate(((String)map.get("endDate")));
		 int total = boardService.totalCnt(vo);
		 vo = new PageVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		 vo.setSearchType((String)map.get("searchType"));
		 vo.setSearchContent(((String)map.get("searchContent")));
		 vo.setStartDate(((String)map.get("startDate")));
		 vo.setEndDate(((String)map.get("endDate")));
		 
		 map.put("start", vo.getStart());
		 map.put("end", vo.getEnd());
		 
		 System.out.println(map);
		 
		 list = boardService.list(map);
		 
		 System.out.println("::::::::::::: " + list);
		 
		 
		 System.out.println("Vo : " + vo.toString());
		 model.addAttribute("list", list);
		 model.addAttribute("searchMap", map);
		 model.addAttribute("paging", vo);
		
		return "board/resultList";
	}
	 
	 @RequestMapping(value = "insert")
	 public String insert() {
		 
		 return "board/insert";
	 }
	 
	 @RequestMapping(value = "insertBoard", method = RequestMethod.POST)
	 public String insertBoard(@RequestParam Map<String, Object> map, MultipartHttpServletRequest mRquest) throws IllegalStateException, IOException {
		 
		 Iterator<String> iterator = mRquest.getFileNames();
		 
		 System.out.println("1. Iterator : " + iterator);
		 
		 String filePath = "C:/js/upload/";
		 
		 File file = new File(filePath);
		 
		 if(!file.exists()) {
			 file.mkdirs();
		 }
		 
		 while(iterator.hasNext()) {
			 MultipartFile mFile = mRquest.getFile(iterator.next());
			 
			 System.out.println("2. MultipartFile : " + mFile);
			 
			 if(!mFile.isEmpty()) {
				 String fileName = System.currentTimeMillis() + "_" + mFile.getOriginalFilename();
				 
				 System.out.println("3. fileName : " + fileName);
				 
				 String realName = mFile.getOriginalFilename();
				 String saveName = fileName;
				 
				 System.out.println("realName : " + realName);
				 System.out.println("saveName : " + saveName);
			 
				 mFile.transferTo(new File(filePath + fileName));
				 
				 Map<String, Object> fileMap = new HashMap<String, Object>();
				 fileMap.put("realName", realName);
				 fileMap.put("saveName", saveName);
				 fileMap.put("filePath", filePath);
				 fileMap.put("listSeq", boardService.selectSeq()+1);
				 
				 System.out.println(":::: listSEQ : " + fileMap.get("listSeq"));
				 
				 boardService.fileUpload(fileMap);
			 }
		 }
		 
		 System.out.println("BoardController insertBoard Map : " + map);

		 
		 
		 int n = boardService.insertBoard(map);
		 System.out.println(n==1 ? "Insert Suceess..." : "Insert Failed...");
		 
		 return "redirect:list";
		
		 
	 }
	 
	 @RequestMapping(value = "detail", method = RequestMethod.GET)
	 public String detail(String seq, Model model, String fileSeq) {
		 System.out.println("seq : " + seq);
		 System.out.println("fileSeq : " + fileSeq);
		 
		 List<Map<String, Object>> detailList =  boardService.detailList(seq);
		 List<Map<String, Object>> fileMap = boardService.selectFile(fileSeq);
		 
		 
		 System.out.println("detailList : " + detailList);
		 model.addAttribute("detailList", detailList);
		 model.addAttribute("fileMap", fileMap);
		 return "board/insert";
	 }
	 
	 @RequestMapping(value = "updateBoard", method = RequestMethod.POST)
	 public String updateBoard(@RequestParam Map<String, Object> map) {
		 System.out.println("BoardController updateBoard " + map.toString());
		 System.out.println("map. seq : " + map.get("seq"));
		 int n = boardService.updateBoard(map);
		 System.out.println(n==1 ? "updateBoard Suceess..." : "updateBoard Failed...");
		 
		 return "redirect:list";
	 }
	 
	  @RequestMapping(value = "/delete", method = RequestMethod.POST)
	  @ResponseBody
	    public String ajaxTest(@RequestParam(value="valueArr[]") String[] chbox) {
		  	System.out.println("==================");
		  	System.out.println(chbox.length);
		  	System.out.println(chbox[0]);
	        int size = chbox.length;
	        for(int i=0; i<size; i++) {
	        	boardService.delete(chbox[i]);
	        }
	        return "redirect:list";
	    }
	  
	  @RequestMapping("/download")
		public void download(HttpServletResponse response, String fileName) throws Exception {
	        try {
	        	String path = "C:/js/upload/" + fileName; // 경로에 접근할 때 역슬래시('\') 사용
	        	
	        	File file = new File(path);
	        	response.setHeader("Content-Disposition", "attachment;filename=" + file.getName()); // 다운로드 되거나 로컬에 저장되는 용도로 쓰이는지를 알려주는 헤더
	        	
	        	FileInputStream fileInputStream = new FileInputStream(path); // 파일 읽어오기 
	        	OutputStream out = response.getOutputStream();
	        	
	        	int read = 0;
	                byte[] buffer = new byte[1024];
	                while ((read = fileInputStream.read(buffer)) != -1) { // 1024바이트씩 계속 읽으면서 outputStream에 저장, -1이 나오면 더이상 읽을 파일이 없음
	                    out.write(buffer, 0, read);
	                }
	                
	        } catch (Exception e) {
	            throw new Exception("download error");
	        }
	    }
}
