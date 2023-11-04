package com.bsbmanagement.snsautobot.controller;

import com.bsbmanagement.snsautobot.dto.MeetupDTO;
import com.bsbmanagement.snsautobot.service.MeetupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.FileAlreadyExistsException;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@RestController
//@RequestMapping("/meetup")
public class MeetupController {

    // 이미지를 저장할 경로
    private final String UPLOAD_DIR = "C:/uploads/img/";

    @Autowired
    private MeetupService meetupService;


    @PostMapping("/add-meetup")
    public ResponseEntity<String> addMeetup(@RequestParam("photo") MultipartFile photo, @ModelAttribute MeetupDTO meetupDTO) {
        try {
            String savedImagePath = "";  // 저장된 이미지의 경로

            if(photo != null && !photo.isEmpty()) {
                savedImagePath = saveFile(photo);
                meetupDTO.setPhotoPath(savedImagePath); // 이미지 경로를 DTO에 설정
            }

            int result = meetupService.registerMeetup(meetupDTO);
            if (result > 0) {
                return ResponseEntity.ok("add success");
            } else {
                return ResponseEntity.badRequest().body("add failed");
            }
        } catch (Exception e) {
            return ResponseEntity.status(500).body("서버 에러: " + e.getMessage());
        }
    }

    private String saveFile(MultipartFile file) throws IOException {
        String timeStamp = DateTimeFormatter.ofPattern("yyyyMMddHHmmss").format(LocalDateTime.now());
        String filename = file.getOriginalFilename();
        String newFileName = filename.substring(0, filename.lastIndexOf('.')) + "_" + timeStamp + filename.substring(filename.lastIndexOf('.'));

        // 저장할 파일의 경로 생성
        Path path = Paths.get(UPLOAD_DIR + newFileName);

        try {
            // 지정된 경로가 존재하지 않으면 생성
            if(!Files.exists(path)) {
                Files.createDirectories(FileSystems.getDefault().getPath(UPLOAD_DIR));
            }

            // 이미지 파일을 지정된 경로로 복사
            Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
            return newFileName;  // 저장된 이미지 경로 반환
        } catch (FileAlreadyExistsException e) {
            throw new IOException("Error saving the file. File already exists.");
        }
    }
}
