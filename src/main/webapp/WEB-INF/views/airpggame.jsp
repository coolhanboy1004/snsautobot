<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.bsbmanagement.snsautobot.dto.ImageGalleryDTO" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <%
        ImageGalleryDTO image = (ImageGalleryDTO) request.getAttribute("image");
        String imageUrl = image != null ? image.getImg_url() : "defaultImageUrl";
        String title = image != null ? image.getCrt_id() + "님이 생성한 이미지" : "기본 제목";
        String description = image != null ? image.getPrompt() : "기본 설명";
    %>
    <meta name="description" content="AIWD">
    <meta name="keywords" content="AI, GPT, DALLE, Stable-diffusion">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta property="og:url" content="http://aiwd.kro.kr/imagegallery">
    <meta property="og:title" content="<%= title %>">
    <meta property="og:type" content="website">
    <meta property="og:image" content="<%= imageUrl %>">
    <meta property="og:description" content="<%= description %>">

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
<body>
<div id="preloder">
    <div class="loader"></div>
</div>

<jsp:include page="header.jsp" />

<!-- Breadcrumb Begin -->
<div class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__links">
                    <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                    <a href="./categories.html">AI이미지갤러리</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->

<!-- Product Section Begin -->
<section class="product-page spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="product__page__content">
                    <div class="product__page__title">
                        <div class="row">
                            <div class="col-lg-5 col-md-5 col-sm-5">
                                <div class="section-title">
                                    <h4>AI이미지갤러리</h4>
                                </div>
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                                <div class="product__page__filter">
                                    <p>분류:</p>
                                    <select>
                                        <option value="">나비</option>
                                        <option value="">SD</option>
                                        <option value="">미드저니</option>
                                    </select>
                                    <a href="#" class="search-switch"><span class="icon_search"></span></a>
                                    <button id="addMeetupButton">새이미지추가</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="imageGrid">
                        <!-- 여기에 밋업 정보가 동적으로 추가될 것입니다. -->
                    </div>
                </div>
                <div class="product__pagination" id="pagination"></div>
            </div>
        </div>
    </div>
</section>
<!-- Product Section End -->

<div id="imageAddPopup" style="display: none;">
    <span class="close-btn" id="closeimageAddPopup">닫기</span>
    <div class="image-input">
        <!-- 이미지 업로드 -->
        <input type="file" id="photo" name="photo" />
        <!-- Hidden input to store organizer's nickname -->
        <input type="text" id="organizerNickname" name="organizerNickname" />
        <input type="text" id="name" name="name" placeholder="정모 이름을 입력하세요." />
        <input type="date" id="date" name="date" placeholder="날짜를 선택하세요." />
        <input type="time" id="time" name="time" placeholder="시간을 선택하세요." />
        <input type="number" id="price" name="price" placeholder="가격을 입력하세요." step="0.01" />
        <input type="text" id="locationName" name="locationName" placeholder="장소 이름을 입력하세요." />
        <input type="text" id="locationUrl" name="locationUrl" placeholder="장소 URL을 입력하세요." />
        <input type="number" id="capacity" name="capacity" placeholder="정모 인원을 입력하세요." />
    </div>
    <button id="addMeetup">이미지 추가하기</button>
</div>
<script>
    console.log(loggedInUserNickname);
</script>
<!-- Include the Wallet Registration Popup -->
<jsp:include page="popup/wallet_login_popup.jsp" />

<script src="../resources/js/imagegrid.js"></script>
<script src="../resources/js/wallet_login.js"></script>
<script src="../resources/js/addmeetup.js"></script>
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