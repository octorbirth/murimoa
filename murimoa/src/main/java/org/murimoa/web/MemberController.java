package org.murimoa.web;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.murimoa.dto.MemberDTO;
import org.murimoa.service.MemberService;
import org.murimoa.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

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
    
    @PostMapping("/updateImage")
    public Map<String, String> upload(MultipartFile file, HttpServletRequest request, MemberDTO dto) throws Exception {
        
        String original = file.getOriginalFilename();
        UUID uuid = UUID.randomUUID();
        String uploadName = uuid.toString() + "_" + original;
        
        OutputStream out = new FileOutputStream("C:\\zzz\\"+ uploadName);
        FileCopyUtils.copy(file.getInputStream(), out);
        
        Map<String, String> map = new HashMap();
        map.put("original", original); // 사용자가 업로드한 원본 파일명
        map.put("uploadName",uploadName); // 실제 DB와 폴더에 저장될 파일명

        HttpSession session = request.getSession();
        if (session.getAttribute("memberDTO") != null) {
            dto.setImage(map.get("uploadName"));
            MemberVO vo = service.updateImage(dto);
            session.setAttribute("memberDTO", vo);            
        }
        
        return map;        
    }
}
