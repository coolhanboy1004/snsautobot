$(document).ready(function() {
    $.ajax({
        url: "/getWalletList",
        type: "GET",
        success: function(data) {
            var walletList = data;
            var tableBody = $("#walletTable tbody");

            if (walletList && walletList.length) {
                walletList.forEach(function(wallet, index) {
                    // Determine which image to use
                    var iconImage;
                    if (index === 0) {
                        iconImage = "../resources/img/crown1.png";
                    } else if (index >= 1 && index <= 4) {  // 2번부터 5번까지
                        iconImage = "../resources/img/crown2.png";
                    } else {  // 6번부터는 아이콘 없음
                        iconImage = null;
                    }

                    // Add a row with the number, icon (if available), and nickname
                    tableBody.append(
                        "<tr data-address='" + wallet.wallet_address + "'>" +
                        "<td>" + (index + 1) + "</td>" +
                        (iconImage ? "<td><img src='" + iconImage + "' alt='Rank Icon' class='rank-icon' /></td>" : "<td></td>") +  // If iconImage is null, add an empty cell
                        "<td>" + wallet.nickname + "</td>" +
                        "<td title='" + wallet.wallet_address + "'>" + wallet.wallet_address + "</td>" +
                        "<td class='balance'>0</td>" +
                        "</tr>"
                    );

                    // Fetch balance for the wallet
                    $.ajax({
                        url: "http://localhost:3000/getTokenBalance/" + wallet.wallet_address,
                        type: "GET",
                        success: function(balanceData) {
                            var balance = balanceData.success ? Number(balanceData.balance).toLocaleString() : "Error";
                            $("tr[data-address='" + wallet.wallet_address + "'] .balance").text(balance);
                        }
                    });
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