<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.bsbmanagement.snsautobot.dto.ImageGalleryDTO" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AIWD - 라이센스키 발급</title>
    <!-- 기존 CSS 파일들 -->
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/plyr.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/style.css" type="text/css">

    <style>
        body {
            background-color: #0a0a0a;
            color: #ffffff;
        }
        .license-section {
            background-color: #1a1a1a;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(255,255,255,0.1);
            padding: 30px;
            margin-top: 30px;
            margin-bottom: 30px;
        }
        .license-info {
            background-color: #2a2a2a;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 30px;
        }
        .license-info p {
            margin-bottom: 10px;
            color: #ffffff;
        }
        .license-form {
            background-color: #1a1a1a;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(255,255,255,0.05);
            margin-bottom: 30px;
        }
        .license-form h4 {
            color: #ffffff;
            margin-bottom: 20px;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
        }
        .license-form form {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }
        .license-form .form-group {
            flex: 1 1 calc(25% - 15px);
            min-width: 200px;
        }
        .license-form input, .license-form select {
            width: 100%;
            padding: 12px;
            border: 1px solid #333;
            border-radius: 4px;
            background-color: #2a2a2a;
            color: #ffffff;
            transition: border-color 0.3s;
        }
        .license-form input:focus, .license-form select:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
        }
        .license-form button {
            width: 100%;
            padding: 12px;
            margin-top: 15px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .license-form button:hover {
            background-color: #0056b3;
        }
        .license-list {
            margin-top: 30px;
        }
        .license-list h4 {
            color: #ffffff;
            margin-bottom: 20px;
            border-bottom: 2px solid #28a745;
            padding-bottom: 10px;
        }
        .license-list table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            border: 1px solid #333;
            border-radius: 8px;
            overflow: hidden;
        }
        .license-list th, .license-list td {
            border: none;
            padding: 15px;
            text-align: left;
            color: #ffffff;
        }
        .license-list th {
            background-color: #007bff;
            font-weight: bold;
        }
        .license-list tr:nth-child(even) {
            background-color: #2a2a2a;
        }
        .license-list tr:hover {
            background-color: #333;
        }
        .coupang-ad-container {
            max-width: 800px;
            width: 100%;
            margin: 20px auto;
            text-align: center;
            background-color: #1a1a1a;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(255,255,255,0.1);
        }
        .coupang-ad-container iframe {
            width: 100%;
            height: 100px;
            max-width: 800px;
            border: none;
        }
        .ad-disclosure {
            font-size: 12px;
            color: #999;
            text-align: center;
            margin-top: 5px;
        }
        @media (max-width: 768px) {
            .license-form .form-group {
                flex: 1 1 100%;
            }
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp" />

<!-- Breadcrumb Begin -->
<div class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__links">
                    <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                    <a href="./categories.html">자료실</a>
                    <span>라이센스키 발급</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->

<!-- License Section Begin -->
<section class="license-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="license-info">
                    <h5><i class="fa fa-info-circle"></i> 결제 정보</h5><br>
                    <p><strong>우리은행 계좌번호:</strong> 1005-204-114882 (비에스비매니지먼트)</p>
                    <p><strong>요금:</strong> 1개월 2,000원 | 6개월 6,000원 | 1년 10,000원</p>
                    <p>입금 후 라이센스 요청을 해주시면 24시간 이내에 라이센스키가 발급됩니다.</p>
                </div>

                <div class="license-form">
                    <h4><i class="fa fa-key"></i> 라이센스 요청</h4>
                    <form id="licenseRequestForm">
                        <div class="form-group">
                            <input type="text" id="nickname" name="nickname" placeholder="닉네임" required>
                        </div>
                        <div class="form-group">
                            <input type="text" id="senderName" name="senderName" placeholder="송금자명" required>
                        </div>
                        <div class="form-group">
                            <input type="text" id="licenseDuration" name="licenseDuration" placeholder="구매 라이센스 개월 수" required>
                        </div>
                        <div class="form-group">
                            <input type="password" id="licensePassword" name="licensePassword" placeholder="라이센스 확인 비밀번호" required>
                        </div>
                        <button type="submit">라이센스 요청</button>
                    </form>
                </div>

                <div class="license-list">
                    <h4><i class="fa fa-list"></i> 요청 목록</h4>
                    <table>
                        <thead>
                        <tr>
                            <th>번호</th>
                            <th>요청일자</th>
                            <th>요청닉네임</th>
                            <th>진행상태</th>
                            <th>발급확인</th>
                        </tr>
                        </thead>
                        <tbody id="licenseRequestList">
                        <!-- 여기에 동적으로 요청 목록이 추가될 것입니다 -->
                        </tbody>
                    </table>
                </div>

                <!-- 쿠팡 파트너스 광고 컨테이너 -->
                <div class="coupang-ad-container">
                    <div id="coupang-ad-container"></div>
                    <script>
                        window.addEventListener('load', function() {
                            var iframe = document.createElement('iframe');
                            iframe.src = 'https://ads-partners.coupang.com/widgets.html?id=806728&template=carousel&trackingCode=AF7898361&subId=&width=800&height=100&tsource=';
                            iframe.width = 800;
                            iframe.height = 100;
                            iframe.scrolling = 'no';
                            iframe.setAttribute('referrerpolicy', 'unsafe-url');
                            document.getElementById('coupang-ad-container').appendChild(iframe);
                        });
                    </script>
                    <!-- 광고 고지 문구 -->
                    <div class="ad-disclosure">
                        이 포스팅은 쿠팡 파트너스 활동의 일환으로, 이에 따른 일정액의 수수료를 제공받습니다.
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- License Section End -->

<jsp:include page="footer.jsp" />

<!-- Js Plugins -->
<script src="../resources/js/jquery-3.3.1.min.js"></script>
<script src="../resources/js/bootstrap.min.js"></script>
<script src="../resources/js/player.js"></script>
<script src="../resources/js/jquery.nice-select.min.js"></script>
<script src="../resources/js/mixitup.min.js"></script>
<script src="../resources/js/jquery.slicknav.js"></script>
<script src="../resources/js/owl.carousel.min.js"></script>
<script src="../resources/js/main.js"></script>

<script>
    // 라이센스 요청 폼 제출 처리
    document.getElementById('licenseRequestForm').addEventListener('submit', function(e) {
        e.preventDefault();
        // 여기에 폼 제출 로직을 추가하세요
        console.log('라이센스 요청이 제출되었습니다.');
        // 예: 서버에 데이터 전송, 사용자에게 확인 메시지 표시 등
    });

    // 요청 목록을 동적으로 생성하는 함수 (예시)
    function populateLicenseRequestList() {
        const list = document.getElementById('licenseRequestList');
        // 여기에 서버에서 데이터를 가져와 목록을 채우는 로직을 추가하세요
        // 아래는 예시 데이터입니다
        const exampleData = [
            { id: 1, date: '2023-09-21', nickname: 'user1', status: '처리중', checkStatus: '대기중' },
            { id: 2, date: '2023-09-20', nickname: 'user2', status: '완료', checkStatus: '확인됨' },
            { id: 3, date: '2023-09-19', nickname: 'user3', status: '처리중', checkStatus: '대기중' },
        ];

        exampleData.forEach(item => {
            const row = document.createElement('tr');
            row.innerHTML = `
                    <td>${item.id}</td>
                    <td>${item.date}</td>
                    <td>${item.nickname}</td>
                    <td>${item.status}</td>
                    <td>${item.checkStatus}</td>
                `;
            list.appendChild(row);
        });
    }

    // 페이지 로드 시 요청 목록 생성
    window.addEventListener('load', populateLicenseRequestList);
</script>
</body>
</html>