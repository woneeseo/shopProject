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
				<li value="outer">OUTER</li>
				<li value="top">TOP</li>
				<li value="bottom">BOTTOM</li>
				<li value="bag">BAG</li>
				<li value="acc">ACC</li>
				<li value="qna">Q&A</li>
			</ul>
		</nav>
	</div>


	<div class="container logo">
		<a href="/">Hello World</a>
	</div>

	<div class="container">

		<div class="row">
			<form class="form-horizontal" action="/member/loginPost" method="post">
				<div class="form-group">
					<label for="inputId" class="col-sm-4 control-label">ID</label>
					<div class="col-sm-4">
						<input id="inputId" class="form-control" name="userid" placeholder="ID">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPw" class="col-sm-4 control-label">Password</label>
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
		</div>

		<div class="row">
			<div class="form-group text-center">
				<h3>ID와 비밀번호를 잊어버리셨나요?</h3>
				<Br>
				<button class="btn btn-default" id="find_id">ID 찾기</button>
				<button class="btn btn-default" id="find_pw">비밀번호 찾기</button>
			</div>

			<div class="collapse form-horizontal" id="find_id_Collapse" style="text-align: center; margin-top: 50px;">
				<div class="form-group">
					<label for="input_username" class="col-sm-4 control-label">이름</label>
					<div class="col-sm-4">
						<input class="form-control input_username" name="username" placeholder="이름을 입력하세요.">
					</div>
				</div>
				<div class="form-group">
					<label for="input_email" class="col-sm-4 control-label">E-mail</label>
					<div class="col-sm-4">
						<input class="form-control input_email" name="email" placeholder="E-mail 주소를 입력하세요.">
					</div>
				</div>
				<div class="form-group">
					<button class="btn btn-default" id="btn-findId">ID찾기</button>
				</div>				
			</div>

			<div class="collapse form-horizontal" id="find_pw_Collapse" style="text-align: center; margin-top: 50px;">
				<div class="form-group">
					<label for="input_userid" class="col-sm-4 control-label">ID</label>
					<div class="col-sm-4">
						<input class="form-control" id="input_userid" name="userid" placeholder="ID를 입력하세요.">
					</div>
				</div>
				<div class="form-group">
					<label for="input_username" class="col-sm-4 control-label">이름</label>
					<div class="col-sm-4">
						<input class="form-control" id="input_username" name="username" placeholder="이름을 입력하세요.">
					</div>
				</div>				
				<div class="form-group">
					<label for="input_email" class="col-sm-4 control-label">E-mail</label>
					<div class="col-sm-4">
						<input class="form-control" id="input_email" name="email" placeholder="E-mail 주소를 입력하세요.">
					</div>
				</div>
				<div class="form-group">
					<button class="btn btn-default" id="btn-findPw">비밀번호 찾기</button>
				</div>				
			</div>		
		</div>
	</div>
	
	<div class="footer">
		<p>@copyright EZEN computer art academy</p>
	</div>
	
<script type="text/javascript">
	
	$(document).ready(function() {
		
		$("li").on('click', function() {
			var productDist = $(this).attr("value");
			
			if (productDist == 'qna') {
				location.assign("/board/qna");
			} else {
				location.assign("/product/" + productDist);
			}		
		});
		
		$("#find_id").click(function(event) {
			event.preventDefault();
			$("#find_id_Collapse").collapse("toggle");
			$("#find_pw_Collapse").collapse("hide");

		});
		
		$("#btn-findId").click(function(evnet) {
			event.preventDefault();
					
			var username = $(".input_username").val();
			var email = $(".input_email").val();
			
			
  			$.ajax({
				
				type : 'post',
				url : '/member/findId',
				data : {
					username : username,
					email : email
				},
				dataType : 'text',
				success : function(result) {
					
					if (result) {			
						var userid = result;
						alert("회원님의 ID는 "+ userid + "입니다.");
						$("#inputId").val(userid);
						$("#find_id_Collapse").collapse("hide");
						$(".input_username").val('');
						$(".input_email").val('');
					} else {
						alert("ID를 찾을 수 없습니다.");
						$(".input_username").val('');
						$(".input_email").val('');
					}
				}
			});  	
		});
		
		$("#find_pw").click(function(event) {
			event.preventDefault();
			$("#find_pw_Collapse").collapse("toggle");
			$("#find_id_Collapse").collapse("hide");
		});
		
		$("#btn-findPw").click(function(event) {
			event.preventDefault();
			
			var username = $("#input_username").val();
			var email = $("#input_email").val();
			var userid = $("#input_userid").val();
			
 			$.ajax({
				
				type : 'post',
				url : '/member/findPw',
				data : {
					userid : userid,
					username : username,
					email : email
				},
				dataType : 'text',
				success : function(result) {
					
					if (result) {
						var userpw = result;
						alert("회원님의 비밀번호는 "+ userpw + "입니다.");
		
						$("#find_pw_Collapse").collapse("hide");
						$("#input_userid").val('');
						$("#input_username").val('');
						$("#input_email").val('');
					} else {
						alert("비밀번호를 찾을 수 없습니다.");
					}
				}
			}); 
		});
		
		$("#login_btn").click(function(event) {
			event.preventDefault();
			
			var userid = $("#inputId").val();
			var userpw = $("#inputPw").val();
			
			$.ajax({
				
				type : 'post',
				url : '/member/loginPost',
				data : {
					userid : userid,
					userpw : userpw
				},
				dataType : 'text',
				success : function(result) {
					
					if (result == 'true') {
						console.log(result);
						location.assign("/");
					} else if (result == 'false') {
						alert("로그인에 실패하였습니다. ID와 비밀번호를 다시한번 확인 해 주세요.")
						console.log("로그인 실패");
						console.log(result);
						
					}
				}
			});
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