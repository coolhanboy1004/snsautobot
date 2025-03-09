package com.bsbmanagement.snsautobot.controller;

import com.bsbmanagement.snsautobot.config.OAuthConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.UUID;

@Controller
@RequestMapping("/oauth2")
public class OAuth2Controller {
    private static final Logger logger = LoggerFactory.getLogger(OAuth2Controller.class);

    private final OAuthConfig oAuthConfig;

    @Autowired
    public OAuth2Controller(OAuthConfig oAuthConfig) {
        this.oAuthConfig = oAuthConfig;
    }

    @GetMapping("/authorization/google")
    public RedirectView googleAuth(HttpSession session) {
        String clientId = oAuthConfig.getClientId();
        if (clientId == null) {
            throw new RuntimeException("Client ID is not configured");
        }

        logger.info("Client ID: {}", clientId);

        String redirectUri = "https://aiwd.kro.kr/login/oauth2/code/google";
        String scope = "email profile";
        
        // 보안을 위한 state 파라미터 생성
        String state = UUID.randomUUID().toString();
        session.setAttribute("oauth2State", state);
        
        logger.info("Generated state: {}", state);
        logger.info("Redirect URI: {}", redirectUri);

        String authUrl = String.format("https://accounts.google.com/o/oauth2/v2/auth?" +
                "client_id=%s" +
                "&redirect_uri=%s" +
                "&response_type=code" +
                "&scope=%s" +
                "&state=%s",
                clientId,
                URLEncoder.encode(redirectUri, StandardCharsets.UTF_8),
                URLEncoder.encode(scope, StandardCharsets.UTF_8),
                state);

        logger.info("Auth URL: {}", authUrl);
        
        return new RedirectView(authUrl);
    }
} 