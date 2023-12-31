$(document).ready(function() {
    var allImages = []; // Array to hold all images
    var itemsPerPage = 18; // Number of items per page
    var currentPage = 1; // Current page

    // Function to load all images from the server
    function loadAllImages() {
        $.ajax({
            url: "/imagelist",
            type: "GET",
            dataType: "json",
            success: function(imageList) {
                if (imageList.length > 0) {
                    var firstImage = imageList[0]; // 첫 번째 이미지 정보
                    updateMetaTags(firstImage); // 메타 태그 업데이트
                }

                allImages = imageList;
                displayImagesForPage(currentPage);
                setupPagination();
            },
            error: function(xhr, status, error) {
                console.error("Error loading images: ", error);
            }
        });
    }

    // Function to display images for a specific page
    function displayImagesForPage(page) {
        var imageGrid = $("#imageGrid");
        imageGrid.empty();

        var startIndex = (page - 1) * itemsPerPage;
        var endIndex = startIndex + itemsPerPage;
        var pageImages = allImages.slice(startIndex, endIndex);

        pageImages.forEach(function(image) {
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
    }

// Function to setup pagination
    function setupPagination() {
        var visibleLinks = 5; // 한 번에 표시할 최대 페이지 링크 수
        var totalPages = Math.ceil(allImages.length / itemsPerPage);
        var paginationDiv = $('#pagination');
        paginationDiv.empty();

        // 시작 및 종료 페이지 번호 계산
        var startPage = Math.max(currentPage - Math.floor(visibleLinks / 2), 1);
        var endPage = Math.min(startPage + visibleLinks - 1, totalPages);

        // "이전" 버튼
        if (startPage > 1) {
            paginationDiv.append(createPageLink(startPage - 1, '이전'));
        }

        // 페이지 번호
        for (var i = startPage; i <= endPage; i++) {
            var pageLink = createPageLink(i, i);
            if (i === currentPage) {
                pageLink.addClass('current-page');
            }
            paginationDiv.append(pageLink);
        }

        // "다음" 버튼
        if (endPage < totalPages) {
            paginationDiv.append(createPageLink(endPage + 1, '다음'));
        }

        updatePaginationLinks();
    }

    function createPageLink(page, text) {
        return $('<a>')
            .attr('href', '#')
            .text(text)
            .click(function(e) {
                e.preventDefault();
                currentPage = page;
                displayImagesForPage(page);
                setupPagination(); // 현재 페이지를 업데이트하고 페이징 링크를 다시 설정
            });
    }

    // 페이징 링크 스타일 업데이트 함수
    function updatePaginationLinks() {
        $('#pagination a').each(function() {
            var page = $(this).text();
            if (parseInt(page) === currentPage) {
                $(this).addClass('current-page');
            } else {
                $(this).removeClass('current-page');
            }
        });
    }

    // Initial call to load all images
    loadAllImages();

    function updateMetaTags(image) {
        $("meta[property='og:image']").attr("content", image.img_url);
        $("meta[property='og:title']").attr("content", image.crt_id + "님이 생성한 이미지");
        $("meta[property='og:description']").attr("content", image.prompt);
    }
});



