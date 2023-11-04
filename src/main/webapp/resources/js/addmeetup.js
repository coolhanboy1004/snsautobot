// 팝업 열기
document.getElementById("addMeetupButton").addEventListener("click", function() {
    if (!loggedInUserNickname || loggedInUserNickname.trim() === "" || loggedInUserNickname === "null") {
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
    const meetupPhoto = document.getElementById("photo").files[0];  // File input
    const meetupName = document.getElementById("name").value;
    const meetupDate = document.getElementById("date").value;
    const meetupTime = document.getElementById("time").value;
    const meetupPrice = document.getElementById("price").value;
    const meetupLocationName = document.getElementById("locationName").value;
    const meetupLocationUrl = document.getElementById("locationUrl").value;
    const meetupCapacity = document.getElementById("capacity").value;

    const formattedMeetupTime = meetupTime + ":00";

    const formData = new FormData();
    formData.append("organizerNickname", organizerNickname);
    formData.append("photo", meetupPhoto);  // Add the file to the form data
    formData.append("name", meetupName);
    formData.append("date", meetupDate);
    formData.append("time", formattedMeetupTime);
    formData.append("price", meetupPrice);
    formData.append("locationName", meetupLocationName);
    formData.append("locationUrl", meetupLocationUrl);
    formData.append("capacity", meetupCapacity);

    /* try {
         const response = await axios.post('/add-meetup', formData, {
             headers: {
                 'Content-Type': 'multipart/form-data'
             }
         });

         if (response.data === "정모 추가 성공") {
             alert("정모가 성공적으로 추가되었습니다.");
             location.reload();
         } else {
             alert(response.data); // 실패 메시지 출력
         }
     } catch (error) {
         console.log(error);
     }*/
    $.ajax({
        type: "POST",
        url: "/add-meetup",
        data: formData,
        processData: false,
        contentType: false,
        success: function (response) {
            console.log(response);
            if (response === "add success") {
                alert("정모가 성공적으로 추가되었습니다.");
                location.reload();
            } else {
                alert(response); // 실패 메시지 출력
            }
        },
        error: function (error) {
            console.log(error);
        }
    });
});
