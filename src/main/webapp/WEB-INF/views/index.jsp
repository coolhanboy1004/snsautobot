<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>AIWD</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
          rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/plyr.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/style.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/popup-styles.css" type="text/css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="../resources/js/klipSDK-2.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
    <script src="https://cdn.rawgit.com/davidshimjs/qrcodejs/gh-pages/qrcode.min.js"></script>


</head>
<script src="../resources/js/wallet.js"></script>
<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<jsp:include page="header.jsp" />

<h2>Wallet List:</h2>
<ul id="walletList">
    <!-- 지갑 데이터가 여기에 동적으로 삽입됩니다. -->
</ul>

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
        <img src="../resources/img/button/clip_btn.png" alt="지갑등록하기" />
    </button>
</div>


<script src="../resources/js/wallet_login.js"></script>
<!-- Js Plugins -->
<script src="../resources/js/bootstrap.min.js"></script>
<script src="../resources/js/player.js"></script>
<script src="../resources/js/jquery.nice-select.min.js"></script>
<script src="../resources/js/mixitup.min.js"></script>
<script src="../resources/js/jquery.slicknav.js"></script>
<script src="../resources/js/owl.carousel.min.js"></script>
<script src="../resources/js/main.js"></script>


</body>

</html>