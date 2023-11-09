package com.bsbmanagement.snsautobot.service;

import com.bsbmanagement.snsautobot.dto.MeetupDTO;
import com.bsbmanagement.snsautobot.repository.MeetupRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MeetupService {
    private final MeetupRepository meetupRepository;

    public int registerMeetup(MeetupDTO meetupDTO) {
        return meetupRepository.save(meetupDTO);
    }

    public List<MeetupDTO> findAllMeetups() {
        List<MeetupDTO> meetups = meetupRepository.findAll();
        meetups.forEach(meetup -> {
            int currentAttendees = meetupRepository.findCurrentAttendeesByMeetupId(meetup.getId());
            meetup.setCurrentAttendees(currentAttendees);
        });
        return meetups;
    }

    public String joinMeetup(int meetupId, String nickname) {
        try {
            int affectedRows = meetupRepository.joinMeetup(meetupId, nickname);
            return affectedRows > 0 ? "정모에 참여했습니다." : "참여하지 못했습니다.";
        } catch (IllegalStateException e) {
            return e.getMessage();
        }
    }

    public String leaveMeetup(int meetupId, String nickname) {
        try {
            int affectedRows = meetupRepository.leaveMeetup(meetupId, nickname);
            return affectedRows > 0 ? "정모를 취소했습니다." : "취소하지 못했습니다.";
        } catch (IllegalStateException e) {
            return e.getMessage();
        }
    }

}