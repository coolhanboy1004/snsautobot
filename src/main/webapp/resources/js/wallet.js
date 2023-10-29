$(document).ready(function() {
    $.ajax({
        url: "/getWalletList",
        type: "GET",
        success: function(data) {
            console.log("Response Data:", data); // 응답 데이터 로깅
            var walletList = data;
            var tableBody = $("#walletTable tbody");

            if (walletList && walletList.length) {
                walletList.forEach(function(wallet, index) {
                    tableBody.append(
                        "<tr>" +
                        "<td>" + (index + 1) + "</td>" +
                        "<td>" + wallet.nickname + "</td>" +
                        "<td>" + wallet.wallet_address + "</td>" +
                        "</tr>"
                    );
                });
            } else {
                console.warn("No wallets found or invalid data structure.");
            }
        },
        error: function(error) {
            console.error("Failed to fetch wallet data:", error);
        }
    });
});