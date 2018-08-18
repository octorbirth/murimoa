package org.murimoa.web;

import javax.inject.Inject;

import org.murimoa.dto.BoardDTO;
import org.murimoa.dto.GroupDTO;
import org.murimoa.service.BoardService;
import org.murimoa.service.GroupService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/board/*")
@Log
public class BoardController {

    @Inject
    private GroupService groupService;
    
    @Inject
    private BoardService boardService;
	
    @GetMapping("/list")
    public void listGet(Model model, GroupDTO dto) {
    	model.addAttribute("groupInfo", groupService.getinfo(dto));
    	model.addAttribute("boardList", boardService.list(dto));
    }
    
    @GetMapping("/register")
    public void registerGet(@ModelAttribute("groupInfo") GroupDTO dto) {
    	
    }
    
	@PostMapping("/register")
    public String registerPost(BoardDTO dto) {
		boardService.register(dto);
	    return "redirect:/board/list?gno=" + dto.getGno();
    }
}
