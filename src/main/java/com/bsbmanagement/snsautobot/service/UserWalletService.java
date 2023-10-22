package com.bsbmanagement.snsautobot.service;

import com.bsbmanagement.snsautobot.dto.UserWalletDTO;
import com.bsbmanagement.snsautobot.repository.UserWalletRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

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

    public List<UserWalletDTO> findAllWallets() {
        return userWalletRepository.findAll();
    }

    public boolean isWalletExist(String wallet_address) {
        return userWalletRepository.isWalletExist(wallet_address);
    }

    public boolean validateUserLogin(String nickname, String wallet_address) {
        UserWalletDTO user = userWalletRepository.findByNicknameAndWalletAddress(nickname, wallet_address);
        return user != null;
    }
}