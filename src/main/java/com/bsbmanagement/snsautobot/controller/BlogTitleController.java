package com.bsbmanagement.snsautobot.controller;

import com.bsbmanagement.snsautobot.dto.BlogTitleDTO;
import com.bsbmanagement.snsautobot.service.BlogTitleService;
import com.bsbmanagement.snsautobot.service.UserWalletService;
import com.bsbmanagement.snsautobot.dto.UserWalletDTO;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Map;

@RestController
public class BlogTitleController {

    @Autowired
    private BlogTitleService blogTitleService;
    @Autowired
    private UserWalletService userWalletService;



    @PostMapping("/generate-title")
    public String generateTitle(@RequestParam("title_subject") String titleSubject) throws Exception {
        // OpenAI API 호출 준비
        String apiKey = "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";
        URL url = new URL("https://api.openai.com/v1/completions");
        HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
        httpURLConnection.setRequestMethod("POST");
        httpURLConnection.setRequestProperty("Content-Type", "application/json; utf-8");
        httpURLConnection.setRequestProperty("Authorization", "Bearer " + apiKey);
        httpURLConnection.setDoOutput(true);

        String input = "{\"model\": \"text-davinci-001\", \"prompt\": \"" + titleSubject + "\", \"max_tokens\": 7, \"temperature\": 0}";
        try (OutputStream os = httpURLConnection.getOutputStream()) {
            byte[] inputBytes = input.getBytes("utf-8");
            os.write(inputBytes, 0, inputBytes.length);
        }

        String generatedTitle;
        try (BufferedReader br = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream(), "utf-8"))) {
            StringBuilder res = new StringBuilder();
            String resLine;

            while ((resLine = br.readLine()) != null) {
                res.append(resLine.trim());
            }

            JSONObject responseJson = new JSONObject(res.toString());
            generatedTitle = responseJson.getJSONArray("choices").getJSONObject(0).getString("text").trim();
        }

        // 생성된 제목을 데이터베이스에 저장
        BlogTitleDTO blogTitleDTO = new BlogTitleDTO();
        blogTitleDTO.setTitle_subject(titleSubject); // 전달받은 title_subject를 사용
        blogTitleDTO.setTitle(generatedTitle);
        blogTitleService.save(blogTitleDTO);

        return "제목 생성 및 저장 완료: " + generatedTitle;
    }

    @PostMapping("/register-wallet")
    public ResponseEntity<?> registerWallet(@RequestBody UserWalletDTO userWalletDTO) {
        if(userWalletService.isWalletExist(userWalletDTO.getWallet_address())) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body("지갑이 이미 등록되어 있습니다.");
        }
        userWalletService.registerWallet(userWalletDTO);
        return ResponseEntity.ok("Wallet registered successfully!");
    }

    @PostMapping("/check-nickname")
    public ResponseEntity<?> checkNickname(@RequestBody Map<String, String> request) {
        String nickname = request.get("nickname");

        if(userWalletService.isNicknameExist(nickname)) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body("닉네임이 이미 사용 중입니다.");
        } else {
            return ResponseEntity.ok("닉네임 사용 가능");
        }
    }

    @GetMapping("/getWalletList")
    public ResponseEntity<List<UserWalletDTO>> getWalletList() {
        List<UserWalletDTO> wallets = userWalletService.findAllWallets();
        System.out.println("Returned Wallets: " + wallets); // 서버 응답 로깅
        return ResponseEntity.ok(wallets);
    }
}