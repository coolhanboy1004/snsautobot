async function joinMeetup(meetupId, nickname) {
    try {
        const response = await axios.post(`/join/${meetupId}?nickname=${encodeURIComponent(nickname)}`);
        console.log(response.data);
        alert(response.data);
        setTimeout(() => {
            window.scrollTo(0, 0);
            window.location.reload();
        }, 0); // alert이 닫힌 직후에 새로고침
    } catch (error) {
        console.error("Joining meetup failed:", error);
        if (error.response && error.response.data) {
            // 서버에서 보낸 실제 오류 메시지를 alert로 표시합니다.
            alert(error.response.data);
        } else {
            // 오류 메시지가 없을 경우 일반적인 오류 메시지를 표시합니다.
            alert("미트업 참여 중 문제가 발생했습니다.");
        }
    }
}

async function leaveMeetup(meetupId, nickname) {
    try {
        const response = await axios.delete(`/leave/${meetupId}`, {
            params: { nickname: nickname }
        });
        console.log(response.data);
        alert(response.data);
        setTimeout(() => {
            window.scrollTo(0, 0);
            window.location.reload();
        }, 0); // alert이 닫힌 직후에 새로고침
    } catch (error) {
        console.error("Leaving meetup failed:", error);
        // 에러 응답에서 서버가 제공한 구체적인 메시지를 보여줍니다.
        if (error.response && error.response.data) {
            alert(error.response.data);
        } else {
            // 에러 메시지가 없거나 응답 자체가 없는 경우 일반 오류 메시지를 사용합니다.
            alert("미트업 탈퇴 중 문제가 발생했습니다.");
        }
    }
}

// Event handler for join button
$(document).on('click', '.join-btn', async function() {
    if (!loggedInUserNickname || loggedInUserNickname.trim() === "" || loggedInUserNickname === "null") {
        alert('로그인이 필요합니다!');
        return;
    }

    var meetupId = $(this).data('meetup-id');
    var nickname = loggedInUserNickname;

    await joinMeetup(meetupId, nickname);
});

// Event handler for leave button
$(document).on('click', '.leave-btn', async function() {
    if (!loggedInUserNickname || loggedInUserNickname.trim() === "" || loggedInUserNickname === "null") {
        alert('로그인이 필요합니다!');
        return;
    }

    var meetupId = $(this).data('meetup-id');
    var nickname = loggedInUserNickname;

    await leaveMeetup(meetupId, nickname);
});

$(document).ready(function() {
    // 서버로부터 밋업 목록을 가져오기 위한 AJAX 호출
    $.ajax({
        url: "/getMeetups",
        type: "GET",
        dataType: "json",
        success: function(meetupsList) {
            console.log(meetupsList);

            // Sort the meetups by date in descending order
            meetupsList.sort(function(a, b) {
                return new Date(b.date) - new Date(a.date);
            });

            // 현재 문서의 기본 URL을 가져옵니다.
            var baseUrl = window.location.origin;

            // #meetupGrid 요소를 찾아서 내용을 비웁니다.
            var meetupGrid = $("#meetupGrid");
            meetupGrid.empty();

            // 받아온 밋업 목록을 이용해 HTML 요소를 동적으로 생성합니다.
            meetupsList.forEach(function(meetup) {
                // 만약 photoPath가 null이면 기본 이미지 경로를 설정합니다.
                var photoUrl = meetup.photoPath ? baseUrl + meetup.photoPath : baseUrl + '/default-image-path.jpg';
                console.log(photoUrl);

                // 밋업의 현재 참석 인원 수를 가져오는 AJAX 호출 (여기서는 예시로 meetup.currentAttendees를 사용합니다)
                var currentAttendees = (meetup.currentAttendees !== null && meetup.currentAttendees !== undefined) ? meetup.currentAttendees : "Loading...";
                console.log(currentAttendees);

                var formattedPrice = Math.floor(meetup.price);

                var meetupElement = `
                    <div class="col-lg-4 col-md-6 col-sm-12 mb-3">
                        <div class="meetup-item">
                            <div class="meetup-image" style="background-image: url('${photoUrl}');">
                                <!-- 배경 이미지로 밋업의 사진을 설정 -->
                            </div>
                            <div class="meetup-content">
                                <h5><a href="#">${meetup.name}</a></h5>
                                <p>Date: ${meetup.date}</p>
                                <p>Time: ${meetup.time}</p>
                                <p>Organized by: ${meetup.organizerNickname}</p>
                                <p>Location: ${meetup.locationName}</p>
                                <p>Price: ${formattedPrice}</p>
                                <p>Capacity: ${currentAttendees}/${meetup.capacity} people</p>
                                ${meetup.locationUrl ? `<a href="${meetup.locationUrl}" target="_blank">Location Details</a>` : ''}
                                <p><button class="join-btn" data-meetup-id="${meetup.id}">Join</button>
                                <button class="leave-btn" data-meetup-id="${meetup.id}">Leave</button></p>
                            </div>
                        </div>
                    </div>`;

                // 생성한 HTML 요소를 그리드에 추가합니다.
                meetupGrid.append(meetupElement);
            });
        },
        error: function(xhr, status, error) {
            console.error("An error occurred while fetching meetups: ", error);
        }
    });
});

