package com.bsbmanagement.snsautobot.repository;

import com.bsbmanagement.snsautobot.dto.UserWalletDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    public UserWalletDTO findByNicknameAndWalletAddress(String nickname, String wallet_address) {
        Map<String, Object> params = new HashMap<>();
        params.put("nickname", nickname);
        params.put("wallet_address", wallet_address);
        return sql.selectOne("UserWallet.findByNicknameAndWalletAddress", params);
    }
}