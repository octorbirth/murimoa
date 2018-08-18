package org.murimoa.web;

import javax.inject.Inject;

import org.murimoa.dto.GroupDTO;
import org.murimoa.service.GroupService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/board/*")
@Log
public class BoardController {

    @Inject
    private GroupService groupService;
	
    @GetMapping("/list")
    public void listGet(Model model, GroupDTO dto) {
    	model.addAttribute("groupInfo", groupService.getinfo(dto));
    }
}
