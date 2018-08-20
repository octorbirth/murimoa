package org.murimoa.web;


import org.murimoa.dto.GroupDTO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.extern.java.Log;

@Controller
@RequestMapping("/attend/*")
@Log
public class AttendController {

    @GetMapping("/register")
    public void registerGet(@ModelAttribute("groupInfo") GroupDTO dto) {
    	
    }
}
