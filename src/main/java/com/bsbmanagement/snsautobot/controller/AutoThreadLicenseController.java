package com.bsbmanagement.snsautobot.controller;

import com.bsbmanagement.snsautobot.service.LicenseKeyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/autothread-license")
public class AutoThreadLicenseController {

    @Autowired
    private LicenseKeyService licenseKeyService;

    @PostMapping("/verify")
    public ResponseEntity<?> verifyLicense(@RequestBody Map<String, String> request) {
        String licenseKey = request.get("license_key");
        String machineId = request.get("machine_id");

        Map<String, Object> result = licenseKeyService.verifyLicenseKey(licenseKey, machineId);
        result.put("current_date", LocalDateTime.now().format(DateTimeFormatter.ISO_DATE_TIME));

        return ResponseEntity.ok(result);
    }

    @GetMapping("/check-date")
    public ResponseEntity<?> checkDate() {
        Map<String, Object> response = new HashMap<>();
        LocalDateTime currentDate = LocalDateTime.now();

        response.put("current_date", currentDate.format(DateTimeFormatter.ISO_DATE_TIME));

        return ResponseEntity.ok(response);
    }

    @GetMapping("/check-status")
    public ResponseEntity<?> checkLicenseStatus(@RequestParam String machineId) {
        Map<String, Object> result = licenseKeyService.checkLicenseStatus(machineId);
        result.put("current_date", LocalDateTime.now().format(DateTimeFormatter.ISO_DATE_TIME));

        return ResponseEntity.ok(result);
    }
}