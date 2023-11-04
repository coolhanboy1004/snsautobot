package com.bsbmanagement.snsautobot.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@RestController
@RequestMapping("/upload")
public class FileUploadController {

    @PostMapping("/multipart")
    public ResponseEntity<String> handleMultipartUpload(@RequestParam("file") MultipartFile file) {
        if (file.isEmpty()) {
            return ResponseEntity.badRequest().body("파일을 선택해주세요.");
        }

        try {
            // 업로드된 파일을 저장할 경로 설정 (원하는 경로로 수정)
            String uploadDir = "/path/to/upload/directory";
            File uploadPath = new File(uploadDir);

            if (!uploadPath.exists()) {
                uploadPath.mkdirs();
            }

            // 업로드된 파일의 원래 파일 이름
            String originalFileName = file.getOriginalFilename();
            // 저장할 파일 경로와 이름 설정
            File destFile = new File(uploadPath, originalFileName);

            // 파일 저장
            file.transferTo(destFile);

            return ResponseEntity.ok("파일 업로드 성공: " + originalFileName);
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("파일 업로드 중 오류 발생");
        }
    }
}
