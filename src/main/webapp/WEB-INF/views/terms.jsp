<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="AIWD">
    <meta name="keywords" content="AI, GPT, DALLE, Stable-diffusion">
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


<!-- AI 정보공유 모임 약관 시작 -->
<div class="container mt-5">
    <div class="row">
        <div class="col-12">
            <h5 class="mb-4">AI인공지능 정보공유 모임 약관</h5>

            <h6>제 1조 (정의)</h6>
            <p>● "모임장"이라 함은 AI인공지능 정보공유 모임의 모임장을 의미합니다.<br>
                ● "모임 운영진"이라 함은 AI인공지능 정보공유 모임의 운영진을 의미합니다.<br>
                ● "정모 주최자"라 함은 AI인공지능 정보공유 모임에서 정모를 주최하는 주최자를 의미하며,<br>
                   정모 1회 참여한 모임원이라면 누구든지 정모 주최가 가능합니다(스터디 포함).</p>

            <h6>제 2조 (정모 회비 및 참가비)</h6>
            <p>● 정모회비의 정의 : 해당금액은 정모 진행에 필요한 금액을 모금한 것입니다. 정모 주최자가 사용내역을 공개하며, 잔여금액이 있을 경우 모든 참여자에게 균등하게 반환됩니다.<br>
                ● 참가비의 정의 : 해당금액은 정모진행자의 모임진행을 위한 준비 및 운영비(수고비포함)입니다.<br> 사용내역 공지는 진행하지 않습니다.</p>

            <h6>제 3조 (정모 진행)</h6>
            <p>● 정모는 정모 주최자가 정한 최소 인원이 충족될 경우에만 진행됩니다.</p>

            <h6>제 4조 (책임)</h6>
            <p>● 정모에서 발생한 분쟁이나 기타 문제에 대한 책임은 모두 정모 주최자가 갖습니다.</p>

            <h6>제 5조 (정모 회비 사용)</h6>
            <p>● 정모 중 회비 이상의 금액이 사용될 경우, 모든 참여자가 균등하게 부담합니다.</p>

            <h6>제 6조 (정모 참여와 취소)</h6>
            <p>● 정모 참여 취소 시 패널티비 만원은 정모주최자가 가지게 됩니다.</p>

            <!-- 추가된 내용 -->
            <h6>[오픈톡 운영]</h6>
            <p>● 소모임 오픈톡을 운영 중입니다.<br>
                ● AI에 관한 관심사와 정보를 공유하는 모임입니다.<br>
                ● 모임에서는 개별 프로젝트 진행을 권장하며, 진행 사항 및 홍보는 자유롭게 가능합니다.<br> 다만, 프로젝트에 대한 모든 권한과 책임은 주최자에게 있습니다.</p>
            <p>● 우측 오픈톡입장을 통해 참가하실 수 있습니다. ☞<a href="https://open.kakao.com/o/gEw0Wlnf">오픈톡입장</a></p>

            <h6>[모임 참여 규정]</h6>
            <p>● 과도한 영업 및 작업 금지<br>
                ● 타인에게 불쾌감을 주는 행동 금지 (예: 일베 용어 사용)<br>
                ● 사유 없이 한달에 1회 이상 오프모임 미참석<br>
                ● 가입 당일 자기소개서 미작성<br>
                ● 사유 없이 3회 이상 당일 모임 취소</p>

            <h6>[운영진 권한]</h6>
            <p> ● 모임원 중 운영진 추천 가능<br>
                ● 운영진 선출시 투표에 참여<br>
                ● 모임장 부재 시 운영진은 모임장 권한을 가짐<br>
                ● 모임 프로젝트 결과물에 대한 더 많은 지분 획득 가능
        </div>
    </div>

</div>

<!-- Include the Wallet Registration Popup -->
<jsp:include page="popup/wallet_login_popup.jsp" />


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