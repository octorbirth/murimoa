package org.murimoa.web;


import javax.inject.Inject;

import org.murimoa.dto.GroupDTO;
import org.murimoa.service.AttendService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.extern.java.Log;

@Controller
@RequestMapping("/attend/*")
@Log
public class AttendController {

	@Inject
	private AttendService attendService;
	
    @GetMapping("/register")
    public void registerGet(Model model, @ModelAttribute("groupInfo") GroupDTO dto) {
    	model.addAttribute("memberList", attendService.getMemberList(dto));
    }
}
