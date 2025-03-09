<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<style>
    .user-profile-container {
        display: flex;
        align-items: center;
    }
    
    .user-profile-image {
        width: 32px;
        height: 32px;
        border-radius: 50%;
        margin-right: 8px;
    }
    
    .user-info-dropdown {
        position: relative;
    }
    
    .user-name {
        color: #000000;
        font-size: 14px;
        cursor: pointer;
        margin-right: 10px;
    }
    
    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #1d1e39;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
        border-radius: 4px;
        margin-top: 5px;
    }
    
    .dropdown-content a {
        color: white;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
        font-size: 14px;
    }
    
    .dropdown-content a:hover {
        background-color: #2a2b57;
    }
    
    .logout-btn {
        background: none;
        border: none;
        color: #000000;
        cursor: pointer;
        display: flex;
        align-items: center;
        font-size: 14px;
        background-color: #ffffff;
        padding: 6px 12px;
        border-radius: 4px;
        margin-left: 10px;
    }
    
    .logout-btn img {
        width: 16px;
        height: 16px;
        margin-right: 5px;
    }
</style>
</head>

<%
    String loggedInUser = (String) session.getAttribute("loggedInUser");
    String userPicture = (String) session.getAttribute("userPicture");
    String walletAddress = (String) session.getAttribute("walletAddress");
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
                    <div class="user-profile-container">
                        <% if (userPicture != null) { %>
                            <img src="<%= userPicture %>" alt="프로필" class="user-profile-image">
                        <% } %>
                        <div class="user-info-dropdown">
                            <span class="user-name"><%= loggedInUser %></span>
                            <button class="logout-btn" onclick="logoutUser()">
                                <img src="../resources/img/logout-icon.png" alt="로그아웃">
                                로그아웃
                            </button>
                            <div class="dropdown-content">
                                <a href="#">내 프로필</a>
                                <a href="#">설정</a>
                                <a href="#" onclick="logoutUser(); return false;">로그아웃</a>
                            </div>
                        </div>
                    </div>
                    <% } else { %>
                    <div class="login-buttons" style="display: flex; align-items: center;">
                        <button id="walletIcon" style="background: none; border: none; margin-right: 10px;"><span class="icon_wallet"></span></button>
                        <button id="googleLoginBtn" style="background: none; border: none; display: flex; align-items: center; padding: 6px 12px; background-color: #ffffff; border-radius: 4px; cursor: pointer;">
                            <img src="../resources/img/google_login_btn.png" alt="구글 로그인" style="width: 40px; height: 40px; margin-right: 8px;">
                        </button>
                    </div>
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
        
        // 사용자 드롭다운 메뉴 기능 추가
        const userNameElement = document.querySelector('.user-name');
        const dropdownContent = document.querySelector('.dropdown-content');
        
        if (userNameElement && dropdownContent) {
            userNameElement.addEventListener('click', function() {
                if (dropdownContent.style.display === 'none' || !dropdownContent.style.display) {
                    dropdownContent.style.display = 'block';
                } else {
                    dropdownContent.style.display = 'none';
                }
            });
            
            // 다른 곳을 클릭하면 드롭다운 메뉴 닫기
            document.addEventListener('click', function(event) {
                if (!event.target.matches('.user-name') && !event.target.closest('.dropdown-content')) {
                    dropdownContent.style.display = 'none';
                }
            });
        }
    });

    function showOpenTalkPassword(event) {
        event.preventDefault();
        alert("오픈톡 비밀번호: aiwd1004");
        window.open("https://open.kakao.com/o/gcsw0uvg", "_blank");
    }
</script>
<script src="../resources/js/google_login.js"></script>