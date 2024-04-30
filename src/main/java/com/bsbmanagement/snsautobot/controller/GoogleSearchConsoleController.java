package com.bsbmanagement.snsautobot.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;

@RestController
public class GoogleSearchConsoleController {

    @GetMapping("/google0aed23abaab03b00.html")
    public ResponseEntity<String> googleSearchConsole(HttpServletRequest request) {
        return ResponseEntity.ok("google-site-verification: google0aed23abaab03b00.html");
    }
}