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
    <meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<script src="../resources/js/wallet.js"></script>
<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<jsp:include page="header.jsp" />

<div class="container-fluid mt-5">
    <div class="row">
        <div class="col-12">
            <h5 class="mb-4">Member status</h5>
            <table id="walletTable" class="table">
                <thead>
                <tr>
                    <th>No</th>
                    <th>RANKS</th>
                    <th>Nickname</th>
                    <th>Wallet</th>
                    <th>Token Balance</th>
                </tr>
                </thead>
                <tbody>
                <!-- Wallet data will be inserted here -->
                </tbody>
            </table>
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