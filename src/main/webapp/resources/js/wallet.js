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