<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
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
	
	h1, h3, h4{
		text-align: center;
		padding: 10px;
	}
	
	.deleteForm{
		margin-left: 280px;
		width: 600px;
	}
	.subLogo{
		font-size: 3em;
		text-align: center;
		padding: 30px 0;
		font-family: Arial Black;
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
					&nbsp;&nbsp;|
					<button>마이페이지</button>
					&nbsp;&nbsp;|
					<button onclick="location.href='/member/logout'">로그아웃</button>
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
>
	<div class="container">

		<div class="row">
			<h1>정말로 탈퇴하시겠어요?</h1>
			<h3>탈퇴하기 버튼을 누르시면 적립된 포인트 및 모든 정보가 사라집니다.</h3>
		</div>
		<!-- class=row -->
		<div class="container">
			<h4>탈퇴를 원하시면 비밀번호를 입력해주세요.</h4>
			<br>
		</div>

		<div class="row deleteForm">
		<form class="form-horizontal" action="/member/delete" method="post">
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">ID</label>
				<div class="col-sm-10">
					<input class="form-control" id="inputId" name="userid" value="${userInfo.userid}" readonly>
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">Password</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="inputPassword" name="userpw" required>
					<input type="hidden" id="realUserPw" value="${userInfo.userpw}">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<div class="checkbox">
						<label><input type="checkbox" id="checkbox" required>탈퇴시의 주의사항을 확인했습니다.</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default" id="drop_out_of_member">탈퇴하기</button>
				</div>
			</div>
		</form>
		</div>
		
		<div class="row">
			<p class="subLogo">Hello World</p>
		</div>
	</div><!-- class=container -->
	
<script type="text/javascript">
	$(document).ready(function() {

		$("#drop_out_of_member").click(function(event) {
			event.preventDefault();
			
			var choice = confirm("정말로 탈퇴하시겠습니까?");
			/* 컨펌창에서 확인을 누르면 */
			if (choice) {
				
				var userpw = $("#inputPassword").val(); /* input으로 입력받은 비밀번호 값 */
				var realUserPw = $("#realUserPw").val(); /* DB에서 넘겨받은 비밀번호 값 */ 
				var isChecked = $("#checkbox").prop("checked"); /* 체크박스의 체크 여부를 가져오는 변수 */
				
				
				if (userpw == '') {
					/* 1. 비밀번호 입력란이 공란일 때 alert을 띄운 뒤 비밀번호 입력란에 focus */
					alert("비밀번호를 입력해주세요.");
					$("#inputPassword").focus();
				
				} else {
					/* 2. 비밀번호는 입력되어있는데 체크박스가 체크 안 된 경우 */
					if (!isChecked) { /* isChecked의 값이 false인 경우 */
						
						alert("탈퇴 동의란에 체크 해주세요.");
						/* alert을 띄워 동의란에 체크하도록 함 */
						
					} else {
						/* 3. 비밀번호, 체크박스 모두 입력되어있는데, DB에 저장된 비밀번호와 다른 경우 */
						if (userpw != realUserPw) {
							/* alert창을 띄워 비밀번호를 확인하게 한 뒤, 비밀번호 입력란에 focus */
							alert("잘못된 비밀번호입니다.");
							$("#inputPassword").focus();
						} else {
							/* 세가지 경우 모두에 해당하지 않는 경우 : 옳은 비밀번호 + 체크박스 체크 */
							$("form").submit();
						 	/* from 태그를 제출한다 */
						}

					}

				}

			} else { /* confirm에서 취소를 선택한 경우 : 마이페이지로 돌아간다 */
				var userid = $("#inputId").val();
				location.assign("/member/read/" + userid);
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