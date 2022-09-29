package com.min.edu.ctrl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.min.edu.service.ILoginService;

@Controller
public class LoginController {

	@Autowired
	private ILoginService service;
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@RequestParam Map<String, Object> map, HttpSession session, Model model) {
		
		System.out.println("LoginController login Map : " + map);
		
		Map<String, Object> lMap = service.login(map);
		
		System.out.println("LoginController login lMap : " + lMap);
		
		session.setAttribute("login", lMap);
		
		System.out.println("LoginController Session : " + session.getAttribute("login"));
		
		if(lMap == null) {
			System.out.println("애초에 여길 타는거구나?");
			return "login";
		}else if(!(lMap.get("empPw").equals(map.get("empPw")))) {
			return "login";
		}else {
			model.addAttribute("session", session);
			return "main";
		}
		
	}
}
