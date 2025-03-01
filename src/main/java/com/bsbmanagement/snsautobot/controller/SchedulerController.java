package com.bsbmanagement.snsautobot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.bsbmanagement.snsautobot.service.DynamicSchedulerService;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/scheduler")
public class SchedulerController {

    @Autowired
    private DynamicSchedulerService schedulerService;

    @PostMapping("/start")
    public ResponseEntity<?> startScheduler(@RequestParam String cronExpression) {
        // 스케줄러 시작 로직
        // 예시로 매 분마다 현재 시간을 출력하는 작업을 스케줄링합니다.
        schedulerService.startScheduledJob("timePrintingJob", () -> {
            System.out.println("Scheduled Task Executed - " + System.currentTimeMillis());
        }, cronExpression);

        return ResponseEntity.ok("Scheduler started with CRON expression: " + cronExpression);
    }

    @PostMapping("/stop")
    public ResponseEntity<?> stopScheduler(@RequestParam String jobId) {
        schedulerService.stopScheduledJob(jobId);
        return ResponseEntity.ok("Scheduler stopped for job ID: " + jobId);
    }

    @GetMapping("/current-time")
    public ResponseEntity<?> getCurrentTime() {
        LocalDateTime now = LocalDateTime.now();
        // ISO 8601 형식으로 날짜와 시간을 포맷팅
        String formattedNow = now.format(DateTimeFormatter.ISO_DATE_TIME);
        return ResponseEntity.ok(formattedNow);
    }
}