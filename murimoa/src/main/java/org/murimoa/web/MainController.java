package org.murimoa.web;

import org.murimoa.dto.MemberDTO;
import org.murimoa.service.MemberService;
import org.murimoa.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/murimoa/*")
@Log
public class MainController {
	
    @Autowired
    private MemberService service;
	
    @GetMapping("/main")
    public void mainGet() {
    	
    }
    
    @GetMapping("/login")
    public void loginGet() {
    	
    }
    
    @GetMapping("/signup")
    public void signupGet() {
        
    }
    
    @PostMapping("/signup")
    public String register(MemberDTO dto) {
        service.register(dto);
        return "redirect:/murimoa/login";
    }
    
    @PostMapping("/login")
    public void loginPost(MemberDTO dto, Model model) {
        model.addAttribute("memberDTO", service.login(dto));
    }
}
