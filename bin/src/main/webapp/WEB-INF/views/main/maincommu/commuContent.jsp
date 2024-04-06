<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
<link href="./resources/css/resetStyle.css" rel="stylesheet" type="text/css">
<link href="./resources/css/main/maincommu/commuContent.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <script src="./resources/js/main/commuContentJs.js"></script> -->
<script type="text/javascript">
$(function() {

<% String customerId = (String)session.getAttribute("mainId"); %>

<% if (request.getAttribute("replyComple") != null) { %>
	var replyComple = "<%= request.getAttribute("replyComple") %>";
	alert(replyComple);
<% } %>
	
	//좋아요 버튼 클릭 이벤트
	$('.postEtc button').click(function() {
		
		var icon = $(this).find('img');
		
		if("<%= customerId %>" == "null" ) {
			alert("로그인 후 이용 가능합니다.");
			location.href="mainLogin.do";
		} else if("<%= customerId %>" == "${commContent.m_id}") {
			alert("본인의 게시물에는 좋아요를 누를 수 없습니다.");
		} else {
			$.ajax({
				url : "likeClick.do",
				type : "post",
				data: { comup_code : ${commContent.comup_code} },
				success : function(){
					icon.attr('src', './resources/img/commLikeAfterIcon.png');
					icon.animate({ 
						width: '+=20%',
						height: '+=20%'
					}, 'fast', function() {
						icon.attr('src', './resources/img/commLikeBeforeIcon.png');
						icon.animate({ 
							width: '-=20%',
							height: '-=20%'
						}, 'fast');
					});
					
					$.ajax({
						url : "likeReView.do",
						type : "post",
						data: { comup_code : ${commContent.comup_code} },
						dataType : "json",
						success : function(result){
							$(".postLikeNum").text(result);
							setTimeout(function() {alert("게시물에 공감하였습니다.");}, 500);
						},
						error: function(request, status, error) {
							alert("통신 에러가 발생했습니다22 : "+request+"/"+status+"/"+error);
						}
					});
				},
				error: function(request, status, error) {
					alert("통신 에러가 발생했습니다11 : "+request+"/"+status+"/"+error);
				}
			});
		}
	});
	
	//댓글 작성 이벤트 
	$(".replyWrite").submit(function(event) {
		event.preventDefault();
		var commentText = $('.myCommentText').val().trim();
		if (!commentText) {
			alert('댓글 내용을 작성하세요.');
		} else {
			$(this).unbind('submit').submit();
		}
	});
	
	$('.myCommentText').on('input', function() {
		var text = $(this).val();
		var maxLength = 50;
		if (text.length > maxLength) {
			alert("댓글의 글자 수는 50자를 초과할 수 없습니다.");
			$(this).val(text.substring(0, maxLength));
		}
	});
	
	//포스트 팝업 열기
	$(document).on('click', '.postSubmenu', function() {
		var postwriterArea = $(this).closest('.postwriterArea');
		var postDetailBtnContainer = postwriterArea.find('.postDetailBtn-container');
		postDetailBtnContainer.slideToggle(100);
	});
	
	//포스트 삭제하기
	$('.postDelete').click(function(event) {
		event.preventDefault();
		$('.postDetailBtnForm').attr('action', 'postDelete.do');
		$('.postDetailBtnForm').submit();
	});
	
	//포스트 수정하기
	$('.postModify').click(function(event) {
		event.preventDefault();
		$('.postDetailBtnForm').attr('action', 'postModifyPage.do');
		$('.postDetailBtnForm').submit();
	});
	
	//댓글 팝업 열기
	$(document).on('click', '.commentsubmenu', function() {
		var postComment = $(this).closest('.postComment');
		var commentDetailBtn = postComment.find('.commentDetailBtn');
		$('.commentDetailBtn').not(commentDetailBtn).slideUp(100);
		commentDetailBtn.slideToggle(100);
	});

});

</script>
<title>SUJE</title>
</head>
<body>
	<%@ include file="../../headerHtml/memberHeader.jsp"%>
	<div class="contentsWrap">
		<div class="contents">
			<div class="postCategory">
				<a href="viewMainComm.do">전체</a>
				<img class="postCategoryArrow" src="./resources/img/mainSubMenuBtn.png">
				<a href="communityMain.do?page=1&cCate=${commContent.comuc_name}">${commContent.comuc_name}</a>
			</div>
			<!-- postCategory -->
			<div class="postbar"></div>
			<div class="postTitle">${commContent.comup_title}</div>
			<div class="postwriterArea">
				<img class="postwriterProfile" src="./resources/img/basicProfileIcon.png">
				<span class="postwriterNickname">${commContent.m_id}</span>
				<span class="postDate">
					<fmt:parseDate value="${commContent.comup_date}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" />
					<fmt:formatDate value="${parsedDate}" pattern="yyyy/MM/dd HH:mm" />
				</span>
				<button class="postSubmenu">
					<img src="./resources/img/commuCommentSubmenu.png">
				</button>
				<!-- 로그인 아이디가 작성자 아이디와 일치할 시 호출 -->
				<c:if test="${commContent.m_id eq sessionScope.mainId}">
					<div class="postDetailBtn-container">
						<form class="postDetailBtnForm">
							<input name="comup_code" type="hidden" value="${commContent.comup_code}">
					   		<button class="postDetailBtn postDelete">게시글 삭제하기</button>
					   		<button class="postDetailBtn postModify">게시글 수정하기</button>
						</form>
					</div>
				</c:if>
			</div>
			<!-- postwriterArea -->
			
			<div class="postbar"></div>
			<!-- 이미지 정보가 존재할시 호출 -->
			<c:if test="${commContentImgList ne null}">
				<div class="postMainImg">
					<c:forEach items="${commContentImgList}" var="MainCommVO">
						<img alt="POST 사진" src="./resources/img/DBServer/${MainCommVO.cpp_spname}">
					</c:forEach>
				</div>
			</c:if>
			<div class="postContent">${commContent.comup_content}</div>
			
			<div class="postEtc">
				<img src="./resources/img/commViewsIcon.png">
				<span class="postViewsNum">${commContent.comup_count}</span>
				<button>
					<img src="./resources/img/commLikeBeforeIcon.png">
				</button>
				<span class="postLikeNum">${commContent.comup_like}</span>
				<img src="./resources/img/commCommentIcon.png">
				<span class="postCommentNum">${commContent.reCnt}</span>
			</div>
			<!-- postEtc -->
			
			<div class="postbar"></div>
			<div class="myComment">
				<!-- 세션에 계정정보가 존재할 시 노출 -->
				<c:if test="${mainId ne null}">
					<form action="replyWrite.do" class="replyWrite">
						<div class="writerProfile">
							<input type="hidden" name="comup_code" value="${commContent.comup_code}"/>
							<input type="hidden" name="m_id" value="<%= customerId %>"/>
							<!--마이페이지링크 -->	
							<a href="customerMyPage.do?id=<%= customerId %>"> 
								<img class="postwriterProfile" src="./resources/img/basicProfileIcon.png">
							</a>
							<span class="myNickname"><%= customerId %></span>
						</div>
						<textarea name="comur_content" class="myCommentText" placeholder="댓글을 남겨보세요"></textarea>
						<button class="myCommentBtn" type="submit">작성</button>			
					</form>
				<!-- myComment -->
				</c:if>
				<!-- 세션에 계정정보가 존재하지 않을 시 노출 호출 -->
				<c:if test="${mainId eq null}">
					<textarea class="myCommentTextNotLogin" placeholder="댓글을 작성하려면 로그인해주세요" readonly="readonly"></textarea>
				<!-- myComment -->
				</c:if>
			</div>
			
			<div class="postCommentAll">
			<c:forEach items="${replyList}" var="MainCommVO">
				<div class="postComment">
					<div class="commentWriterArea">
						<div class="commentwriterProfile">
							<img class="postwriterProfile" src="./resources/img/basicProfileIcon.png">
							<span class="commentwriterNickname">${MainCommVO.m_id}</span>
							<span class="commentDate">
								<fmt:parseDate value="${MainCommVO.comur_date}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" />
								<fmt:formatDate value="${parsedDate}" pattern="yyyy/MM/dd HH:mm" />
							</span>
								<button class="commentsubmenu">
									<img src="./resources/img/commuCommentSubmenu.png">
								</button>
						</div>
						<!-- commentwriterProfile -->
					</div>
					<!-- commentWriterArea -->
					<div class="postCommentText">${MainCommVO.comur_content}</div>
					<!-- 로그인 아이디가 댓글 작성자 아이디와 일치할 시 호출 -->
					<c:if test="${MainCommVO.m_id eq sessionScope.mainId}">
						<form action="replyDelete.do">
							<input name="comup_code" type="hidden" value="${MainCommVO.comup_code}">
							<input name="comur_code" type="hidden" value="${MainCommVO.comur_code}">
							<button class="commentDetailBtn" type="submit">댓글 삭제하기</button>
						</form>
					</c:if>
				</div>
				<!-- postComment -->
			</c:forEach>
			</div>
			<!-- postCommentAll -->	
			<div class="postbar"></div>
		</div>
		<!-- contents -->
	</div>
	<!-- contentsWrap -->
<footer></footer>
</body>
</html>