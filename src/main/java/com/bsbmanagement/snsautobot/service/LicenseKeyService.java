package com.bsbmanagement.snsautobot.service;

import com.bsbmanagement.snsautobot.dto.LicenseKeyDTO;
import com.bsbmanagement.snsautobot.repository.LicenseKeyRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class LicenseKeyService {

    private final LicenseKeyRepository licenseKeyRepository;

    @Transactional
    public Map<String, Object> verifyLicenseKey(String licenseKey, String machineId) {
        Map<String, Object> result = new HashMap<>();
        LicenseKeyDTO licenseKeyDTO = licenseKeyRepository.findByKey(licenseKey);

        if (licenseKeyDTO != null) {
            if (licenseKeyDTO.getUseCount() == 0) {
                // 새로운 라이선스 키 활성화
                licenseKeyRepository.incrementUseCount(licenseKey, machineId);
                result.put("valid", true);
                result.put("message", "라이선스가 성공적으로 활성화되었습니다.");
            } else if (licenseKeyDTO.getMachineId() != null && licenseKeyDTO.getMachineId().equals(machineId)) {
                // 이미 이 기기에 연결된 라이선스 키
                result.put("valid", true);
                result.put("message", "라이선스가 유효합니다.");
            } else {
                // 다른 기기에 이미 연결된 라이선스 키 또는 이미 사용된 라이선스
                result.put("valid", false);
                result.put("message", "이 라이선스 키는 이미 사용되었거나 다른 기기에 연결되어 있습니다.");
            }
        } else {
            result.put("valid", false);
            result.put("message", "존재하지 않는 라이선스 키입니다.");
        }

        return result;
    }

    public Map<String, Object> checkLicenseStatus(String machineId) {
        Map<String, Object> result = new HashMap<>();
        LicenseKeyDTO licenseKeyDTO = licenseKeyRepository.findByMachineId(machineId);

        if (licenseKeyDTO != null) {
            LocalDate now = LocalDate.now();
            LocalDate expirationDate = licenseKeyDTO.getExpirationDate();
            long daysUntilExpiration = ChronoUnit.DAYS.between(now, expirationDate);

            if (daysUntilExpiration <= 0) {
                result.put("valid", false);
                result.put("message", "라이선스가 만료되었습니다.");
            } else if (daysUntilExpiration <= 10) {
                result.put("valid", true);
                result.put("message", "라이선스가 " + daysUntilExpiration + "일 후에 만료됩니다.");
                result.put("daysUntilExpiration", daysUntilExpiration);
            } else {
                result.put("valid", true);
                result.put("message", "라이선스가 유효합니다.");
            }
        } else {
            result.put("valid", false);
            result.put("message", "라이선스를 찾을 수 없습니다.");
        }

        return result;
    }
}