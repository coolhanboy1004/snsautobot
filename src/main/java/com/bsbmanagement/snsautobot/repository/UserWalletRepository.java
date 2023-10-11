package com.bsbmanagement.snsautobot.repository;

import com.bsbmanagement.snsautobot.dto.UserWalletDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
}