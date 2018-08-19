package org.murimoa.web;

import java.util.List;

import org.murimoa.dto.ReplyDTO;
import org.murimoa.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.java.Log;

@RestController
@RequestMapping("/reply/*")
@Log
public class ReplyController {

    @Autowired
    private ReplyService service;
    
    @PostMapping("/new")
    public void addReply(@RequestBody ReplyDTO dto) {
        service.register(dto);
    }
    
    @GetMapping("/list/{bno}")
    public List<ReplyDTO> list(@PathVariable("bno") int bno){
        ReplyDTO dto = new ReplyDTO();
        dto.setBno(bno);
        return service.getListReply(dto);
    }
}
