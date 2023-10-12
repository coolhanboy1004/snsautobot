package com.bsbmanagement.snsautobot.repository;

import com.bsbmanagement.snsautobot.dto.UserWalletDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class UserWalletRepository {
    private final SqlSessionTemplate sql;

    public int save(UserWalletDTO userWalletDTO) {
        return sql.insert("UserWallet.save", userWalletDTO);
    }

    public UserWalletDTO findByNickname(String nickname) {
        return sql.selectOne("UserWallet.findByNickname", nickname);
    }

    public List<UserWalletDTO> findAll() {
        return sql.selectList("UserWallet.findAll");
    }

    public boolean isWalletExist(String wallet_address) {
        return sql.selectOne("UserWallet.findByWalletAddress", wallet_address) != null;
    }
}