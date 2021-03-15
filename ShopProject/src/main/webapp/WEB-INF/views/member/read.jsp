<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 보기</title>
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
<style type="text/css">
	.btn {
		margin-top: 10px;
	}
	
	h1{
		text-align: center;
		padding: 10px;
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
				<li>ABOUT</li>
				<li>OUTER</li>
				<li>TOP</li>
				<li>BOTTOM</li>
				<li>BAG</li>
				<li>ACC</li>
				<li>SALE</li>
				<li>EVENT</li>
			</ul>
		</nav>
	</div>

	<div class="container">
		<div class="row">
			<h1>내 정보 보기</h1>
		</div>
		<div class="row">
			<div class="form-horizontal">
				<div class="form-group">
					<label for="inputId" class="col-sm-2 control-label">ID</label>
					<div class="col-sm-10">
						<input class="form-control" id="inputId" placeholder="ID" name="userid" value="${userInfo.userid}" readonly>
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputName" class="col-sm-2 control-label">Name</label>
					<div class="col-sm-10">
						<input class="form-control" id="inputName" placeholder="Name" name="username" value="${userInfo.username}" readonly>
					</div>
				</div>				
				<div class="form-group">
					<label for="inputAdd" class="col-sm-2 control-label">Address</label>
					<div class="col-sm-10">
						<input class="form-control" id="postcode" name="useraddress" value="${userInfo.postcode}" readonly>
						<input class="form-control" id="inputAdd" name="useraddress" value="${userInfo.useraddress}" readonly>
					</div>
				</div>				
				<div class="form-group">
					<label for="inputEmail" class="col-sm-2 control-label">Email</label>
					<div class="col-sm-10">
						<input type="email" class="form-control" id="inputEmail" placeholder="Email" name="email" value="${userInfo.email}" readonly>
					</div>
				</div>
				<div class="form-group">
					<label for="inputTel" class="col-sm-2 control-label">Tel</label>
					<div class="col-sm-10">
						<input type="tel" class="form-control" id="inputTel" placeholder="Tel" name="tel" value="${userInfo.tel}" readonly>
					</div>
				</div>
				<div class="form-group">
					<label for="inputBirth" class="col-sm-2 control-label">Bitrh</label>
					<div class="col-sm-10">
						<input class="form-control" id="birthDate"  name="birthDate" value="${userInfo.birthDate}" readonly>
					</div>
				</div>				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button class="btn btn-default" id="update_userInfo">회원정보 수정</button>
						<button class="btn btn-default" id="back_to_main">메인으로 돌아가기</button>
						<button class="btn btn-default" id=drop_out_of_member>회원 탈퇴하기</button>
					</div>
				</div>
			</div>
		</div><!-- class=row -->
	</div><!-- class=container -->
<script type="text/javascript">
	$(document).ready(function () {
		
		
		$("#drop_out_of_member").click(function(event) {
			event.preventDefault();
			
			var userid =  $("#inputId").val();
			location.assign("/member/delete/" + userid);
		});
		
		$("#back_to_main").click(function() {
			location.assign("/");
		});
		
		$("#update_userInfo").click(function() {
			var userid = $("#inputId").val();
			location.assign("/member/update/" + userid);
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
		
	});
</script>
</body>
</html>	