$(document).ready(function() {
    // 주문 테이블 페이징
    $(".orderTablePaging").each(function() {
        var tableRows = $(this).prev("table").find("tbody tr");
        var pageSize = 3; // 페이지당 표시할 데이터 수
        var pageCount = Math.ceil(tableRows.length / pageSize); // 전체 페이지 수

        // 페이지 버튼 생성
        $(this).append('<button class="prevBtn"><</button>'); // 이전 버튼
        for (var i = 0; i < pageCount; i++) {
            $(this).append('<button class="pageBtn">' + (i + 1) + '</button>');
        }
        $(this).append('<button class="nextBtn">></button>'); // 다음 버튼

        // 페이지 버튼 클릭 이벤트 처리
        $(this).on("click", ".pageBtn", function() {
            var pageNum = $(this).text(); // 클릭한 페이지 번호
            var startIndex = (pageNum - 1) * pageSize; // 시작 인덱스
            var endIndex = startIndex + pageSize; // 끝 인덱스

            // 해당 페이지에 해당하는 데이터 표시
            tableRows.hide().slice(startIndex, endIndex).show();
        });

        // 이전 버튼 클릭 이벤트 처리
        $(this).on("click", ".prevBtn", function() {
            var currentPage = $(this).siblings(".pageBtn.active").text();
            if (currentPage !== "1") {
                $(this).siblings(".pageBtn.active").removeClass("active").prev().addClass("active");
                var pageNum = $(this).siblings(".pageBtn.active").text(); // 클릭한 페이지 번호
                var startIndex = (pageNum - 1) * pageSize; // 시작 인덱스
                var endIndex = startIndex + pageSize; // 끝 인덱스

                // 해당 페이지에 해당하는 데이터 표시
                tableRows.hide().slice(startIndex, endIndex).show();
            }
        });

        // 다음 버튼 클릭 이벤트 처리
        $(this).on("click", ".nextBtn", function() {
            var currentPage = $(this).siblings(".pageBtn.active").text();
            if (currentPage !== pageCount.toString()) {
                $(this).siblings(".pageBtn.active").removeClass("active").next().addClass("active");
                var pageNum = $(this).siblings(".pageBtn.active").text(); // 클릭한 페이지 번호
                var startIndex = (pageNum - 1) * pageSize; // 시작 인덱스
                var endIndex = startIndex + pageSize; // 끝 인덱스

                // 해당 페이지에 해당하는 데이터 표시
                tableRows.hide().slice(startIndex, endIndex).show();
            }
        });

        // 초기 페이지 로드시 첫 번째 페이지 표시
        $(this).find(".pageBtn:first").addClass("active").click();
    });

    // 결제취소 테이블 페이징
    $(".cancelTablePaging").each(function() {
        var tableRows = $(this).prev("table").find("tbody tr");
        var pageSize = 3; // 페이지당 표시할 데이터 수
        var pageCount = Math.ceil(tableRows.length / pageSize); // 전체 페이지 수

        // 페이지 버튼 생성
        $(this).append('<button class="prevBtn"><</button>'); // 이전 버튼
        for (var i = 0; i < pageCount; i++) {
            $(this).append('<button class="pageBtn">' + (i + 1) + '</button>');
        }
        $(this).append('<button class="nextBtn">></button>'); // 다음 버튼

        // 페이지 버튼 클릭 이벤트 처리
        $(this).on("click", ".pageBtn", function() {
            var pageNum = $(this).text(); // 클릭한 페이지 번호
            var startIndex = (pageNum - 1) * pageSize; // 시작 인덱스
            var endIndex = startIndex + pageSize; // 끝 인덱스

            // 해당 페이지에 해당하는 데이터 표시
            tableRows.hide().slice(startIndex, endIndex).show();
        });

        // 이전 버튼 클릭 이벤트 처리
        $(this).on("click", ".prevBtn", function() {
            var currentPage = $(this).siblings(".pageBtn.active").text();
            if (currentPage !== "1") {
                $(this).siblings(".pageBtn.active").removeClass("active").prev().addClass("active");
                var pageNum = $(this).siblings(".pageBtn.active").text(); // 클릭한 페이지 번호
                var startIndex = (pageNum - 1) * pageSize; // 시작 인덱스
                var endIndex = startIndex + pageSize; // 끝 인덱스

                // 해당 페이지에 해당하는 데이터 표시
                tableRows.hide().slice(startIndex, endIndex).show();
            }
        });

        // 다음 버튼 클릭 이벤트 처리
        $(this).on("click", ".nextBtn", function() {
            var currentPage = $(this).siblings(".pageBtn.active").text();
            if (currentPage !== pageCount.toString()) {
                $(this).siblings(".pageBtn.active").removeClass("active").next().addClass("active");
                var pageNum = $(this).siblings(".pageBtn.active").text(); // 클릭한 페이지 번호
                var startIndex = (pageNum - 1) * pageSize; // 시작 인덱스
                var endIndex = startIndex + pageSize; // 끝 인덱스

                // 해당 페이지에 해당하는 데이터 표시
                tableRows.hide().slice(startIndex, endIndex).show();
            }
        });

        // 초기 페이지 로드시 첫 번째 페이지 표시
        $(this).find(".pageBtn:first").addClass("active").click();
    });

    // 반품요청 테이블 페이징
    $(".returnTablePaging").each(function() {
        var tableRows = $(this).prev("table").find("tbody tr");
        var pageSize = 3; // 페이지당 표시할 데이터 수
        var pageCount = Math.ceil(tableRows.length / pageSize); // 전체 페이지 수

        // 페이지 버튼 생성
        $(this).append('<button class="prevBtn"><</button>'); // 이전 버튼
        for (var i = 0; i < pageCount; i++) {
            $(this).append('<button class="pageBtn">' + (i + 1) + '</button>');
        }
        $(this).append('<button class="nextBtn">></button>'); // 다음 버튼

        // 페이지 버튼 클릭 이벤트 처리
        $(this).on("click", ".pageBtn", function() {
            var pageNum = $(this).text(); // 클릭한 페이지 번호
            var startIndex = (pageNum - 1) * pageSize; // 시작 인덱스
            var endIndex = startIndex + pageSize; // 끝 인덱스

            // 해당 페이지에 해당하는 데이터 표시
            tableRows.hide().slice(startIndex, endIndex).show();
        });

        // 이전 버튼 클릭 이벤트 처리
        $(this).on("click", ".prevBtn", function() {
            var currentPage = $(this).siblings(".pageBtn.active").text();
            if (currentPage !== "1") {
                $(this).siblings(".pageBtn.active").removeClass("active").prev().addClass("active");
                var pageNum = $(this).siblings(".pageBtn.active").text(); // 클릭한 페이지 번호
                var startIndex = (pageNum - 1) * pageSize; // 시작 인덱스
                var endIndex = startIndex + pageSize; // 끝 인덱스

                // 해당 페이지에 해당하는 데이터 표시
                tableRows.hide().slice(startIndex, endIndex).show();
            }
        });

        // 다음 버튼 클릭 이벤트 처리
        $(this).on("click", ".nextBtn", function() {
            var currentPage = $(this).siblings(".pageBtn.active").text();
            if (currentPage !== pageCount.toString()) {
                $(this).siblings(".pageBtn.active").removeClass("active").next().addClass("active");
                var pageNum = $(this).siblings(".pageBtn.active").text(); // 클릭한 페이지 번호
                var startIndex = (pageNum - 1) * pageSize; // 시작 인덱스
                var endIndex = startIndex + pageSize; // 끝 인덱스

                // 해당 페이지에 해당하는 데이터 표시
                tableRows.hide().slice(startIndex, endIndex).show();
            }
        });

        // 초기 페이지 로드시 첫 번째 페이지 표시
        $(this).find(".pageBtn:first").addClass("active").click();
    });
    
        $(".fleaTablePaging").each(function() {
        var tableRows = $(this).prev("table").find("tbody tr");
        var pageSize = 3; // 페이지당 표시할 데이터 수
        var pageCount = Math.ceil(tableRows.length / pageSize); // 전체 페이지 수

        // 페이지 버튼 생성
        $(this).append('<button class="prevBtn"><</button>'); // 이전 버튼
        for (var i = 0; i < pageCount; i++) {
            $(this).append('<button class="pageBtn">' + (i + 1) + '</button>');
        }
        $(this).append('<button class="nextBtn">></button>'); // 다음 버튼

        // 페이지 버튼 클릭 이벤트 처리
        $(this).on("click", ".pageBtn", function() {
            var pageNum = $(this).text(); // 클릭한 페이지 번호
            var startIndex = (pageNum - 1) * pageSize; // 시작 인덱스
            var endIndex = startIndex + pageSize; // 끝 인덱스

            // 해당 페이지에 해당하는 데이터 표시
            tableRows.hide().slice(startIndex, endIndex).show();
        });

        // 이전 버튼 클릭 이벤트 처리
        $(this).on("click", ".prevBtn", function() {
            var currentPage = $(this).siblings(".pageBtn.active").text();
            if (currentPage !== "1") {
                $(this).siblings(".pageBtn.active").removeClass("active").prev().addClass("active");
                var pageNum = $(this).siblings(".pageBtn.active").text(); // 클릭한 페이지 번호
                var startIndex = (pageNum - 1) * pageSize; // 시작 인덱스
                var endIndex = startIndex + pageSize; // 끝 인덱스

                // 해당 페이지에 해당하는 데이터 표시
                tableRows.hide().slice(startIndex, endIndex).show();
            }
        });

        // 다음 버튼 클릭 이벤트 처리
        $(this).on("click", ".nextBtn", function() {
            var currentPage = $(this).siblings(".pageBtn.active").text();
            if (currentPage !== pageCount.toString()) {
                $(this).siblings(".pageBtn.active").removeClass("active").next().addClass("active");
                var pageNum = $(this).siblings(".pageBtn.active").text(); // 클릭한 페이지 번호
                var startIndex = (pageNum - 1) * pageSize; // 시작 인덱스
                var endIndex = startIndex + pageSize; // 끝 인덱스

                // 해당 페이지에 해당하는 데이터 표시
                tableRows.hide().slice(startIndex, endIndex).show();
            }
        });

        // 초기 페이지 로드시 첫 번째 페이지 표시
        $(this).find(".pageBtn:first").addClass("active").click();
    });
});