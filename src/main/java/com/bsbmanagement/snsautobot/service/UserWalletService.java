package com.bsbmanagement.snsautobot.service;

import com.bsbmanagement.snsautobot.dto.UserWalletDTO;
import com.bsbmanagement.snsautobot.repository.UserWalletRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserWalletService {
    private final UserWalletRepository userWalletRepository;

    public int registerWallet(UserWalletDTO userWalletDTO) {
        return userWalletRepository.save(userWalletDTO);
    }

    public boolean isNicknameExist(String nickname) {
        return userWalletRepository.findByNickname(nickname) != null;
    }
}