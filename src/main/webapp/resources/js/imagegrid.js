$(document).ready(function() {
    $.ajax({
        url: "/imagelist", // 서버의 이미지 데이터 엔드포인트
        type: "GET",
        dataType: "json",
        success: function(imageList) {
            var imageGrid = $("#imageGrid");
            imageGrid.empty();

            imageList.forEach(function(image) {
                var imgId = image.img_id;
                var imageUrl = image.img_url; // 이미지 URL
                var crtDate = new Date(image.crt_date).toLocaleDateString(); // 생성 날짜
                var crtId = image.crt_id; // 생성자 ID
                var promptPreview = image.prompt.substring(0, 50) + '...'; // 프롬프트 미리보기

                var imageElement = `
                    <div class="col-lg-4 col-md-6 col-sm-12 mb-3 image-item" data-img-id="${imgId}">
                        <div class="meetup-item">
                            <div class="meetup-image" style="background-image: url('${imageUrl}');">
                                <!-- 배경 이미지로 이미지를 설정 -->
                            </div>
                            <div class="meetup-content">
                                <h5>Prompt Preview: ${promptPreview}</h5>
                                <p>img id: ${imgId}</p>
                                <p>Date: ${crtDate}</p>
                                <p>Creator: ${crtId}</p>
                                <button class="like-button">좋아요</button>
                                <button class="bookmark-button">북마크</button>
                            </div>
                        </div>
                    </div>`;
                imageGrid.append(imageElement);
            });

            imageGrid.on("click", ".image-item", function() {
                var imgId = $(this).data("img-id");
                window.location.href = '/imagedetail?imgId=' + imgId; // 컨트롤러 매핑된 경로로 수정
            });
        },
        error: function(xhr, status, error) {
            console.error("이미지를 불러오는 데 실패했습니다: ", error);
        }
    });
});