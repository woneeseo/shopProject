<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
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
	#buttons{
		text-align: auto;
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

	<div class="container logo">
		<a href="/">Hello World</a>
	</div>

	<div class="conatiner">

		<div class="row">
			<form class="form-horizontal" action="/member/loginPost" method="post">
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-4 control-label">ID</label>
					<div class="col-sm-4">
						<input id="inputId" class="form-control" name="userid" placeholder="ID">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-4 control-label">Password</label>
					<div class="col-sm-4">
						<input type="password" class="form-control" id="inputPw" name="userpw" placeholder="Password">
					</div>
				</div>
				
				<br>

				<div class="form-group" id="buttons">
					<div class="col-sm-offset-2 col-sm-10">
						<lable class="col-sm-4 control-label"></lable>
						<button type="submit" class="btn btn-default" id="login_btn">로그인</button>
						<button class="btn btn-default" id="go_to_member_insert">회원가입</button>
					</div>
				</div>
			</form>

			<div class="row form-group text-center">
				<h3>ID와 비밀번호를 잊어버리셨나요?</h3>
				<Br>
				<button class="btn btn-default" id="find_id">ID 찾기</button>
				<button class="btn btn-default" id="find_pw">비밀번호 찾기</button>
			</div>
	</div>
</div>
	
<script type="text/javascript">
	
	$(document).ready(function() {

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