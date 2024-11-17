<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html lang="zxx">

<%
    String loggedInUser = (String) session.getAttribute("loggedInUser");
%>
<script>
    var loggedInUserNickname = '<%= loggedInUser %>';

    function showOpenTalkPassword(event) {
        event.preventDefault();
        alert("오픈톡 비밀번호: aiwd1004");
        window.open("https://open.kakao.com/o/gcsw0uvg", "_blank");
    }
</script>
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
                                    <li><a href="https://ayaans-organization.gitbook.io/aiwdwhitepaper/">&nbsp;&nbsp;AIWD토큰백서</a></li>
                                    <li><a href="https://somoim.friendscube.com/g/c9a3c5be-c800-11ee-b0b5-0ad2d97530c51">&nbsp;&nbsp;AIWD소모임</a></li>
                                    <li><a href="#" onclick="showOpenTalkPassword(event)">&nbsp;&nbsp;AIWD오픈톡</a></li>
                                </ul>
                            </li>
                            <li><a href="./categories.html">커뮤니티<span class="arrow_carrot-down"></span></a>
                                <ul class="dropdown">
                                    <li><a href="#">&nbsp;&nbsp;채팅🛠️</a></li>
                                    <li><a href="/airpggame">&nbsp;&nbsp;AIGAME🛠️</a></li>
                                    <li><a href="#">&nbsp;&nbsp;투표🛠️</a></li>
                                    <li><a href="./freeboard">&nbsp;&nbsp;자유게시판🛠️</a></li>
                                    <li><a href="./imagegallery">&nbsp;&nbsp;갤러리🛠️</a></li>
                                    <li><a href="./anime-details.html">&nbsp;&nbsp;질문&답변🛠️</a></li>
                                    <li><a href="./anime-details.html">&nbsp;&nbsp;회원사진🛠️</a></li>
                                    <li><a href="./anime-watching.html">&nbsp;&nbsp;가입인사🛠️</a></li>
                                    <li><a href="./blog-details.html">&nbsp;&nbsp;홍보🛠️</a></li>
                                </ul>
                            </li>
                            <li><a href="./blog.html">AI채널<span class="arrow_carrot-down"></span></a>
                                <ul class="dropdown">
                                    <li><a href="./categories.html">&nbsp;&nbsp;YOUTUBE🛠️</a></li>
                                    <li><a href="./anime-details.html">&nbsp;&nbsp;블로그🛠️</a></li>
                                    <li><a href="./anime-watching.html">&nbsp;&nbsp;사이트🛠️</a></li>
                                    <li><a href="./blog-details.html">&nbsp;&nbsp;AI커뮤니티🛠️</a></li>
                                    <li><a href="./blog-details.html">&nbsp;&nbsp;AI뉴스🛠️</a></li>
                                    <li><a href="./categories.html">&nbsp;&nbsp;텍스트🛠️</a></li>
                                    <li><a href="./anime-details.html">&nbsp;&nbsp;이미지🛠️</a></li>
                                    <li><a href="./anime-watching.html">&nbsp;&nbsp;음성🛠️</a></li>
                                    <li><a href="./blog-details.html">&nbsp;&nbsp;비디오🛠️</a></li>
                                    <li><a href="./signup.html">&nbsp;&nbsp;기타도구🛠️</a></li>
                                    <li><a href="./login.html">&nbsp;&nbsp;AI아바타🛠️</a></li>
                                </ul>
                            </li>
                            <li><a href="./blog.html">마켓<span class="arrow_carrot-down"></span></a>
                                <ul class="dropdown">
                                    <li><a href="./login.html">&nbsp;&nbsp;강의🛠️</a></li>
                                    <li><a href="./gptstore">&nbsp;&nbsp;GPT스토어🛠️</a></li>
                                    <li><a href="./blog-details.html">&nbsp;&nbsp;프롬프트🛠️</a></li>
                                    <li><a href="./anime-watching.html">&nbsp;스마트기기🛠️</a></li>
                                    <li><a href="./anime-details.html">&nbsp;&nbsp;NFT컨텐츠🛠️</a></li>
                                    <li><a href="./anime-watching.html">&nbsp;&nbsp;로봇🛠️</a></li>
                                    <li><a href="./signup.html">&nbsp;&nbsp;서적🛠️</a></li>
                                </ul>
                            </li>
                            <li><a href="./blog.html">자료실<span class="arrow_carrot-down"></span></a>
                                <ul class="dropdown">
                                    <li><a href="./login.html">&nbsp;&nbsp;유틸리티🛠️</a></li>
                                    <li><a href="./LicenseKeyIssuance">&nbsp;&nbsp;LIC발급🛠️</a></li>
                                    <li><a href="./login.html">&nbsp;&nbsp;개발도구🛠️</a></li>
                                    <li><a href="./login.html">&nbsp;&nbsp;모델🛠️</a></li>
                                    <li><a href="./categories.html">&nbsp;&nbsp;이미지🛠️</a></li>
                                    <li><a href="./anime-watching.html">&nbsp;&nbsp;텍스트🛠️</a></li>
                                    <li><a href="./signup.html">&nbsp;&nbsp;음원🛠️</a></li>
                                    <li><a href="./signup.html">&nbsp;&nbsp;각종신청양식🛠️</a></li>
                                </ul>
                            </li>
                            <li><a href="/meetupschedule">정모<span class="arrow_carrot-down"></span></a>
                                <ul class="dropdown">
                                    <li><a href="/meetupschedule">&nbsp;&nbsp;정모일정🛠️</a></li>
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

    function showOpenTalkPassword(event) {
        event.preventDefault();
        alert("오픈톡 비밀번호: aiwd1004");
        window.open("https://open.kakao.com/o/gcsw0uvg", "_blank");
    }
</script>