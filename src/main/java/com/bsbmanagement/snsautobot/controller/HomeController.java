package com.bsbmanagement.snsautobot.controller;

import com.bsbmanagement.snsautobot.service.BlogTitleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class HomeController {
    @Autowired
    private BlogTitleService blogTitleService;

    @GetMapping("/")
    public String home() {
        return "index"; //=> index.jsp 출력
    }

    @GetMapping("/meetupschedule")
    public String meetupSchedule() {
        return "meetupschedule"; //=> index.jsp 출력
    }

    @GetMapping("/main")
    public String main() {
        return "main"; //=> main.jsp 출력
    }

    @GetMapping("/walletregistration")
    public String walletregistration() {
        return "walletregistration"; //=> walletregistration.jsp 출력
    }

    @GetMapping("/memeberstatus")
    public String memeberstatus() {
        return "memeberstatus"; //=> walletregistration.jsp 출력
    }

    @GetMapping("/terms")
    public String terms() {
        return "terms"; //=> walletregistration.jsp 출력
    }

    @GetMapping("/imagedetail")
    public String imagedetail() {
        return "imagedetail"; //=> imagedetail.jsp 출력
    }

    @GetMapping("/imagegallery")
    public String imagegallery() {
        return "imagegallery"; //=> imagedetail.jsp 출력
    }

    @GetMapping("/freeboard")
    public String freeboard() {
        return "freeboard"; //=> imagedetail.jsp 출력
    }

    @GetMapping("/airpggame")
    public String airpggame() {
        return "airpggame"; //=> imagedetail.jsp 출력
    }

    @GetMapping("/gptstore")
    public String gptstore() {
        return "gptstore"; //=> gptstore.jsp 출력
    }

    @GetMapping("/privacy")
    public String privacy() {
        return "privacy"; //=> gptstore.jsp 출력
    }

    @GetMapping("/LicenseKeyIssuance")
    public String LicenseKeyIssuance() {
        return "LicenseKeyIssuance"; //=> gptstore.jsp 출력
    }
}