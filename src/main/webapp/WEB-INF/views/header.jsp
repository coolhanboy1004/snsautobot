<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html lang="zxx">

<%
    String loggedInUser = (String) session.getAttribute("loggedInUser");
%>
<!-- Header Section Begin -->
<header class="header">
    <div class="container">
        <div class="row">
            <div class="col-lg-2">
                <div class="header__logo">
                    <a href="/memeberstatus">
                        <img src="../resources/img/logo.png" alt="">
                    </a>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="header__nav">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li class="active"><a href="/terms">AIWD정보<span class="arrow_carrot-down"></span></a>
                                <ul class="dropdown">
                                    <li><a href="/terms">&nbsp;&nbsp;AIWD약관</a></li>
                                    <li><a href="/memeberstatus">&nbsp;&nbsp;AIWD회원현황</a></li>
                                </ul>
                            </li>
                            <li><a href="./categories.html">커뮤니티<span class="arrow_carrot-down"></span></a>
                                <ul class="dropdown">
                                    <li><a href="#">&nbsp;&nbsp;채팅</a></li>
                                    <li><a href="#">&nbsp;&nbsp;투표</a></li>
                                    <li><a href="./categories.html">&nbsp;&nbsp;자유게시판</a></li>
                                    <li><a href="./anime-details.html">&nbsp;&nbsp;갤러리</a></li>
                                    <li><a href="./anime-details.html">&nbsp;&nbsp;질문&답변</a></li>
                                    <li><a href="./anime-details.html">&nbsp;&nbsp;회원사진</a></li>
                                    <li><a href="./anime-watching.html">&nbsp;&nbsp;가입인사</a></li>
                                    <li><a href="./blog-details.html">&nbsp;&nbsp;홍보</a></li>
                                </ul>
                            </li>
                            <li><a href="./blog.html">AI채널<span class="arrow_carrot-down"></span></a>
                                <ul class="dropdown">
                                    <li><a href="./categories.html">&nbsp;&nbsp;YOUTUBE</a></li>
                                    <li><a href="./anime-details.html">&nbsp;&nbsp;블로그</a></li>
                                    <li><a href="./anime-watching.html">&nbsp;&nbsp;사이트</a></li>
                                    <li><a href="./blog-details.html">&nbsp;&nbsp;AI커뮤니티</a></li>
                                    <li><a href="./categories.html">&nbsp;&nbsp;GPT</a></li>
                                    <li><a href="./anime-details.html">&nbsp;&nbsp;BARD</a></li>
                                    <li><a href="./anime-watching.html">&nbsp;&nbsp;실사이미지</a></li>
                                    <li><a href="./blog-details.html">&nbsp;&nbsp;애니이미지</a></li>
                                    <li><a href="./signup.html">&nbsp;&nbsp;AI음성</a></li>
                                    <li><a href="./login.html">&nbsp;&nbsp;AI로봇</a></li>
                                </ul>
                            </li>
                            <li><a href="./blog.html">자료실<span class="arrow_carrot-down"></span></a>
                                <ul class="dropdown">
                                    <li><a href="./login.html">&nbsp;&nbsp;유틸리티</a></li>
                                    <li><a href="./login.html">&nbsp;&nbsp;개발도구</a></li>
                                    <li><a href="./login.html">&nbsp;&nbsp;모델</a></li>
                                    <li><a href="./categories.html">&nbsp;&nbsp;이미지</a></li>
                                    <li><a href="./anime-watching.html">&nbsp;&nbsp;텍스트</a></li>
                                    <li><a href="./signup.html">&nbsp;&nbsp;음원</a></li>
                                </ul>
                            </li>
                            <li><a href="./blog.html">정모<span class="arrow_carrot-down"></span></a>
                                <ul class="dropdown">
                                    <li><a href="/meetupschedule">&nbsp;&nbsp;정모일정</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="col-lg-2">
                <div class="header__right">
                    <% if (loggedInUser != null) { %>
                    <div style="display: flex; align-items: center;">
                        <p style="color: white; font-size: small; margin-right: 10px;"><%= loggedInUser %> 님</p>
                        <a href="#" title="Logout" onclick="logoutUser(); return false;"><img src="../resources/img/logout-icon.png" alt="로그아웃" style="width: 20px; height: 20px; margin-bottom: 15px;"  ></a>
                    </div>
                    <% } else { %>
                    <button id="walletIcon"><span class="icon_wallet"></span></button>
                    <% } %>
                </div>
            </div>
        </div>
        <div id="mobile-menu-wrap"></div>
    </div>
</header>
<!-- Header End -->
</html>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var currentPath = window.location.pathname;

        var menuItems = document.querySelectorAll('.header__menu > ul > li');

        menuItems.forEach(function(item) {
            // 모든 메뉴 항목의 active 클래스를 제거합니다.
            item.classList.remove('active');

            var link = item.querySelector('a').getAttribute('href');
            if (currentPath.includes(link)) {
                item.classList.add('active');
            }
        });
    });
</script>