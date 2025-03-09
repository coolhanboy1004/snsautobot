package com.bsbmanagement.snsautobot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@Controller
public class TestOAuthController {

    @GetMapping("/test-oauth")
    @ResponseBody
    public String testOAuth() {
        return "OAuth2 테스트 페이지 - <a href='/oauth2/authorization/google'>구글 로그인</a>";
    }

    @GetMapping("/oauth2/authorization/google/manual")
    public void manualOAuth(HttpServletResponse response) throws IOException {
        System.out.println("수동 OAuth2 리다이렉트 시작");

        String clientId = "13678446740-21id5rge71is8rjjmd989jmt6g77svm2.apps.googleusercontent.com";
        String redirectUri = URLEncoder.encode("http://localhost/login/oauth2/code/google", StandardCharsets.UTF_8);
        String scope = URLEncoder.encode("email profile", StandardCharsets.UTF_8);

        String authUrl = "https://accounts.google.com/o/oauth2/v2/auth" +
                "?client_id=" + clientId +
                "&redirect_uri=" + redirectUri +
                "&response_type=code" +
                "&scope=" + scope;

        System.out.println("리다이렉트 URL: " + authUrl);
        response.sendRedirect(authUrl);
    }
}