package org.murimoa.web;


import java.util.Arrays;

import javax.inject.Inject;

import org.murimoa.dto.AttendDTO;
import org.murimoa.dto.GroupDTO;
import org.murimoa.service.AttendService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    
    @PostMapping("/register")
	public String register(RedirectAttributes rttr,AttendDTO dto) {
    	
    	String[] attendMeberList = dto.getAttendMemberList();
    	String[] groupMeberList = dto.getGroupMemberList();
    	String[] attendList = new String[groupMeberList.length];
    	
    	for(int i=0; i<groupMeberList.length; i++) {
    		if(Arrays.asList(attendMeberList).contains(groupMeberList[i])) {
    			attendList[i] = "Y";
    		}else {
    			attendList[i] = "N";
    		}
    	}
    	dto.setAttendList(attendList);

    	attendService.registerAttend(dto);
		
    	rttr.addFlashAttribute("result", "attendRegisterSuccess");
		return "redirect:/board/list?gno=" + dto.getGno();
	}
    
	@GetMapping("/view")
	public void view(@ModelAttribute("AttendInfo") AttendDTO dto, Model model) {
		model.addAttribute("attendMemberList", attendService.getAttendMemberList(dto));
		return;
	}
	
	@PostMapping("/remove")
	public String remove(RedirectAttributes rttr, AttendDTO dto) {
		attendService.remove(dto);
		rttr.addFlashAttribute("result", "attendDeleteSuccess");
		return "redirect:/board/list?gno=" + dto.getGno();
	}
    
    
}
