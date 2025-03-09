package com.bsbmanagement.snsautobot.service;

import com.bsbmanagement.snsautobot.dto.UserDTO;
import com.bsbmanagement.snsautobot.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;

    @Override
    public UserDTO findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    @Transactional
    public void save(UserDTO userDTO) {
        userRepository.save(userDTO);
    }

    @Override
    @Transactional
    public void update(UserDTO userDTO) {
        userRepository.update(userDTO);
    }

    @Override
    @Transactional
    public UserDTO saveOrUpdate(UserDTO userDTO) {
        UserDTO existingUser = userRepository.findByEmail(userDTO.getEmail());
        
        if (existingUser == null) {
            // 새 사용자 등록
            userRepository.save(userDTO);
            return userDTO;
        } else {
            // 기존 사용자 정보 업데이트
            existingUser.setName(userDTO.getName());
            existingUser.setPicture(userDTO.getPicture());
            
            // provider와 providerId가 null이 아닌 경우에만 업데이트
            if (userDTO.getProvider() != null) {
                existingUser.setProvider(userDTO.getProvider());
            }
            if (userDTO.getProviderId() != null) {
                existingUser.setProviderId(userDTO.getProviderId());
            }
            
            userRepository.update(existingUser);
            return existingUser;
        }
    }
} 