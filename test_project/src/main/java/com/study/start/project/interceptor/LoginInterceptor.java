package com.study.start.project.interceptor;

import java.io.IOException;
import java.util.List;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	private List<String> urls = new ArrayList<String>(); 
	
	

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws IOException{
		String uri =request.getRequestURI();
		System.out.println("현재 uri :" +  uri);
		
		for(String url : urls){
			if(uri.equals(url)){
				return true;
			}
		}
		
		boolean falg = true;
		HttpSession session = request.getSession();
		if(session.getAttribute("user") == null){
			falg = false;
			response.sendRedirect("/start/loginForm");
		}
		return falg;
	}
	
	public List<String> getUrls() {
		return urls;
	}

	public void setUrls(List<String> urls) {
		this.urls = urls;
	}

}
