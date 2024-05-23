<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="AIWD">
    <meta name="keywords" content="AI, GPT, DALLE, Stable-diffusion">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="naver-site-verification" content="6e1a09765d57b7140ee07999e3bca4aac79f37d6" />
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
            <h5 class="mb-4">개인정보처리방침</h5>

            <h6>제 1조 (목적)</h6>
            <p>● 이 개인정보처리방침은 AIWD의 모임장 Ayaan이 운영하는 BSBMANAGEMENT에서 AIWD에 제공하는 서비스 aiwd.kro.kr의 개인정보 보호와 관련하여, 회사의 개인정보 처리방침, 개인정보 처리 방법 및 조치 사항을 규정함을 목적으로 합니다.</p>

            <h6>제 2조 (개인정보 수집항목 및 수집방법)</h6>
            <p>● 수집항목 : 회원 가입 과정에서 이메일, 닉네임, Public Key등의 정보가 수집될 수 있습니다.<br>

            <h6>제 3조 (개인정보의 사용)</h6>
            <p>● AIWD는 aiwd.kro.kr 서비스 사용을 위해서만 개인정보를 사용합니다. </p>

            <h6>제 4조 (개인정보의 제3자 제공)</h6>
            <p>● AIWD는 원칙적으로 이용자의 개인정보를 제3자에게 제공하지 않습니다. 다만, 이용자들이 사전에 동의한 경우나 법률의 규정에 의한 경우 등 예외적인 상황에서만 개인정보를 제공할 수 있습니다.</p>

            <h6>제 5조 (개인정보의 파기)</h6>
            <p>● AIWD의 회원 가입 외에 설문조사, 행사신청 등 수집된 개인정보의 파기절차 및 방법은 다음과 같습니다. 개인정보는 수집 및 이용목적이 달성된 후 지체없이 파기합니다. </p>

            <h6>제 6조 (이용자 및 법정대리인의 권리와 그 행사방법)</h6>
            <p>● 이용자는 언제든지 등록되어 있는 자신의 개인정보를 조회하거나 수정할 수 있으며, 가입해지를 요청할 수도 있습니다. 또한, 개인정보의 오류에 대한 정정을 요청할 수 있습니다.</p>

            <h6>부칙</h6>
            <p>● 이 개인정보처리방침은 2024년 6월 1일부터 적용됩니다.</p>
        </div>
    </div>
</div>


<!-- Include the Wallet Registration Popup -->
<jsp:include page="popup/wallet_login_popup.jsp" />

<!-- 여기에 footer.jsp를 포함 -->
<jsp:include page="footer.jsp" />


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