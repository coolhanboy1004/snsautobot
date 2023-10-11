package com.bsbmanagement.snsautobot.controller;

import com.bsbmanagement.snsautobot.service.BlogTitleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
public class HomeController {
    @Autowired
    private BlogTitleService blogTitleService;

    @GetMapping("/")
    public String home() {
        return "index"; //=> index.jsp 출력
    }

    @GetMapping("/main")
    public String main() {
        return "main"; //=> main.jsp 출력
    }

    @GetMapping("/walletregistration")
    public String walletregistration() {
        return "walletregistration"; //=> walletregistration.jsp 출력
    }
}