package org.murimoa.web;


import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.apache.commons.io.FileUtils;
import org.imgscalr.Scalr;
import org.murimoa.service.BoardService;
import org.murimoa.util.MediaUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/upload/*")
@Log
public class UploadController {
	
    @Autowired
    private BoardService boardService;
	
	@PostMapping(value = "/")
    public @ResponseBody Map<String, String> upload(MultipartFile file) throws Exception {
        
        // 실제 사용자가 업로드할 때의 파일명이면서 화면상에서 비춰져야 할 파일명
        String original = file.getOriginalFilename();
        
        // 파일명 중복처리
        UUID uuid = UUID.randomUUID();
        // DB 및 실제 폴더에 업로드될 파일명
        String uploadName = uuid.toString() + "_" + original;
        OutputStream out = new FileOutputStream("C:\\zzz\\"+ uploadName); // 파일 경로
        FileCopyUtils.copy(file.getInputStream(), out); // 폴더에 실제 파일 자체 저장
        
        Map<String, String> map = new HashMap();
        
        String fileType = original.substring(original.lastIndexOf(".") + 1);

        if(MediaUtils.checkType(fileType) != null) { // 이미지 타입이라면
            BufferedImage origin = ImageIO.read(file.getInputStream());    
            BufferedImage desImg = Scalr.resize(origin,
                    Scalr.Method.AUTOMATIC,
                    Scalr.Mode.FIT_TO_HEIGHT, 100);
            String thumbnailName = "s_" + uploadName;    
            ImageIO.write(desImg, "png",  new FileOutputStream("C:\\zzz\\" + thumbnailName));
            
            map.put("thumbName", thumbnailName);
            map.put("type", "image");
        }else {
            map.put("type", "file");
        }
        
        map.put("original", original);
        map.put("uploadName",uploadName);

        return map;        
    }
	
    @GetMapping("/thumb/{thumbName:.+}")
    public @ResponseBody byte[] display(@PathVariable("thumbName") String thumbName) throws Exception {
        File file = new File("C:\\zzz\\" + thumbName);
        return FileUtils.readFileToByteArray(file);
    }
    
    @PostMapping("/delete")
    public ResponseEntity<String> deleteFile(@RequestBody String fileName) {
        
        String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
        MediaType mType = MediaUtils.checkType(formatName);
        
        String target = fileName.substring(9);
        
        if(mType != null){ // 이미지 파일인 경우 썸네일 이미지도 동반삭제      
          new File("C:\\zzz\\s_" + target ).delete();
        }
        new File("C:\\zzz\\" + target ).delete();
        
        
        return new ResponseEntity<String>("deleted", HttpStatus.OK);
    }
    
    @GetMapping("/list/{bno}")
    public @ResponseBody List<String> list(@PathVariable("bno") Long bno){
        return boardService.getFileList(bno);
    }
}
