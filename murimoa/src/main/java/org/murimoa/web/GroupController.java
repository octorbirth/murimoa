package org.murimoa.web;

import java.util.List;

import javax.inject.Inject;

import org.murimoa.dto.GroupDTO;
import org.murimoa.dto.MemberDTO;
import org.murimoa.service.GroupService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
    
	@GetMapping("/mygroup/{mid}")
    public @ResponseBody List<GroupDTO> list(@PathVariable("mid") String mid){
		GroupDTO dto = new GroupDTO();
		dto.setMid(mid);
		return service.getMyGroup(dto);
    }
	
	@GetMapping("/allgroups")
    public @ResponseBody List<GroupDTO> allGroupList(){
		return service.getAllGroups();
    }
	
    @PostMapping("/signup")
    public @ResponseBody void signup(@RequestBody GroupDTO dto) {
        service.signup(dto);
    }
    
    @GetMapping("/manager")
    public void managerGet(Model model, GroupDTO dto) {
    	model.addAttribute("groupInfo", service.getinfo(dto));
    }
    
    @GetMapping("/signupMember/{gno}")
    public @ResponseBody List<GroupDTO> signupMember(@PathVariable("gno") Long gno) {
		GroupDTO dto = new GroupDTO();
		dto.setGno(gno);
    	return service.getSignupMember(dto);
    }
    
    @DeleteMapping("/signupDelete/{gno}")
    public @ResponseBody ResponseEntity<String> signupDelete(@PathVariable("gno") Long gno, @RequestBody GroupDTO dto){
        dto.setGno(gno);
        service.signupDelete(dto);
        return new ResponseEntity<String>("removed",HttpStatus.OK);
    }
    
    @GetMapping("/getGroupMember/{gno}")
    public @ResponseBody List<GroupDTO> getGroupMember(@PathVariable("gno") Long gno) {
		GroupDTO dto = new GroupDTO();
		dto.setGno(gno);
    	return service.getGroupMember(dto);
    }
    
    
    @DeleteMapping("/groupMemberDelete/{gno}")
    public @ResponseBody ResponseEntity<String> groupMemberDelete(@PathVariable("gno") Long gno, @RequestBody GroupDTO dto){
        dto.setGno(gno);
        service.groupMemberDelete(dto);
        return new ResponseEntity<String>("removed",HttpStatus.OK);
    }
    
    @PutMapping("/newMember/{gno}")
    public ResponseEntity<String> newMember(@PathVariable("gno") Long gno, @RequestBody GroupDTO dto){
    	dto.setGno(gno);
    	service.newMember(dto);
        return new ResponseEntity<String>("update",HttpStatus.OK);
    }
	
}
