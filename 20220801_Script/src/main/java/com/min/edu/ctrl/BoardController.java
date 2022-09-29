package com.min.edu.ctrl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.min.edu.service.IBoardService;
import com.min.edu.vo.BoardVo;

@Controller
public class BoardController {

	@Autowired
	private IBoardService service;
	
	@RequestMapping("/board.do")
	public String board(Model model) {
		List<BoardVo> list = service.selectAll();
		model.addAttribute("list", list);
		return "board";
	}
	
	@RequestMapping("/object2.do")
	public String object2() {
		return "object2";
	}
}
