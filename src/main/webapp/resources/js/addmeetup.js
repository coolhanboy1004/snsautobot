var loggedInUserNickname = '<%= loggedInUser %>'; // 여기서 JavaScript 변수에 값을 할당

// 팝업 열기
document.getElementById("addMeetupButton").addEventListener("click", function() {
    if (!loggedInUserNickname) {
        alert('로그인이 필요합니다!');
        return;
    }

    // Here, you can set the organizerNickname from the logged-in user, if required
    document.getElementById("organizerNickname").value = loggedInUserNickname;  // Replace with appropriate logic
    document.getElementById("meetupPopup").style.display = "block";
});

// 팝업 닫기
document.getElementById("closeMeetupPopup").addEventListener("click", function() {
    document.getElementById("meetupPopup").style.display = "none";
});

document.getElementById("addMeetup").addEventListener("click", async function() {
    const organizerNickname = document.getElementById("organizerNickname").value;
    const meetupName = document.getElementById("meetupName").value;
    const meetupDate = document.getElementById("meetupDate").value;
    const meetupTime = document.getElementById("meetupTime").value;
    const meetupLocationName = document.getElementById("meetupLocationName").value;
    const meetupLocationUrl = document.getElementById("meetupLocationUrl").value;
    const meetupCapacity = document.getElementById("meetupCapacity").value;
    const meetupPrice = document.getElementById("meetupPrice").value;

    try {
        const response = await axios.post('/add-meetup', {
            organizer_nickname: organizerNickname,
            name: meetupName,
            date: meetupDate,
            time: meetupTime,
            location_name: meetupLocationName,
            location_url: meetupLocationUrl,
            capacity: meetupCapacity,
            price: meetupPrice
        });

        if (response.data === "정모 추가 성공") {
            alert("정모가 성공적으로 추가되었습니다.");
            location.reload();
        } else {
            alert(response.data); // 실패 메시지 출력
        }
    } catch (error) {
        console.error("Error during meetup addition:", error);
    }
});