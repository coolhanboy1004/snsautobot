package com.bsbmanagement.snsautobot.controller;

import com.bsbmanagement.snsautobot.dto.MeetupDTO;
import com.bsbmanagement.snsautobot.service.MeetupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.file.FileAlreadyExistsException;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@RestController
//@RequestMapping("/meetup")
public class MeetupController {

    // 이미지를 저장할 경로를 상대 경로로 설정
    private final Path UPLOAD_DIR = Paths.get(System.getProperty("user.dir"), "uploads", "img");

    @Autowired
    private MeetupService meetupService;

    @PostMapping("/add-meetup")
    public ResponseEntity<String> addMeetup(@RequestParam("photo") MultipartFile photo, @ModelAttribute MeetupDTO meetupDTO) {
        try {
            String savedImagePath = "";  // 저장된 이미지의 상대 경로

            if (photo != null && !photo.isEmpty()) {
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
        Path path = UPLOAD_DIR.resolve(newFileName);

        try {
            // 지정된 경로가 존재하지 않으면 생성
            if (!Files.exists(path.getParent())) {
                Files.createDirectories(path.getParent());
            }

            // 이미지 파일을 지정된 경로로 복사
            Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);

            // 상대 경로 반환
            return "/uploads/img/" + newFileName;
        } catch (FileAlreadyExistsException e) {
            throw new IOException("Error saving the file. File already exists.");
        }
    }

    @GetMapping("/getMeetups")
    public ResponseEntity<List<MeetupDTO>> getMeetups() {
        List<MeetupDTO> meetups = meetupService.findAllMeetups();
        // 여기서는 photoPath를 추가로 처리할 필요가 없습니다. 저장할 때 이미 상대 경로를 설정했습니다.
        return ResponseEntity.ok(meetups);
    }

    @GetMapping("/uploads/img/{filename:.+}")
    public void getImage(@PathVariable String filename, HttpServletResponse response) {
        Path imagePath = UPLOAD_DIR.resolve(filename).normalize();

        if (Files.exists(imagePath)) {
            response.setContentType("image/jpeg"); // MIME 타입 설정
            response.setHeader("Content-Disposition", "inline; filename=\"" + filename + "\"");
            try {
                Files.copy(imagePath, response.getOutputStream());
                response.flushBuffer();
            } catch (IOException e) {
                // 예외 처리
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } else {
            // 이미지 파일이 없을 때 클라이언트에게 404 상태 코드를 보냄
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @PostMapping("/join/{meetupId}")
    public ResponseEntity<String> joinMeetup(@PathVariable int meetupId, @RequestParam String nickname) {
        String message = meetupService.joinMeetup(meetupId, nickname);
        return message.equals("정모에 참여했습니다.") ?
                ResponseEntity.ok(message) :
                ResponseEntity.badRequest().body(message);
    }

    @DeleteMapping("/leave/{meetupId}")
    public ResponseEntity<String> leaveMeetup(@PathVariable int meetupId, @RequestParam String nickname) {
        String message = meetupService.leaveMeetup(meetupId, nickname);
        return message.equals("정모를 취소하였습니다.") ?
                ResponseEntity.ok(message) :
                ResponseEntity.badRequest().body(message);
    }
}
