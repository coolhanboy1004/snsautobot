<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="AIWD Freeboard">
    <meta name="keywords" content="자유게시판, Community, Discussions">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AIWD 자유게시판</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">

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
                    <span>자유게시판</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->

<!-- Freeboard Section Begin -->
<section class="spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="product__page__content">
                    <div class="product__page__title">
                        <div class="row">
                            <div class="col-lg-5 col-md-5 col-sm-5">
                                <div class="section-title">
                                    <h4>자유게시판</h4>
                                </div>
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                                <div class="product__page__filter">
                                    <p>검색:</p>
                                    <input type="text" placeholder="검색어 입력..." id="searchInput" style="width:150px;">
                                    <button onclick="performSearch()" class="search-button"><span class="icon_search"></span></button>
                                    <button id="addMeetupButton">글쓰기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="postList">
                        <!-- 여기에 게시글 목록이 동적으로 추가될 것입니다. -->
                    </div>
                </div>
                <div class="freeboard__pagination" id="pagination"></div>
            </div>
        </div>
    </div>
</section>
<!-- Freeboard Section End -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../resources/js/bootstrap.min.js"></script>
<script src="../resources/js/player.js"></script>
<script src="../resources/js/jquery.nice-select.min.js"></script>
<script src="../resources/js/jquery.slicknav.js"></script>
<script src="../resources/js/owl.carousel.min.js"></script>
<script src="../resources/js/mixitup.min.js"></script>
<script src="../resources/js/main.js"></script>


</body>

</html>
