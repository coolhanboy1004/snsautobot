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