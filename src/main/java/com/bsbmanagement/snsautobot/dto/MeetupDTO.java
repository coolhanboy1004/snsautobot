package com.bsbmanagement.snsautobot.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Date;
import java.sql.Time;

@Getter
@Setter
@ToString
public class MeetupDTO {

    private int id;
    private String organizerNickname;
    private MultipartFile photo; // MultipartFile로 수정
    private String photoPath; // 이미지 파일 경로 저장용 필드
    private String name;
    private Date date;
    private Time time;
    private double price;
    private String locationName;
    private String locationUrl;
    private int capacity;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCurrentAttendees() {
        return currentAttendees;
    }

    public void setCurrentAttendees(int currentAttendees) {
        this.currentAttendees = currentAttendees;
    }

    private int currentAttendees; // 현재 참석 인원

    // photo 필드에 대한 getter 및 setter 메서드 추가
    public MultipartFile getPhoto() {
        return photo;
    }

    public void setPhoto(MultipartFile photo) {
        this.photo = photo;
    }

    // photo 필드에 대한 getter 및 setter 메서드 추가
    public String getPhotoPath() {
        return photoPath;
    }

    public void setPhotoPath(String photoPath) {
        this.photoPath = photoPath;
    }


}
