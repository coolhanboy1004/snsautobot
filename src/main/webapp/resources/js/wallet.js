$(document).ready(function() {
    // 스타일 적용을 위한 클래스 추가
    $('#walletTable').addClass('responsive-table');

    $.ajax({
        url: "/getWalletList",
        type: "GET",
        success: function(data) {
            var walletList = data;
            var tableBody = $("#walletTable tbody");

            if (walletList && walletList.length) {
                walletList.forEach(function(wallet, index) {
                    var iconImage;
                    if (index === 0) {
                        iconImage = "../resources/img/crown1.png";
                    } else if (index >= 1 && index <= 4) {
                        iconImage = "../resources/img/crown2.png";
                    } else {
                        iconImage = null;
                    }

                    // 각 셀에 클래스 추가
                    tableBody.append(
                        "<tr data-address='" + wallet.wallet_address + "'>" +
                        "<td class='no-cell'>" + (index + 1) + "</td>" +
                        "<td class='rank-cell'>" + (iconImage ? "<img src='" + iconImage + "' alt='Rank Icon' class='rank-icon' />" : "") + "</td>" +
                        "<td class='nickname-cell'>" + wallet.nickname + "</td>" +
                        "<td class='wallet-cell' title='" + wallet.wallet_address + "'>" + wallet.wallet_address + "</td>" +
                        "<td class='balance-cell balance'>0</td>" +
                        "</tr>"
                    );

                    // Balance 업데이트
                    $.ajax({
                        url: "http://localhost:3000/getTokenBalance/" + wallet.wallet_address,
                        type: "GET",
                        success: function(balanceData) {
                            var balance = balanceData.success ? Number(balanceData.balance).toLocaleString() : "Error";
                            $("tr[data-address='" + wallet.wallet_address + "'] .balance").text(balance);
                        }
                    });
                });
            }
        },
        error: function(error) {
            console.error("Failed to fetch wallet data:", error);
        }
    });
});