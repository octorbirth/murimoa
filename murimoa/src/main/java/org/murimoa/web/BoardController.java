package org.murimoa.web;

import org.murimoa.dto.GroupDTO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/board/*")
@Log
public class BoardController {

    @GetMapping("/list")
    public void listGet(GroupDTO dto) {
    	
    }
}
