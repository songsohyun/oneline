package com.approval.sh1.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.approval.sh1.service.ApprovalService;

@Controller
public class ApprovalController {
	
	@Resource(name="service")
	private ApprovalService approvalService;

	@RequestMapping("/")
	public String signInPage() {
		return "signInPage";
	}
	
	@RequestMapping(value="signIn", method=RequestMethod.POST)
	public String signIn(@RequestParam Map<String, String> map, Model model, HttpSession session) {
		
		// 아이디&비밀번호 조회
		int idPwRes = approvalService.findIdPw(map);
		
		// 아이디&비밀번호가 일치하면
		// 로그인하는 회원의 모든 정보를 session에 저장
		if(idPwRes == 1) {
			session.setAttribute("member", approvalService.signInMemberInfo(map));
			session.setAttribute("memName", approvalService.signInMemberInfo(map).get("memName"));
		}
		
		// 아이디 조회
		int idRes = approvalService.findId(map.get("id"));
		
		model.addAttribute("idPwRes", idPwRes);
		model.addAttribute("idRes", idRes);
		
		return "approval/result";
	}
	
	@RequestMapping("list")
	public String list(@RequestParam Map<String, Object> map, Model model, HttpSession session) {
		
		// session에 저장해둔 member 정보를 가져오기 위해서 사용
		@SuppressWarnings("unchecked")
		Map<String, Object> member = (Map<String, Object>)session.getAttribute("member");
		
		map.put("memId", member.get("memId"));
		map.put("memRank", member.get("memRank"));
		
		if(map.get("column") == null) {
			map.put("column", "");
		}
		if(map.get("apprStatus") == null) {
			map.put("apprStatus", "");
		}
		if(map.get("query") == null) {
			map.put("query", "");
		}
		if(map.get("startDay") == null) {
			map.put("startDay", "");
		}
		if(map.get("endDay") == null) {
			map.put("endDay", "");
		}
		
		/*
		map.put("column", "");
		map.put("apprStatus", "");
		map.put("query", "");
		map.put("startDay", "");
		map.put("endDay", "");
		*/
		
		List<Map<String, Object>> list = approvalService.list(map);
		
		
		/*
		if(list.isEmpty() == false) {
			for(Map<String, Object> one : list) {
				Map<String, Object> apprNoId = new HashMap<String, Object>();
				apprNoId.put("apprNo", one.get("apprNo"));
				apprNoId.put("approverId", one.get("approverId"));
				one.put("approverId", approvalService.changeApprIdToName(apprNoId));
			}			
		}
		*/
		
		model.addAttribute("list", list);
		model.addAttribute("column", map.get("column"));
		model.addAttribute("query", map.get("query"));
		model.addAttribute("apprStatus", map.get("apprStatus"));
		model.addAttribute("startDay", map.get("startDay"));
		model.addAttribute("endDay", map.get("endDay"));
		return "approval/list";
	}
	
	@RequestMapping("writePage")
	public String writePage(Model model) {
		model.addAttribute("listNo", approvalService.listNo());
		model.addAttribute("btnStatus", "1");
		return "approval/write";
	}
	
	// 지워버리기
	/*
	@RequestMapping("listNo")
	@ResponseBody
	public String listNo() {
		String listNo = String.valueOf(approvalService.listNo());
		return listNo;
	}
	*/
	
	// 임시저장 버튼을 누르면 히스토리&결재 테이블에 정보 저장
	// 결재 테이블에 먼저 저장한 뒤에
	// 히스토리 테이블에 정보 저장
	/*
	@RequestMapping(value="save", method= RequestMethod.POST)
	@ResponseBody
	public String save(@RequestParam Map<String, Object> map) {
			
		// 결재 테이블에 결재No 유무 확인
		int apprNoYesOrNo = approvalService.findApprNo((int)map.get("no"));
		
		int saveApprYesOrNo = 0;
		int saveHisYesOrNo = 0;
		int modifyApprYesOrNo = 0;
		
		// 결재No가 없으면 insert, 있으면 update
		if(apprNoYesOrNo == 0) {
			
			// 결재 테이블에 먼저 insert
			saveApprYesOrNo = approvalService.saveApproval(map);
			
		} else {
			
			// 결재 테이블에 저장되어있는 정보 update
			modifyApprYesOrNo = approvalService.modifyApprovalByNo(map);

		}
		
		// 결재 테이블에 insert 성공하거나
		// 결재 테이블에 update 성공하면
		// 히스토리 테이블에 insert
		if(saveApprYesOrNo == 1 || modifyApprYesOrNo == 1) {
			saveHisYesOrNo = approvalService.saveHistory(map);
		}
		
		return (saveApprYesOrNo == 1 || modifyApprYesOrNo == 1) && saveHisYesOrNo == 1 ? "1" : "0";
	}
	*/
	
	
	// 임시저장 버튼 또는 결재 버튼을 누르면 히스토리&결재 테이블에 정보 저장
	// 결재 테이블에 먼저 저장한 뒤에
	// 히스토리 테이블에 정보 저장
	@RequestMapping(value= {"save", "approval"}, method= RequestMethod.POST)
	@ResponseBody
	public String save(@RequestParam Map<String, Object> map, HttpServletRequest request) {
			
		if(request.getRequestURI().endsWith("save")) {
			map.put("status", "1");
		} else if(request.getRequestURI().endsWith("approval")) {
			map.put("status", "2");			
		}
		
		// session에 저장해둔 member 정보를 가져오기 위해서 사용
		@SuppressWarnings("unchecked")
		Map<String, Object> member = (Map<String, Object>)request.getSession().getAttribute("member");
		String memRank = (String) member.get("memRank");
		String memId = (String) member.get("memId");
		map.put("memId", memId);
				
		// 회원의 직급이 과장이거나 부장일 경우
		if(memRank.equals("c")) {
			map.put("rank", "3");
		} else if(memRank.equals("d")) {
			map.put("rank", "4");			
		}
		
		// 결재 테이블에 결재No 유무 확인
		int apprNoYesOrNo = approvalService.findApprNo(Integer.parseInt((String)map.get("no")));
		
		int saveApprYesOrNo = 0;
		int saveHisYesOrNo = 0;
		int modifyApprYesOrNo = 0;
		
		// 결재No가 없으면 insert, 있으면 update
		if(apprNoYesOrNo == 0) {
			
			// 결재 테이블에 먼저 insert
			saveApprYesOrNo = approvalService.saveApproval(map);
		
		} else {
			
			// 결재 테이블에 저장되어있는 정보 update
			modifyApprYesOrNo = approvalService.modifyApprovalByNo(map);
			
		}
		
		
		// 결재 테이블에 insert 성공하거나 update 성공하면
		// 히스토리 테이블에 insert
		if(saveApprYesOrNo == 1 || modifyApprYesOrNo == 1) {
			saveHisYesOrNo = approvalService.saveHistory(map);
		}
		
		
		
		
		/*
		// 결재 테이블에 먼저 insert
		int saveApprYesOrNo = approvalService.saveApproval(map);
		
		int saveHisYesOrNo = 0;
		
		// 결재 테이블에 insert 성공하면
		// 히스토리 테이블에 insert
		if(saveApprYesOrNo == 1) {
			saveHisYesOrNo = approvalService.saveHistory(map);
		}
		*/
		
		
		return (saveApprYesOrNo == 1 && saveHisYesOrNo == 1) || (modifyApprYesOrNo == 1 && saveHisYesOrNo == 1) ? "1" : "0";
	}
	
	// 상세페이지
	@RequestMapping("detail")
	public String detail(@RequestParam int apprNo, Model model) {
		
		Map<String, Object> map = approvalService.detailApprByNo(apprNo);
		
 		model.addAttribute("listNo", map.get("apprNo"));	
 		model.addAttribute("memName", map.get("memName"));	
 		model.addAttribute("title", map.get("apprTitle"));
 		model.addAttribute("content", map.get("apprContent"));
 		model.addAttribute("apprStatus", map.get("apprStatus"));
 		model.addAttribute("writerId", map.get("writerId"));
 		model.addAttribute("approverId", map.get("approverId"));
 		
 		model.addAttribute("hisList", approvalService.detailHisByNo(apprNo));
 		
		return "approval/write";
	}
	
	// 로그아웃
	@RequestMapping("logOut")
	public String logOut(HttpSession session) {
		session.removeAttribute("member");
		session.removeAttribute("memName");
		return "signInPage";
	}
	
	// 반려
	@RequestMapping(value="cancel", method=RequestMethod.POST)
	@ResponseBody
	public String cancel(@RequestParam Map<String, Object> map, HttpSession session) {
		
		// session에 저장해둔 member 정보를 가져오기 위해서 사용
		@SuppressWarnings("unchecked")
		Map<String, Object> member = (Map<String, Object>)session.getAttribute("member");
		String memId = (String) member.get("memId");
		map.put("memId", memId);
		
		// int cancelRes = approvalService.cancelByNo(Integer.parseInt((String)map.get("no")));
		int cancelRes = approvalService.cancelByNo(map);
		
		int saveHisYesOrNo = 0;
		
		if(cancelRes == 1) {
			saveHisYesOrNo = approvalService.saveHistory(map);
		}
		
		return cancelRes == 1 && saveHisYesOrNo == 1 ? "1" : "0";
	}
	
	// ajax 검색
	@RequestMapping(value="ajaxSearch", method=RequestMethod.POST, produces="application/json")
	@ResponseBody
	public List<Map<String, Object>> ajaxSearch(@RequestParam Map<String, Object> map, HttpSession session) {
		
		// session에 저장해둔 member 정보를 가져오기 위해서 사용
		@SuppressWarnings("unchecked")
		Map<String, Object> member = (Map<String, Object>)session.getAttribute("member");
		
		map.put("memId", member.get("memId"));
		map.put("memRank", member.get("memRank"));
		
		List<Map<String, Object>> list = approvalService.list(map);
		
		return list;
	}
	
	
	
}
