package com.study.start.project.controller;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.start.project.paging.Pagination;
import com.study.start.project.service.ProjectService;

@Controller
public class ProjectController {
	
	
	@Resource(name="projectService")
	private ProjectService projectService;
	
	@RequestMapping("/loginForm")
	public String loginForm(){
		return "project/login/loginForm";
	}
	
	// 로그인
	@RequestMapping(value="/login")
	@ResponseBody
	public String login(@RequestParam Map<String, Object> map, 
			            HttpSession session){
		
		String flag = "true";
		
		// 사용자 유무에 따른 조건 리턴
		Map userMap = projectService.selectUser(map);
		if(userMap == null || userMap.isEmpty()){
			flag = "false";
		} else {
			session.setAttribute("user", userMap);
		}
		
		return flag;	
	}
	
	// 게시판 리스트 
	@RequestMapping("/list")
	public String list(Model model, @RequestParam Map<String, Object> map, HttpSession session){
		
		
		Iterator<String> iterator = map.keySet().iterator();
		System.out.println("-----list메서드-----");
		while(iterator.hasNext()){
			String key = iterator.next();
			String value = (String)map.get(key);
			System.out.println(key +" : "+ value);
		}
		System.out.println("--------------------");
		
				
		//파라미터에 사용자 정보 추가
		Map userMap = (Map)session.getAttribute("user");
		String Rank = String.valueOf(userMap.get("RANK"));
		String userName = String.valueOf(userMap.get("USER_NAME"));
		String userId = String.valueOf(userMap.get("USER_ID"));
		map.put("RANK", Rank);
		map.put("USER_NAME", userName);
		map.put("USER_ID", userId);
		
		//페이징
		int currentPage = 1;
		if(map.containsKey("currentPage")){
			currentPage = Integer.parseInt((String) map.get("currentPage"));
		}
		//System.out.println("현재 페이지 번호: " + currentPage);
		Pagination pagination = projectService.paging(map, currentPage);
		
		//파라미터에 보여줄 레코드 범위 전달
		String beginPage = String.valueOf(pagination.getBeginPage());
		String endPage = String.valueOf(pagination.getEndPage());
		map.put("beginPage", beginPage);
		//System.out.println("현재 페이지의 시작 레코드: " + beginPage);
		map.put("endPage", endPage);
		//System.out.println("현재 페이지의 끝 레코드: " + endPage);
		
		//사용자 또는 검색 조건에 따른 게시물 리스트 얻기
		List<Map> list = projectService.getlist(map);
		
		//검색조건 유지를 위한 파라미터 전달
		model.addAttribute("params", map);
		model.addAttribute("list", list);
		model.addAttribute("pagination", pagination);
		
		return "project/list/list";
		
	}
	
	//글쓰기, 글수정, 게시물 디테일
	@RequestMapping("/projectWriteForm")
	public String writeForm(Model model, HttpSession session){
		
		
		Map<String,String> map = (Map<String, String>) session.getAttribute("user");
		
		//글번호다음값
		int nextSeq = projectService.nextSeq();
		
		//게시물 디테일을 위한 리스트 검색
		//List<Map> list = projectService.getlist(map);
		
		
		model.addAttribute("nextSeq", nextSeq);
		//model.addAttribute("list", list);
		
		return "project/write/writeForm";
	}
	
	//글쓰기 로직
	@RequestMapping("/projectWrite")
	@Transactional(rollbackFor=SQLException.class, propagation=Propagation.REQUIRED)
	public String write(@RequestParam Map<String, Object> map, HttpSession session){
		
		//사용자 정보 얻기
		Map<String, Object> userMap = (Map<String, Object>)session.getAttribute("user");
		String Rank = String.valueOf(userMap.get("RANK"));
		String userName = String.valueOf(userMap.get("USER_NAME"));
		map.put("RANK", Rank);
		map.put("USER_NAME", userName);
		
		//사용자 정보에 따른 글쓰기 요청
		projectService.inserList(map);
		projectService.insertHistory(map);
		
		return "redirect:/list";
	}
	
	//로그아웃
	@RequestMapping("/projectLogout")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/loginForm";
	}
	
	//게시물 디테일
	@RequestMapping("/projectDetail")
	public String detail(@RequestParam Map map, Model model){
		
		List<Map> list = projectService.getlist(map);
		List<Map> historyList = projectService.selectHistory(map);
		model.addAttribute("list", list);
		model.addAttribute("historyList", historyList);
		return "project/write/writeForm";
	}
	
	
}
