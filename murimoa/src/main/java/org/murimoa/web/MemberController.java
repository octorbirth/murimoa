package org.murimoa.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.murimoa.dto.MemberDTO;
import org.murimoa.service.MemberService;
import org.murimoa.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private MemberService service;
	
    @PutMapping("/updateName")
    public ResponseEntity<String> updateName(@RequestBody MemberDTO dto, HttpServletRequest request){
        
        // DB 값을 변경한 후 세션값 갱신
        HttpSession session = request.getSession();
        if (session.getAttribute("memberDTO") != null) {
            MemberVO vo = service.updateName(dto);
            session.setAttribute("memberDTO", vo);            
        }
        return new ResponseEntity<String>("update",HttpStatus.OK);
    }
}
