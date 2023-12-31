function isMobile() {
    return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
}

let requestKey;

async function logoutUser() {
    try {
        const response = await axios.get('/logout'); // 로그아웃 요청 경로가 '/logout' 이라고 가정합니다.

        if (response.data === "로그아웃 성공") {
            alert("로그아웃에 성공했습니다.");
            location.reload();
        } else {
            alert(response.data); // 실패 메시지 출력
        }
    } catch (error) {
        console.error("Error during logout:", error);
    }
}

async function loginUser(nickname, walletAddress) {
    try {
        const response = await axios.post('/login-wallet', { nickname: nickname, wallet_address: walletAddress });

        if (response.data === "로그인 성공") {
            alert("로그인에 성공했습니다.");
            location.reload();
            // 필요한 경우 추가 작업 수행
        } else {
            alert(response.data); // 실패 메시지 출력
        }
    } catch (error) {
        console.error("Error during login:", error);
    }
}

async function registerAndLoginUser(nickname, walletAddress) {
    try {
        // 주소가 DB에 있는지 확인
        const response = await axios.post('/check-wallet', { wallet_address: walletAddress });

        // 지갑 주소가 DB에 없으면 등록
        if (response.status === 200 && response.data === "지갑이 DB에 없습니다.") {
            await axios.post("/register-wallet", { nickname: nickname, wallet_address: walletAddress });
            alert("지갑 주소가 등록되었습니다.");
        }
    } catch (error) {
        if (error.response && error.response.status === 409 && error.response.data === "지갑이 이미 등록되어 있습니다.") {
            // 지갑 주소가 이미 DB에 있을 때의 처리 로직을 여기에 작성할 수 있습니다.
            console.log("지갑 주소가 이미 등록되어 있습니다.");
        } else {
            console.error("Error during wallet check and registration:", error);
            return;  // 에러 발생 시 loginUser 함수를 호출하지 않도록
        }
    }

    // 로그인 함수 호출
    loginUser(nickname, walletAddress);
}

function checkKlipAuthStatus() {
    // 주기적으로 Klip API 결과 조회하여 지갑 주소 가져오기
    const timer = setInterval(async () => {
        try {
            const resultResponse = await axios.get('https://a2a-api.klipwallet.com/v2/a2a/result?request_key=' + requestKey);
            console.log(resultResponse);

            if (resultResponse.data.status === "completed") {
                const walletAddress = resultResponse.data.result.klaytn_address;
                clearInterval(timer); // 폴링 중지

                // 지갑 주소를 확인하고 필요하면 등록한 후 로그인
                registerAndLoginUser(document.getElementById("nickname").value, walletAddress);
            }
        } catch (pollingError) {
            console.error("Failed to get Klip Auth result:", pollingError);
        }
    }, 2000); // 2초마다 확인
}

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

                // generateQR 버튼과 qrcode div 요소 제거
                const generateQRButton = document.getElementById("generateQR");
                const qrCodeDiv = document.getElementById("qrcode");
                if (generateQRButton) {
                    generateQRButton.parentNode.removeChild(generateQRButton);
                }
                if (qrCodeDiv) {
                    qrCodeDiv.parentNode.removeChild(qrCodeDiv);
                }
            } else {
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

