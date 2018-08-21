package org.murimoa.web;

import java.util.List;

import javax.inject.Inject;

import org.murimoa.dto.GroupDTO;
import org.murimoa.dto.ReplyDTO;
import org.murimoa.service.GroupService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/group/*")
@Log
public class GroupController {
	
    @Inject
    private GroupService service;
	
    @GetMapping("/register")
    public void registerGet() {
        
    }
    
    @PostMapping("/register")
    public String registerPost(GroupDTO dto, RedirectAttributes rttr) {
        service.register(dto);
        rttr.addFlashAttribute("result","groupRegister");
        return "redirect:/murimoa/main";
    }
    
	@GetMapping("/mygroup")
    public @ResponseBody List<GroupDTO> list(){
		return service.getMyGroup();
    }
	
	@GetMapping("/allgroups")
    public @ResponseBody List<GroupDTO> allGroupList(){
		return service.getAllGroups();
    }
	
    @PostMapping("/signup")
    public @ResponseBody void signup(@RequestBody GroupDTO dto) {
        service.signup(dto);
    }
	
}
