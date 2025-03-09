package com.bsbmanagement.snsautobot.controller;

import com.bsbmanagement.snsautobot.config.OAuthConfig;
import com.bsbmanagement.snsautobot.dto.UserDTO;
import com.bsbmanagement.snsautobot.service.UserService;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class OAuth2CallbackController {
    private static final Logger logger = LoggerFactory.getLogger(OAuth2CallbackController.class);

    private final OAuthConfig oAuthConfig;
    private final RestTemplate restTemplate;
    private final ObjectMapper objectMapper;
    private final UserService userService;

    @Autowired
    public OAuth2CallbackController(OAuthConfig oAuthConfig, UserService userService) {
        this.oAuthConfig = oAuthConfig;
        this.restTemplate = new RestTemplate();
        this.objectMapper = new ObjectMapper();
        this.userService = userService;
    }

    @GetMapping("/login/oauth2/code/google")
    public String googleCallback(
            @RequestParam(required = false) String code,
            @RequestParam(required = false) String error,
            @RequestParam(required = false) String state,
            HttpSession session) throws IOException {
        
        // 에러 파라미터 체크
        if (error != null) {
            logger.warn("OAuth2 callback error: {}", error);
            return "redirect:/";
        }
        
        // code가 없는 경우 체크
        if (code == null) {
            logger.error("Authorization code is missing");
            return "redirect:/";
        }

        // state 파라미터 검증
        String savedState = (String) session.getAttribute("oauth2State");
        logger.info("Received state: {}, Saved state: {}", state, savedState);
        
        if (state != null && savedState != null && !state.equals(savedState)) {
            logger.error("State parameter doesn't match! Possible CSRF attack.");
            return "redirect:/error?message=Invalid+state+parameter";
        }
        
        // state 파라미터 제거
        session.removeAttribute("oauth2State");
        
        String clientId = oAuthConfig.getClientId();
        String clientSecret = oAuthConfig.getClientSecret();
        
        if (clientId == null || clientSecret == null) {
            throw new RuntimeException("OAuth configuration is not properly set");
        }

        logger.info("Received authorization code: {}", code);
        logger.info("Using client ID: {}", clientId);
        logger.info("Client secret length: {}", clientSecret != null ? clientSecret.length() : 0);

        // 1. 액세스 토큰 얻기
        String tokenUrl = "https://oauth2.googleapis.com/token";
        
        MultiValueMap<String, String> tokenRequest = new LinkedMultiValueMap<>();
        tokenRequest.add("client_id", clientId);
        tokenRequest.add("client_secret", clientSecret);
        tokenRequest.add("code", code);
        tokenRequest.add("redirect_uri", "https://aiwd.kro.kr/login/oauth2/code/google");
        tokenRequest.add("grant_type", "authorization_code");

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        logger.info("Token request parameters: {}", tokenRequest);
        logger.info("Token URL: {}", tokenUrl);

        try {
            ResponseEntity<String> tokenResponse = restTemplate.postForEntity(
                tokenUrl,
                new HttpEntity<>(tokenRequest, headers),
                String.class
            );

            logger.info("Token response status: {}", tokenResponse.getStatusCode());
            logger.info("Token response body: {}", tokenResponse.getBody());

            JsonNode tokenNode = objectMapper.readTree(tokenResponse.getBody());
            String accessToken = tokenNode.get("access_token").asText();

            // 2. 사용자 정보 얻기
            String userInfoUrl = "https://www.googleapis.com/oauth2/v3/userinfo";
            
            headers = new HttpHeaders();
            headers.setBearerAuth(accessToken);

            ResponseEntity<String> userInfoResponse = restTemplate.exchange(
                userInfoUrl,
                HttpMethod.GET,
                new HttpEntity<>(headers),
                String.class
            );

            JsonNode userInfo = objectMapper.readTree(userInfoResponse.getBody());
            
            String email = userInfo.get("email").asText();
            String name = userInfo.get("name").asText();
            String picture = userInfo.get("picture").asText();
            String sub = userInfo.get("sub").asText(); // Google의 고유 ID

            // 3. 세션에 사용자 정보 저장
            session.setAttribute("loggedInUser", name);
            session.setAttribute("userEmail", email);
            session.setAttribute("userPicture", picture);
            
            // 4. 데이터베이스에 사용자 정보 저장 또는 업데이트
            UserDTO userDTO = UserDTO.builder()
                    .email(email)
                    .name(name)
                    .picture(picture)
                    .provider("google")
                    .providerId(sub)
                    .build();
            
            userService.saveOrUpdate(userDTO);
            logger.info("User saved or updated in database: {}", email);

            return "redirect:/";
        } catch (Exception e) {
            logger.error("Error during OAuth2 token request", e);
            throw e;
        }
    }
} 