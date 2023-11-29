package com.bsbmanagement.snsautobot.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.nio.file.Path;
import java.nio.file.Paths;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    private final Path uploadDir = Paths.get(System.getProperty("user.dir"), "upload", "img");

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        String absolutePath = uploadDir.toAbsolutePath().toString();
        System.out.println(" absolutePath:" + absolutePath);

        registry.addResourceHandler("/upload/img/**")
                .addResourceLocations("file:" + absolutePath + "/");
    }
}