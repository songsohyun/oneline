package com.study.start.controller;

import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.start.model.BoardVO;
import com.study.start.model.Paging;
import com.study.start.service.BoardService;
import com.tobesoft.platform.data.Dataset;

@Controller
public class BoardController {
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	@RequestMapping("/boardlist")
	public String boardList(Model model, @RequestParam Map<String, String> map){
		
		slslsls.s
		s
		dklfds
		knfa
		klsnfdk
		lasnfl
		a
		lskdnaf
		ㅂㅈㄷㅂㅈㄷㅂㅈㄷㅁㄴㅇ
		ㅂㅈㄷㅂㅈㄷㅈㄷㅂㄷㅂㅈㅁㄴㅇㅁㄴ
		dldldldldl
        Paging paging = boardService.paging(map);
		@SuppressWarnings("unchecked")
		List<BoardVO> list = boardService.search(map);
		System.out.println("totalRecodes:" + paging.getTotalRecodes());
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		return "boardList";
	}
	
	@RequestMapping("/write")
	public String write(BoardVO boardVo, @RequestParam("seq") String seq){
		if(seq != null && !seq.equals("")){
			boardVo.setSEQ(Integer.parseInt(seq));
		}
		boardService.writeService(boardVo);
		return "redirect:/boardlist.do";
		커커커밋
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam Integer[] check){
		List<Integer> list = Arrays.asList(check);
		boardService.delete(list);
		return "redirect:/boardlist.do";
	}
	
	/*@RequestMapping("/search")
	public String search(@RequestParam Map map, Model model){
		List list = boardService.search(map);
		model.addAttribute("list", list);
		return "boardList";
	}*/
	
	@RequestMapping("/search")
	public String search(@RequestParam Map map, Model model){
		 Paging paging = boardService.paging(map);
		List list = boardService.search(map);
		System.out.println("totalRecodes:" + paging.getTotalRecodes());
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		Iterator iterator = map.keySet().iterator();
		while(iterator.hasNext()){
			String key = (String)iterator.next();
			String value = (String)map.get(key);
			System.out.println(key +":" +value);
			
		}
		return "boardList";
	}
	
	@RequestMapping("/aview")
	public String aView(){
		return "/aView";
	}
	
	@RequestMapping("/atest")
	@ResponseBody
	public String aView(@RequestParam String text){
		return text;
	}
	
	@RequestMapping("/mi")
	public String mi(){
		
		Dataset dataset = new Dataset();
		alksdnfkladsnf
		asklndfa
		slkdnfkal
		alskdnflkasdnfa
		dflaknf
		sdfasdfsdafasdfsdfsdafsd
		return "";
	}
}
