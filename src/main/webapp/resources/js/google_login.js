document.addEventListener('DOMContentLoaded', function() {
    const googleLoginBtn = document.getElementById('googleLoginBtn');
    
    if (googleLoginBtn) {
        googleLoginBtn.addEventListener('click', function() {
            // OAuth2 로그인 엔드포인트로 리다이렉트
            window.location.href = '/oauth2/authorization/google';
        });
    }
    
    // URL에서 error 파라미터 확인
    const urlParams = new URLSearchParams(window.location.search);
    const error = urlParams.get('error');
    
    // 에러가 있으면 (로그인 취소 등) 메인 페이지로 리다이렉트
    if (error) {
        window.location.href = '/';
        return;
    }
    
    // 페이지 로드 시 로그인 상태 확인
    checkLoginStatus();
});

// 로그인 상태 확인 함수
function checkLoginStatus() {
    fetch('/api/user/check')
        .then(response => response.json())
        .then(data => {
            if (data.loggedIn) {
                console.log('사용자 로그인 상태: 로그인됨');
                // 필요한 경우 추가 작업 수행
            } else {
                console.log('사용자 로그인 상태: 로그아웃됨');
                // 필요한 경우 추가 작업 수행
            }
        })
        .catch(error => {
            console.error('로그인 상태 확인 중 오류 발생:', error);
        });
}

function logoutUser() {
    // 로그아웃 확인 메시지
    if (confirm('로그아웃 하시겠습니까?')) {
        // 세션 종료를 위한 서버 요청
        fetch('/logout', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then(response => {
            if (response.ok) {
                // 로그아웃 성공 시 홈페이지로 리다이렉트
                window.location.href = '/';
            } else {
                console.error('로그아웃 실패');
            }
        })
        .catch(error => {
            console.error('로그아웃 요청 중 오류 발생:', error);
        });
    }
}