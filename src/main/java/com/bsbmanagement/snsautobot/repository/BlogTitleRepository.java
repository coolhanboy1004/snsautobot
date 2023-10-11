package com.bsbmanagement.snsautobot.repository;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import com.bsbmanagement.snsautobot.dto.BlogTitleDTO;
import org.mybatis.spring.SqlSessionTemplate;

@Repository
@RequiredArgsConstructor
public class BlogTitleRepository {
    private final SqlSessionTemplate sql;
    public int save(BlogTitleDTO blogTitleDTO) {
        System.out.println("blogTitleDTO = " + blogTitleDTO);
        return sql.insert("Blogtitle.save", blogTitleDTO);
    }
}
