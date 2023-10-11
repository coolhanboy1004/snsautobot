<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Anime | Template</title>

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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        .hero-content {
            display: flex;
            align-items: center;
            gap: 10px; /* reduced gap */
            padding: 20px;
        }

        .nickname-label {
            font-size: 1.2em; /* slightly reduced font size */
            font-weight: bold;
            color: white;
            margin-right: 10px; /* added to give some space after the label */
        }

        #groupNickname {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            flex-grow: 1; /* allows the input to take up remaining space */
            width: 100px;
        }

        .register-btn {
            width: 100px;
            padding: 8px 15px; /* reduced padding */
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .register-btn:hover {
            background-color: #45a049;
        }
    </style>
    <script>
        function generateTitle() {
            var titleSubject = $('#titleSubject').val();
            $.ajax({
                url: '/generate-title',
                type: 'POST',
                data: {title_subject: titleSubject},
                success: function(response) {
                    alert('제목이 생성되어 저장되었습니다: ' + response);
                },
                error: function(error) {
                    alert('제목 생성에 실패했습니다.');
                }
            });
        }
    </script>
</head>

<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Header Section Begin -->
<header class="header">
    <div class="container">
        <div class="row">
            <div class="col-lg-2">
                <div class="header__logo">
                    <a href="./index.html">
                        <img src="../resources/img/logo.png" alt="">
                    </a>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="header__nav">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li class="active"><a href="./index.html">AI정보<span class="arrow_carrot-down"></span></a>
                                  <ul class="dropdown">
                                    <li><a href="./categories.html">&nbsp;&nbsp;뉴스</a></li>
                                    <li><a href="./anime-details.html">&nbsp;&nbsp;행사일정</a></li>
                                    <li><a href="./anime-watching.html">&nbsp;&nbsp;공지사항</a></li>
                                    <li><a href="./blog-details.html">&nbsp;&nbsp;FAQ&문의하기</a></li>
                                 </ul>
                            </li>
                            <li><a href="./categories.html">커뮤니티<span class="arrow_carrot-down"></span></a>
                                <ul class="dropdown">
                                    <li><a href="./categories.html">&nbsp;&nbsp;자유게시판</a></li>
                                    <li><a href="./anime-details.html">&nbsp;&nbsp;질문&답변</a></li>
                                    <li><a href="./anime-watching.html">&nbsp;&nbsp;가입인사</a></li>
                                    <li><a href="./blog-details.html">&nbsp;&nbsp;홍보</a></li>
                                </ul>
                            </li>
                            <li><a href="./blog.html">포럼<span class="arrow_carrot-down"></span></a>
                                <ul class="dropdown">
                                    <li><a href="./categories.html">&nbsp;&nbsp;GPT</a></li>
                                    <li><a href="./anime-details.html">&nbsp;&nbsp;BARD</a></li>
                                    <li><a href="./anime-watching.html">&nbsp;&nbsp;실사이미지</a></li>
                                    <li><a href="./blog-details.html">&nbsp;&nbsp;애니이미지</a></li>
                                    <li><a href="./signup.html">&nbsp;&nbsp;AI음성</a></li>
                                    <li><a href="./login.html">&nbsp;&nbsp;AI로봇</a></li>
                                 </ul>
                            </li>
                            <li><a href="#">정모일정</a></li>
                            <li><a href="#">채팅</a></li>
                            <li><a href="./walletregistration">지갑등록</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="col-lg-2">
                <div class="header__right">
                    <a href="#" class="search-switch"><span class="icon_search"></span></a>
                    <a href="./login.html"><span class="icon_profile"></span></a>
                </div>
            </div>
        </div>
        <div id="mobile-menu-wrap"></div>
    </div>
</header>
<!-- Header End -->

<%--
<label for="titleSubject">제목선정:</label>
<input type="text" id="titleSubject" name="titleSubject">
<button onclick="generateTitle()">제목생성하기</button>--%>

<!-- Hero Section Begin -->
<section class="hero">
    <div class="container">
        <div class="hero-content">
            <label for="groupNickname" class="nickname-label">닉네임:</label>
            <input type="text" id="groupNickname" name="groupNickname" placeholder="소모임 닉네임">
            <button class="register-btn">지갑등록</button>
        </div>
    </div>
</section>
<!-- Hero Section End -->

<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="trending__product">
                    <div class="row">
                        <div class="col-lg-8 col-md-8 col-sm-8">
                            <div class="section-title">
                                <h4>등록현황</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Section End -->

<!-- Footer Section Begin -->
<footer class="footer">
    <div class="page-up">
        <a href="#" id="scrollToTopButton"><span class="arrow_carrot-up"></span></a>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="footer__logo">
                    <a href="./index.html"><img src="../resources/img/logo.png" alt=""></a>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="footer__nav">
                    <ul>
                        <li class="active"><a href="./index.html">Homepage</a></li>
                        <li><a href="./categories.html">Categories</a></li>
                        <li><a href="./blog.html">Our Blog</a></li>
                        <li><a href="#">Contacts</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3">
                <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>

            </div>
        </div>
    </div>
</footer>
<!-- Footer Section End -->

<!-- Search model Begin -->
<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch"><i class="icon_close"></i></div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Search here.....">
        </form>
    </div>
</div>
<!-- Search model end -->

<!-- Js Plugins -->
<script src="../resources/js/jquery-3.3.1.min.js"></script>
<script src="../resources/js/bootstrap.min.js"></script>
<script src="../resources/js/player.js"></script>
<script src="../resources/js/jquery.nice-select.min.js"></script>
<script src="../resources/js/mixitup.min.js"></script>
<script src="../resources/js/jquery.slicknav.js"></script>
<script src="../resources/js/owl.carousel.min.js"></script>
<script src="../resources/js/main.js"></script>


</body>

</html>