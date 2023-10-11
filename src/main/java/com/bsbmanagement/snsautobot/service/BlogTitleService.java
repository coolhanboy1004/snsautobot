package com.bsbmanagement.snsautobot.service;

import com.bsbmanagement.snsautobot.repository.BlogTitleRepository;
import com.bsbmanagement.snsautobot.dto.BlogTitleDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class BlogTitleService {
    private final BlogTitleRepository blogTitleRepository;

    public int save(BlogTitleDTO blogTitleDTO) {
        return blogTitleRepository.save(blogTitleDTO);
    }
}