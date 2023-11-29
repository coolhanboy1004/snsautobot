package com.bsbmanagement.snsautobot.service;

import com.bsbmanagement.snsautobot.dto.ImageGalleryDTO;
import com.bsbmanagement.snsautobot.repository.ImageGalleryRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ImageGalleryService {

    private final ImageGalleryRepository imageGalleryRepository;

    public ImageGalleryService(ImageGalleryRepository imageGalleryRepository) {
        this.imageGalleryRepository = imageGalleryRepository;
    }

    public int saveImageGallery(ImageGalleryDTO imageGalleryDTO) {
        return imageGalleryRepository.save(imageGalleryDTO);
    }

    public ImageGalleryDTO getImageById(int imgId) {
        return imageGalleryRepository.findById(imgId);
    }
    // 최신 이미지 정보 조회
    public ImageGalleryDTO getLatestImage() {
        return imageGalleryRepository.findLatestImage();
    }

    public List<ImageGalleryDTO> getAllImagesOrderedByIdDesc() {
        return imageGalleryRepository.findAllOrderedByIdDesc();
    }
    // 추가적으로 필요한 비즈니스 로직 (예: getImageGallery, getAllImageGalleries 등)
}