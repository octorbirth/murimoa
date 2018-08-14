package org.murimoa.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/murimoa/*")
@Log
public class MainController {
	
    @GetMapping("/main")
    public void mainGet() {
        log.info("Get 방식으로 접근!!!");
    }
}
