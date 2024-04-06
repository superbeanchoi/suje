<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
<link href="./resources/css/resetStyle.css" rel="stylesheet" type="text/css">
<link href="./resources/css/main/mainRealTimeReviewStyle.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="./resources/js/main/mainRealTimeReviewModalJs.js"></script>
<title>SUJE</title>
<script type="text/javascript">
$(document).ready(function() {
    $(".thumbsUpBtn").click(function(event) {
        var mainId = '<%= session.getAttribute("mainId") %>';
        var icon = $(this).find(".thumbsUp");  
        var likeCount = $(this).siblings(".likeCount");
        var reviewOwnerId = $(this).data("review-owner-id"); 
        var reviewId = $(this).data("review-id"); 
        
        if (!mainId || mainId === "null") {
            alert("로그인 후 이용 가능합니다.");
            location.href = "mainLogin.do";
        } else if (mainId !== reviewOwnerId) {
            $.ajax({
                url: "reviewUpdate.do",
                type: "post", 
                data: { reviewId: reviewId }, 
                dataType: "json", 
                success: function(result) { 
                    likeCount.text(result.updatedLikes); 
                    setTimeout(function() {alert("게시물에 공감하였습니다.");}, 500); 
                },
                error: function(request, status, error) { 
                    alert("통신 에러가 발생했습니다: " + request.responseText); 
                }
            });
            icon.attr('src', './resources/img/mainReviewThumbsUpAfterImg.png');
            icon.animate({ 
                width: '+=20%',
                height: '+=20%'
            }, 'fast', function() {
                icon.attr('src', './resources/img/mainReviewThumbsUpImg.png');
                icon.animate({ 
                    width: '-=20%',
                    height: '-=20%'
                }, 'fast');
            });
        } else {
            alert("본인의 후기는 추천할 수 없습니다.");
        }
    });
});
</script>


</head>
<body>
    <%@ include file="../headerHtml/memberHeader.jsp"%>
    <div class="contentsWrap">
        <div class="contentsTitle">실시간 후기</div>
        <div class="contentsLine"></div>
        <div class="contentsReviewArea">
       <c:forEach var="review" items="${reviewList}">
	   	<table class="eachReviewTable">
         <tr>
            <td rowspan="4" class="eachReviewImgTd"><div><img src="././resources/img/DBServer/${review.rvp_spname}"/></div></td>
            <td colspan="2" class="eachReviewStoreProfileTd">
               <c:if test="${review.s_spname eq null}">
                   <div class="storeProfileImg"><img src="././resources/img/basicProfileIconBig.png"></div>
               </c:if>
               <c:if test="${review.s_spname ne null}">
                   <div class="storeProfileImg"><img src="././resources/img/DBServer/${review.s_spname}"></div>
               </c:if>
               <span>${review.s_name}</span>
            </td>
            <td class="eachReviewStoreBtnTd"><a href="">스토어 바로가기</a></td>
         </tr>
         <tr>
            <td colspan="2" class="eachReviewPayNumTd">
               <span>주문번호</span>
               <button>${review.fo_code}</button>
            </td>
         </tr>
         <tr>
            <td colspan="2" class="eachReviewMemberIdTd">STORE123</td>
            <td class="eachReviewScoreTd">
               <img src="././resources/img/mainReviewStarImg.png" /> 
               <span>${review.rv_star}</span>
               <button class="thumbsUpBtn" data-review-id="${review.rv_code}" data-review-owner-id="${review.m_id}"><img src="././resources/img/mainReviewThumbsUpImg.png" class="thumbsUp" /></button>
               <span class="likeCount">${review.rv_like}</span>
            </td>
         </tr>
         <tr>
            <td colspan="3" class="eachReviewContentsTd"><c:out value='${review.rv_content}' /></td>
         </tr>
      </table>
	</c:forEach>
        </div>
        <div class="pageingArea">
            <a href="#"><img src="././resources/img/pageLeftBtn.png" /></a>
            <c:forEach var="i" begin="1" end="${pageTotalCount}" step="1">
                <a href="viewRealTimeReview.do?page=${i}">${i}</a>
            </c:forEach>
            <a href="#"><img src="././resources/img/pageRightBtn.png" /></a>
        </div>
    </div>
    <!-- contentsWrap -->
    <footer></footer>
    <!-- 모달 -->
    <div class="finalOrderModalWrap">
        <div class="finalOrderModal">
            <%@ include file="./Modal/review.jsp"%>
        </div>
    </div>
</body>
</html>
