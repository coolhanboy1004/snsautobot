package com.bsbmanagement.snsautobot.config;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Properties;

@Component
public class OAuthConfig {
    private Properties properties;

    @PostConstruct
    public void init() throws IOException {
        properties = new Properties();
        ClassPathResource resource = new ClassPathResource("oauth_config.txt");
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(resource.getInputStream()))) {
            properties.load(reader);
        }
    }

    public String getClientId() {
        return properties.getProperty("client_id");
    }

    public String getClientSecret() {
        return properties.getProperty("client_secret");
    }
} 