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
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="col-lg-2">
                <div class="header__right">
                    <% if (loggedInUser != null) { %>
                    <p style="color: white;">Welcome, <%= loggedInUser %>!</p>
                    <a href="./logout.html" title="Logout"><span class="icon_logout" style="color: white;"></span></a>
                    <% } else { %>
                    <p><a href="./login.html" style="color: white;">로그인해주세요.</a></p>
                    <a href="#" class="search-switch" style="color: white;"><span class="icon_search"></span></a>
                    <button id="walletIcon" style="color: white;"><span class="icon_wallet"></span></button>
                    <% } %>
                </div>
            </div>
        </div>
        <div id="mobile-menu-wrap"></div>
    </div>
</header>
<!-- Header End -->
</html>