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

<div class="container mt-5">
    <div class="row">
        <div class="col-12">
            <div id="imageDetail">
                <!-- 이미지와 상세 정보를 표시할 요소 -->
                <img id="imageDisplay" src="" alt="Image" class="img-fluid">
                <div id="imageInfo"></div>
            </div>
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
<script>
    // URL에서 imgId 파라미터를 추출하는 함수
    function getQueryParam(param) {
        var search = window.location.search.substring(1);
        var params = new URLSearchParams(search);
        return params.get(param);
    }

    document.addEventListener("DOMContentLoaded", function() {
        var imgId = getQueryParam("imgId");
        if (imgId) {
            fetchImageDetails(imgId);
        }
    });

    function fetchImageDetails(imgId) {
        axios.get('/image-detail/' + imgId)
            .then(function(response) {
                const imageDetail = response.data;
                document.getElementById('imageDisplay').src = imageDetail.img_url;
                document.getElementById('imageInfo').innerHTML = '<p>Creator: ' + imageDetail.crt_id + '</p>' +
                    '<p>Prompt: ' + imageDetail.prompt + '</p>' +
                    '<p>Date: ' + new Date(imageDetail.crt_date).toLocaleDateString() + '</p>';
            })
            .catch(function(error) {
                console.log("Error fetching image details: ", error);
            });
    }
</script>

</body>

</html>