package com.bsbmanagement.snsautobot.repository;

import com.bsbmanagement.snsautobot.dto.UserDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class UserRepository {
    private final SqlSessionTemplate sql;

    public UserDTO findByEmail(String email) {
        return sql.selectOne("User.findByEmail", email);
    }

    public void save(UserDTO userDTO) {
        sql.insert("User.save", userDTO);
    }

    public void update(UserDTO userDTO) {
        sql.update("User.update", userDTO);
    }
}