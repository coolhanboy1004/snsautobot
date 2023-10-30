<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2023-10-21
  Time: 오후 4:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><!-- Meetup Schedule Addition Popup -->
<div id="meetupPopup" style="display: none;">
    <span class="close-btn" id="closeMeetupPopup">닫기</span>
    <div class="meetup-input">
        <!-- Hidden input to store organizer's nickname -->
        <input type="text" id="organizerNickname" />
        <input type="text" id="meetupName" placeholder="정모 이름을 입력하세요." />
        <input type="date" id="meetupDate" placeholder="날짜를 선택하세요." />
        <input type="time" id="meetupTime" placeholder="시간을 선택하세요." />
        <input type="number" id="meetupPrice" placeholder="가격을 입력하세요." step="0.01" />
        <input type="text" id="meetupLocationName" placeholder="장소 이름을 입력하세요." />
        <input type="text" id="meetupLocationUrl" placeholder="장소 URL을 입력하세요." />
        <input type="number" id="meetupCapacity" placeholder="정모 인원을 입력하세요." />
    </div>
    <button id="addMeetup">정모일정 추가하기</button>
</div>
