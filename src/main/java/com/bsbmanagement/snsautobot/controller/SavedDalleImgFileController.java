package com.bsbmanagement.snsautobot.controller;

import com.bsbmanagement.snsautobot.dto.ImageGalleryDTO;
import com.bsbmanagement.snsautobot.service.ImageGalleryService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.scheduling.annotation.Async;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.io.*;
import java.net.URL;
import java.nio.file.*;
import java.util.List;
import java.util.UUID;

@RestController
public class SavedDalleImgFileController {

    @Autowired
    private ImageGalleryService imageGalleryService; // ImageGalleryService 주입

    private final Path uploadDir = Paths.get(System.getProperty("user.dir"), "uploads", "img");

    @PostMapping("/generate-dalle-image")
    public ResponseEntity<String> generateDalleImage(@RequestParam("prompt") String prompt, @RequestParam("sender") String sender) {
        try {
            // 작업 수행
            String baseUrl = "https://aiwd.kro.kr/imagegallery";
            String imageUrl = callDallE3API(prompt);
            String savedImagePath = saveImageFromUrl(imageUrl);
            String fullUrl = createFullUrlFromPath(savedImagePath);

            // 클라이언트에 빠르게 응답
            ResponseEntity<String> response = ResponseEntity.ok(baseUrl);

            // 다른 메소드에서 비동기적으로 나머지 작업 수행
            doAsyncWork(sender, prompt, fullUrl);

            return response;
        } catch (Exception e) {
            return ResponseEntity.status(500).body("Server Error: " + e.getMessage());
        }
    }

    // 나머지 작업을 수행하는 비동기 메소드
    @Async
    public void doAsyncWork(String sender, String prompt, String fullUrl) {
        ImageGalleryDTO imageGalleryDTO = new ImageGalleryDTO();
        imageGalleryDTO.setCrt_id(sender);
        imageGalleryDTO.setPrompt(prompt);
        imageGalleryDTO.setImg_url(fullUrl);
        imageGalleryService.saveImageGalleryAsync(imageGalleryDTO);
    }

    private String callDallE3API(String prompt) throws IOException {
        // API 엔드포인트 및 요청 데이터 설정
        String apiEndpoint = "https://api.together.xyz/v1/images/generations";
        String apiKey = System.getenv("TOGETHER_API_KEY"); // Together API 키

        // REST Template을 사용하여 Together API 호출
        RestTemplate restTemplate = new RestTemplate();

        // 요청 JSON 구성 - 참조 코드를 바탕으로 구성
        String requestJson = "{"
                + "\"model\":\"black-forest-labs/FLUX.1-schnell\","  // 모델명 수정
                + "\"prompt\":\"" + prompt + "\","
                + "\"steps\":4,"  // steps 값 4로 설정
                + "\"disable_safety_checker\":true"  // safety checker 비활성화
                + "}";

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("Authorization", "Bearer " + apiKey);
        HttpEntity<String> entity = new HttpEntity<>(requestJson, headers);

        ResponseEntity<String> response = restTemplate.postForEntity(apiEndpoint, entity, String.class);

        // API 응답에서 이미지 URL 추출
        String imageUrl = extractImageUrlFromTogetherResponse(response.getBody());
        return imageUrl;
    }

    private String saveImageFromUrl(String imageUrl) throws IOException {
        URL url = new URL(imageUrl);
        String fileName = UUID.randomUUID().toString() + ".png";
        Path targetPath = uploadDir.resolve(fileName);

        // 이미지 파일을 저장할 디렉토리가 없다면 생성
        if (!Files.exists(uploadDir)) {
            Files.createDirectories(uploadDir);
        }

        try (InputStream in = url.openStream()) {
            Files.copy(in, targetPath, StandardCopyOption.REPLACE_EXISTING);
        }

        return targetPath.toString();
    }

    // Together API 응답에서 이미지 URL 추출하는 메소드
    private String extractImageUrlFromTogetherResponse(String responseBody) {
        JSONObject responseJson = new JSONObject(responseBody);
        // Python 코드의 response.data[0].url 참조하여 구현
        String extractedUrl = responseJson.getJSONArray("data").getJSONObject(0).getString("url");
        return extractedUrl;
    }

    private String extractImageUrlFromResponse(String responseBody) {
        JSONObject responseJson = new JSONObject(responseBody);
        String extractedUrl = responseJson.getJSONArray("data").getJSONObject(0).getString("url");
        return extractedUrl;
    }

    // 상대 경로를 완전한 URL로 변환하는 메소드
    private String createFullUrlFromPath(String savedImagePath) {


        // 경로 구분자 변경
        savedImagePath = savedImagePath.replace("\\", "/");

        int uploadsIndex = savedImagePath.indexOf("/uploads");

        String relativePath = savedImagePath.substring(uploadsIndex);

        // base URL과 상대 경로 결합
        //return baseUrl + relativePath;
        return relativePath;
    }

    @GetMapping("/image-detail/{imgId}")
    public ResponseEntity<?> getImageDetail(@PathVariable int imgId) {
        try {
            ImageGalleryDTO imageGallery = imageGalleryService.getImageById(imgId);
            return ResponseEntity.ok(imageGallery);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Image not found");
        }
    }

    @GetMapping("/image-detail/latest")
    public ResponseEntity<?> getLatestImageDetail() {
        try {
            ImageGalleryDTO latestImage = imageGalleryService.getLatestImage();
            return ResponseEntity.ok(latestImage);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error fetching latest image");
        }
    }

    @GetMapping("/imagelist")
    public ResponseEntity<List<ImageGalleryDTO>> getAllImages() {
        try {
            List<ImageGalleryDTO> images = imageGalleryService.getAllImagesOrderedByIdDesc();
            return ResponseEntity.ok(images);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    @GetMapping("/image-gallery")
    public String imageGallery(Model model) {
        try {
            ImageGalleryDTO latestImage = imageGalleryService.getLatestImage();
            model.addAttribute("image", latestImage);
            return "imageGallery"; // imageGallery.jsp 파일을 가리킵니다.
        } catch (Exception e) {
            model.addAttribute("error", "이미지를 로드하는 데 실패했습니다.");
            return "errorPage"; // 오류가 있는 경우 errorPage.jsp 파일을 가리킵니다.
        }
    }

    // 기타 필요한 메서드들...
}