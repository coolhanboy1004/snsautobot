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
    <script src="../resources/js/klipSDK-2.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
    <script src="https://cdn.rawgit.com/davidshimjs/qrcodejs/gh-pages/qrcode.min.js"></script>
    <style>
        /* 팝업 기본 스타일 */
        #klipPopup {
            position: fixed;
            top: 20%;
            left: 35%;
            width: 30%;
            height: 50%;
            background-color: #ffffff;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0px 0px 15px #aaa;
            z-index: 1001;
            overflow: auto;
            text-align: center; /* 중앙 정렬 추가 */
            font-family: 'Mulish', sans-serif; /* 폰트 적용 */
        }

        /* 닫기 버튼 스타일 */
        .close-btn {
            position: absolute;
            right: 10px;
            bottom: 10px; /* top 속성을 bottom으로 변경 */
            cursor: pointer;
            font-size: 20px;
            color: #999; /* 색상 변경 */
        }

        .close-btn:hover {
            color: #333; /* 호버 시 색상 변경 */
        }

        /* 닉네임 입력 필드 스타일 */
        .nickname-input {
            display: flex;
            flex-direction: column;
            gap: 15px;
            margin-bottom: 15px;
        }

        #nickname, #checkNickname {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            transition: border 0.3s;
        }

        #nickname:focus, #checkNickname:focus {
            border: 1px solid #007BFF;
            outline: none;
        }

        #checkNickname {
            cursor: pointer;
            background-color: #007BFF;
            color: #fff;
            border: none;
        }

        #checkNickname:hover {
            background-color: #0056b3;
        }

        #nicknameStatus {
            font-size: 12px;
        }

        /* QR 코드 생성 버튼 스타일 */
        #generateQR {
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            background-color: #2c3e50;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s;
            display: inline-block; /* 인라인 블록으로 설정 */
        }

        #generateQR:hover {
            background-color: #34495e;
        }

        /* 모바일 환경 스타일 */
        @media screen and (max-width: 768px) {
            .nickname-input {
                margin-top: 30px; /* 모바일 환경에서의 상단 여백 추가 */
            }

            #klipPopup {
                top: 20%;
                left: 10%;
                width: 80%;
                height: 50%;
            }
        }

        /* 추가/수정 스타일 */
        #walletList {
            color: #ffffff; /* 글자색을 하얗게 */
            font-size: 14px; /* 글자 크기 줄임 */
            text-align: center; /* 글자를 중앙 정렬 */
            list-style-type: decimal; /* 순서를 붙임 */
        }
    </style>

</head>
<script>
    $(document).ready(function() {
        $.ajax({
            url: "/getWalletList",
            type: "GET",
            success: function(data) {
                console.log("Response Data:", data); // 응답 데이터 로깅
                var walletList = data;
                var listContent = "";

                if (walletList && walletList.length) { // walletList가 있는지 확인
                    walletList.forEach(function(wallet) {
                        listContent += "<li>Nickname: " + wallet.nickname + ", Wallet Address: " + wallet.wallet_address + "</li>";
                    });

                    $("#walletList").html(listContent);
                } else {
                    console.warn("No wallets found or invalid data structure.");
                }
            },
            error: function(error) {
                console.error("Failed to fetch wallet data:", error);
            }
        });
    });
</script>

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
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="col-lg-2">
                <div class="header__right">
                    <a href="#" class="search-switch"><span class="icon_search"></span></a>
                    <button id="walletIcon"><span class="icon_wallet"></span></button>
                </div>
            </div>
        </div>
        <div id="mobile-menu-wrap"></div>
    </div>
</header>
<!-- Header End -->

<h2>Wallet List:</h2>
<ul id="walletList">
    <!-- 지갑 데이터가 여기에 동적으로 삽입됩니다. -->
</ul>

<!-- Wallet Registration Popup -->
<div id="klipPopup" style="display: none;">
    <span class="close-btn" id="closePopup">X</span>
    <div class="nickname-input">
        <input type="text" id="nickname" placeholder="닉네임을 입력하세요." />
        <button id="checkNickname">중복확인</button>
        <span id="nicknameStatus" style="padding-left: 10px;"></span>
    </div>
    <p id="pcOnlyText" style="display: none;">닉네임 중복확인 후 QR코드를 생성후 <br>스마트폰으로 클립 인증을 진행하시면 됩니다.</p>
    <div id="qrcode"></div>
    <br>
    <br>
    <button id="generateQR">클립 인증용 QR 코드 생성하기</button> <!-- QR 코드 생성 버튼 -->
    <!-- 원래의 버튼을 이미지로 변경 -->
    <button id="klipAuthBtn" style="background: none; border: none; display: none;">
        <img src="../resources/img/button/clip_btn.png" alt="지갑등록하기" />
    </button>
</div>



<script>
    function isMobile() {
        return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
    }

    let requestKey;

    function checkKlipAuthStatus() {
        // 주기적으로 Klip API 결과 조회하여 지갑 주소 가져오기
        const timer = setInterval(async () => {
            try {
                const resultResponse = await axios.get('https://a2a-api.klipwallet.com/v2/a2a/result?request_key=' + requestKey);
                console.log(resultResponse);

                if (resultResponse.data.status === "completed") {
                    const walletAddress = resultResponse.data.result.klaytn_address;
                    clearInterval(timer); // 폴링 중지

                    // 지갑 주소와 닉네임을 백엔드에 전송
                    const nickname = document.getElementById("nickname").value;

                    const registerResponse = await axios.post("/register-wallet", { nickname: nickname, wallet_address: walletAddress });

                    if (registerResponse.data === "지갑이 이미 등록되어 있습니다.") {
                        alert(registerResponse.data);
                    } else {
                        // 인증이 완료되면 팝업을 닫습니다.
                        document.getElementById("klipPopup").style.display = "none";
                        alert("등록이 완료되었습니다.");
                    }

                }
            } catch (pollingError) {
                console.error("Failed to get Klip Auth result:", pollingError);
            }
        }, 2000); // 2초마다 확인
    }

    // 팝업 열기
    document.getElementById("walletIcon").addEventListener("click", async function() {
        const KLIP_PREPARE_URL = "https://a2a-api.klipwallet.com/v2/a2a/prepare";
        const bappName = 'AIWD';
        const successLink = 'http://119.197.55.23/index';
        const failLink = 'http://119.197.55.23/fail';

        try {
            const response = await axios.post(KLIP_PREPARE_URL, {
                bapp: {
                    name: bappName,
                },
                callback: {
                    success: successLink,
                    fail: failLink
                },
                type: "auth"
            });

            if (response.data.status === "prepared" && response.data.request_key) {
                requestKey = response.data.request_key;
                document.getElementById("klipPopup").style.display = "block";

                if (isMobile()) {
                    document.getElementById("klipAuthBtn").style.display = "block";
                    document.getElementById("generateQR").style.display = "none";
                    document.getElementById("pcOnlyText").style.display = "none";
                } else {
                    document.getElementById("pcOnlyText").style.display = "block";
                    document.getElementById("generateQR").style.display = "block";
                }
            } else {
                console.error("Klip preparation failed:", response.data);
            }
        } catch (error) {
            console.error("Failed to prepare Klip Auth:", error);
        }
    });

    // QR 코드 생성
    document.getElementById("generateQR").addEventListener("click", function() {
        const nickname = document.getElementById("nickname").value;
        if (!nickname) {
            alert("닉네임을 입력해주세요.");
            return;
        }

        if (!requestKey) {
            alert("먼저 Klip 인증을 준비해주세요.");
            return;
        }

        const deepLink = 'https://klipwallet.com/?target=/a2a?request_key=' + requestKey;
        new QRCode(document.getElementById("qrcode"), {
            text: deepLink,
            width: 128,
            height: 128,
            colorDark: "#000000",
            colorLight: "#ffffff",
            correctLevel: QRCode.CorrectLevel.H
        });

        checkKlipAuthStatus();
    });

    // 팝업 닫기
    document.getElementById("closePopup").addEventListener("click", function() {
        document.getElementById("klipPopup").style.display = "none";
    });


    document.getElementById("checkNickname").addEventListener("click", async function() {
        const nickname = document.getElementById("nickname").value;
        const statusElement = document.getElementById("nicknameStatus");

        if (!nickname) {
            alert("닉네임을 입력해주세요.");
            return;
        }

        try {
            const response = await axios.post('/check-nickname', { nickname: nickname });
            statusElement.textContent = "사용가능합니다.";
            statusElement.style.color = "green";
        } catch (error) {
            if (error.response && error.response.status === 409) {
                statusElement.textContent = "이미 사용중입니다.";
                statusElement.style.color = "red";
            } else {
                console.error("Error during nickname check:", error);
            }
        }
    });

    document.getElementById("klipAuthBtn").addEventListener("click", function() {
        const nickname = document.getElementById("nickname").value;
        if (!nickname) {
            alert("닉네임 중복확인후 지갑등록하기를 진행해주세요");
            return;
        }

        const deepLink = 'kakaotalk://klipwallet/open?url=https://klipwallet.com/?target=/a2a?request_key=' + requestKey;
        window.location.href = deepLink;
        checkKlipAuthStatus();
    });
</script>

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