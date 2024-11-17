package com.bsbmanagement.snsautobot.dto;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter @Setter
public class LicenseKeyDTO {
    private int id;
    private String licenseKey;
    private int useCount;
    private String machineId;
    private LocalDateTime createdAt;
    private LocalDate authenticatedAt;
    private LocalDate expirationDate;
}