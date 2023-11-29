package com.bsbmanagement.snsautobot.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.sql.Timestamp;

@Getter
@Setter
@ToString
public class ImageGalleryDTO {
    private int img_id;
    private String crt_id;
    private String img_url;
    private String prompt;
    private Timestamp crt_date;
}