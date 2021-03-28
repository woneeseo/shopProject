<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script
 src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
 src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
 src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
 <link href="/resources/css/main.css" rel="stylesheet">
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
	#idCheck {
		margin-top: 10px;
	}
	
	h1{
		text-align: center;
		padding: 10px;
	}
	
	#inputAdd{
		margin-top: 10px;
	}

</style>
</head>
<body>


	<div id="gnb">
	<a href="/">Hello World</a>
		<div  class="text-right" >
			<c:choose>
				<c:when test="${login.userid != null}">
					<span class="glyphicon glyphicon-heart-empty" style="color: white;" aria-hidden="true"></span>
					<span id="login_log" style="border-bottom: 1px solid white;">${login.userid} 님, 환영합니다.</span>
					<span class="glyphicon glyphicon-heart-empty" style="color: white;" aria-hidden="true"></span>
					&nbsp;&nbsp;&nbsp;&nbsp;<button id="mypage_btn">마이페이지</button>
					<button id="logout_btn">로그아웃</button>
					<input type="hidden" value="${login.userid}" id="login_userid">
				</c:when>
				<c:otherwise>
					<button onclick="location.href='/member/login'">로그인</button><button onclick="location.href='/member/insert'">회원가입</button>
				</c:otherwise>
			</c:choose>	
			
		</div>
	</div>

	<div class="container logo">
		<a href="/">Hello World</a>
	</div>

	<div class="nav">
		<nav>
			<ul class="nav nav-tabs nav-justified">
				<li value="outer">OUTER</li>
				<li value="top">TOP</li>
				<li value="bottom">BOTTOM</li>
				<li value="bag">BAG</li>
				<li value="acc">ACC</li>
				<li value="qna">Q&A</li>
			</ul>
		</nav>
	</div>

	<div class="container">
		<div class="row">
			<h1 class="page-header">나의 Q&A</h1>
		</div>
		<div class="row" style="text-align: center;">
			<form class="form-horizontal" action="/board/update" method="post">

				<div class="form-group">
					<label for="title" class="col-sm-2 control-label">제목</label>
					<div class="col-sm-10">
						<input class="form-control" id="title" value="${dto.title}" name="title" required>
						<input type="hidden" value="${dto.boardId}" name="boardId">
					</div>
				</div>
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label">구분</label>
					<div class="col-sm-10">
						<select class="form-control" name="qna_type" required>
						<c:choose>
							<c:when test="${productName == ''}">
								<option value="1">1. 상품관련</option>
								<option value="2">2. 배송관련</option>
								<option value="3">3. 상품리뷰</option>
								<option value="4">4. 기타문의</option>		
							</c:when>
							<c:otherwise>
								<option value="3">3. 상품리뷰</option>
							</c:otherwise>
						</c:choose>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="productName" class="col-sm-2 control-label">상품명</label>
					<div class="col-sm-10">
						<input class="form-control" id="productName" value="${dto.productName}" readonly>
					</div>
				</div>
				<div class="form-group">
					<label for="inputId" class="col-sm-2 control-label">작성자</label>
					<div class="col-sm-10">
						<input class="form-control" id="inputId" value="${dto.userid}" name="userid" readonly>
					</div>
				</div>								

				<div class="form-group">
					<label  for="title" class="col-sm-2 control-label">내용</label>
					<div class="col-sm-10">
						<textarea rows="10" name="content" class="form-control">${dto.title}</textarea>
					</div>
				</div>			
								
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">	
						<button type="submit" class="btn btn-default submit">Q&A를 수정하기</button>
						<button type="submit" class="btn btn-default back_to_qna">Q&A로 돌아가기</button>
					</div>
				</div>
			</form>
		</div><!-- class=row -->
	</div><!-- class=container -->


<script type="text/javascript">

	$(document).ready(function() {
		
		$(".submit").click(function(event) {
			event.preventDefault();
	
			$("form").submit();
		});
		
		$(".back_to_qna").click(function(event) {
			event.preventDefault();
			location.assign("/product/qna");
		});

		
		$("li").on('click', function() {
			var productDist = $(this).attr("value");
			
			if (productDist == 'qna') {
				location.assign("/board/qna");
			} else {
				location.assign("/product/" + productDist);
			}		
		});
		
		
		$("#go_to_member_insert").click(function(event) {
			event.preventDefault();
			
			location.assign("/member/insert");
		});
		
		$("#mypage_btn").click(function(event) {
			event.preventDefault();
			var userid = $("#login_userid").val();
			
			location.assign("/member/read/" + userid);
		})
		
		$("#logout_btn").click(function(event) {
			event.preventDefault();
			
			var logout = confirm("로그아웃 하시겠습니까?");
			
			if (logout) {
				location.assign("/member/logout");
			}
		});
		
		$("#go_to_adminPage").click(function(event) {
			event.preventDefault();
			
			location.assign("/admin/orderedlist");
		
		});
	    
	});

</script>
</body>
</html>