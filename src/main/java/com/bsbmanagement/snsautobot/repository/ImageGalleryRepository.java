package com.bsbmanagement.snsautobot.repository;

import com.bsbmanagement.snsautobot.dto.ImageGalleryDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ImageGalleryRepository {

    private final SqlSessionTemplate sqlSession;

    public ImageGalleryRepository(SqlSessionTemplate sqlSession) {
        this.sqlSession = sqlSession;
    }

    public int save(ImageGalleryDTO imageGalleryDTO) {
        return sqlSession.insert("ImageGallery.save", imageGalleryDTO);
    }

    // 이미지 상세 정보를 조회하는 메서드
    public ImageGalleryDTO findById(int imgId) {
        return sqlSession.selectOne("ImageGallery.findById", imgId);
    }

    // 가장 최신의 이미지 상세 정보를 조회하는 메서드
    // 최신 이미지 정보 조회
    public ImageGalleryDTO findLatestImage() {
        return sqlSession.selectOne("ImageGallery.findLatestImage");
    }

    public List<ImageGalleryDTO> findAllOrderedByIdDesc() {
        return sqlSession.selectList("ImageGallery.findAllOrderedByIdDesc");
    }
    // 추가적으로 필요한 메서드들 (예: findById, findAll 등)
}