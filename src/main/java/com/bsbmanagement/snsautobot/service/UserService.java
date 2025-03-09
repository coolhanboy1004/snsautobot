package com.bsbmanagement.snsautobot.service;

import com.bsbmanagement.snsautobot.dto.UserDTO;

public interface UserService {
    /**
     * 이메일로 사용자 조회
     * @param email 사용자 이메일
     * @return 사용자 정보 또는 null
     */
    UserDTO findByEmail(String email);
    
    /**
     * 새 사용자 저장
     * @param userDTO 저장할 사용자 정보
     */
    void save(UserDTO userDTO);
    
    /**
     * 기존 사용자 정보 업데이트
     * @param userDTO 업데이트할 사용자 정보
     */
    void update(UserDTO userDTO);
    
    /**
     * 사용자 정보 저장 또는 업데이트
     * 이메일로 사용자를 조회하여 존재하면 업데이트, 없으면 새로 저장
     * @param userDTO 저장 또는 업데이트할 사용자 정보
     * @return 저장 또는 업데이트된 사용자 정보
     */
    UserDTO saveOrUpdate(UserDTO userDTO);
} 