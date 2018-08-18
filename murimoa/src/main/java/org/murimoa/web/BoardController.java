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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
    @GetMapping("/view")
    public void viewGet(Model model, BoardDTO dto) {
        model.addAttribute("boardInfo", boardService.get(dto));
        return;
    }
    
    @PostMapping("/remove")
    public String removePost(BoardDTO dto, RedirectAttributes rttr) {
    	boardService.delete(dto);
        rttr.addFlashAttribute("result", "delsuccess");
        return "redirect:/board/list?gno=" + dto.getGno();
    }
    
    @GetMapping("/modify")
    public void modifyGet(Model model, BoardDTO dto) {
    	model.addAttribute("boardInfo", boardService.get(dto));
        return;
    }
    
    @PostMapping("/modify")
    public String modify(BoardDTO dto, RedirectAttributes rttr) {
        rttr.addAttribute("bno", dto.getBno());
        rttr.addAttribute("gno", dto.getGno());
        rttr.addFlashAttribute("result", "modsuccess");
        boardService.modify(dto);
        return "redirect:/board/view";
    }
}
