<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2023-10-21
  Time: 오후 4:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Wallet Registration Popup -->
<div id="klipPopup" style="display: none;">
    <span class="close-btn" id="closePopup">닫기</span>
    <div class="nickname-input">
        <input type="text" id="nickname" placeholder="닉네임을 입력하세요." />
        <button id="checkNickname">중복확인</button>
        <span id="nicknameStatus" style="padding-left: 10px;"></span>
        <p style="color: grey; font-size: small;">최초 로그인시만 닉네임 중복확인</p> <!-- 추가된 문구 -->
    </div>
    <br>
    <button id="generateQR">클립 인증용 QR 코드 생성하기
    </button>
    <div id="qrcode"></div>
    <div class="klipAuthBtn-wrapper"> <!-- 추가된 div 태그 -->
        <button id="klipAuthBtn" style="background: none; border: none; display: none;">
            <img src="../resources/img/button/clip_btn.png" alt="지갑등록또는연결" />
        </button>
    </div>
</div>

