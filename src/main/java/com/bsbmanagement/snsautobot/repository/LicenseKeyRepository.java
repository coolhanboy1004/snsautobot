package com.bsbmanagement.snsautobot.repository;

import com.bsbmanagement.snsautobot.dto.LicenseKeyDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class LicenseKeyRepository {

    private final SqlSessionTemplate sqlSession;

    public LicenseKeyDTO findByKey(String licenseKey) {
        return sqlSession.selectOne("LicenseKey.findByKey", licenseKey);
    }

    public int incrementUseCount(String licenseKey, String machineId) {
        LicenseKeyDTO dto = new LicenseKeyDTO();
        dto.setLicenseKey(licenseKey);
        dto.setMachineId(machineId);
        return sqlSession.update("LicenseKey.incrementUseCount", dto);
    }

    public LicenseKeyDTO findByMachineId(String machineId) {
        return sqlSession.selectOne("LicenseKey.findByMachineId", machineId);
    }
}