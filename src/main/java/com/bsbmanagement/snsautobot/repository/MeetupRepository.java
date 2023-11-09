package com.bsbmanagement.snsautobot.repository;

import com.bsbmanagement.snsautobot.dto.MeetupDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class MeetupRepository {

    private final SqlSessionTemplate sqlSession;

    public int save(MeetupDTO meetupDTO) {
        return sqlSession.insert("Meetup.save", meetupDTO);
    }

    public MeetupDTO findByName(String name) {
        return sqlSession.selectOne("Meetup.findByName", name);
    }

    public List<MeetupDTO> findAll() {
        return sqlSession.selectList("Meetup.findAll");
    }

    public boolean isParticipantAlreadyJoined(int meetupId, String nickname) {
        Integer count = sqlSession.selectOne("Meetup.countParticipant", Map.of("meetupId", meetupId, "nickname", nickname));
        return count != null && count > 0;
    }

    public boolean isParticipantNotJoined(int meetupId, String nickname) {
        return !isParticipantAlreadyJoined(meetupId, nickname);
    }

    public int joinMeetup(int meetupId, String nickname) {
        if (isParticipantNotJoined(meetupId, nickname)) {
            Map<String, Object> params = new HashMap<>();
            params.put("meetupId", meetupId);
            params.put("nickname", nickname);
            return sqlSession.insert("Meetup.joinMeetup", params);
        } else {
            throw new IllegalStateException("이미 참여한 상태입니다.");
        }
    }

    public int leaveMeetup(int meetupId, String nickname) {
        if (isParticipantAlreadyJoined(meetupId, nickname)) {
            Map<String, Object> params = new HashMap<>();
            params.put("meetupId", meetupId);
            params.put("nickname", nickname);
            return sqlSession.delete("Meetup.leaveMeetup", params);
        } else {
            throw new IllegalStateException("참여하지 않은 상태입니다.");
        }
    }

    public int findCurrentAttendeesByMeetupId(int meetupId) {
        return sqlSession.selectOne("Meetup.findCurrentAttendees", meetupId);
    }
}