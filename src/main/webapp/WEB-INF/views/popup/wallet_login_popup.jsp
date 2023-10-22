<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2023-10-21
  Time: 오후 4:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Wallet Registration Popup -->
<div id="klipPopup" style="display: none;">
    <span class="close-btn" id="closePopup">닫기</span>
    <div class="nickname-input">
        <input type="text" id="nickname" placeholder="닉네임을 입력하세요." />
        <button id="checkNickname">중복확인</button>
        <span id="nicknameStatus" style="padding-left: 10px;"></span>
    </div>
    <p id="pcOnlyText" style="display: none;">닉네임 중복확인 후 QR코드를 생성후 <br>스마트폰으로 클립 인증을 진행하시면 됩니다.</p>
    <div id="qrcode"></div>
    <br>
    <br>
    <button id="generateQR">클립 인증용 QR 코드 생성하기</button> <!-- QR 코드 생성 버튼 -->
    <!-- 원래의 버튼을 이미지로 변경 -->
    <button id="klipAuthBtn" style="background: none; border: none; display: none;">
        <img src="../resources/img/button/clip_btn.png" alt="지갑등록또는연결" />
    </button>
</div>

