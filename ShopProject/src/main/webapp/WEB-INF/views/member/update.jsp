<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 페이지</title>
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
					&nbsp;&nbsp;<button onclick="location.href='/member/logout'">로그아웃</button>
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
			<h1>회원 정보 수정하기</h1>
		</div>
		<div class="row">
			<form class="form-horizontal" action="/member/update" method="post">
				<div class="form-group">
					<label for="inputId" class="col-sm-2 control-label">ID</label>
					<div class="col-sm-10">
						<input class="form-control" id="inputId" value="${userInfo.userid}" name="userid" readonly>
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="col-sm-2 control-label">Password</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputPassword" value="${userInfo.userpw}" name="userpw">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword2" class="col-sm-2 control-label">Confirm Password</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputPassword2" value="${userInfo.userpw}">
					</div>
				</div>				
				<div class="form-group">
					<label for="inputName" class="col-sm-2 control-label">Name</label>
					<div class="col-sm-10">
						<input class="form-control" id="inputName" value="${userInfo.username}" name="username">
					</div>
				</div>
				<div class="form-group">
					<label for="inputAdd" class="col-sm-2 control-label">Address</label>
					<div class="col-sm-10">
						<input type="text" id="postcode" name="postcode" value="${userInfo.postcode}">&nbsp;
						<input type="button" class="btn btn-default btn-sm" id="searchAdd" value="우편번호 찾기"><br>
						<input class="form-control" type="text" id="roadAddress" name="useraddress" value="${userInfo.useraddress}">
						<input class="form-control" type="text" id="detailAddress" name="detailAddress" placeholder="상세주소">
					</div>
				</div>
				<div class="form-group">
					<label for="inputEmail" class="col-sm-2 control-label">Email</label>
					<div class="col-sm-10">
						<input type="email" class="form-control" id="inputEmail" value="${userInfo.email}" name="email">
					</div>
				</div>
				<div class="form-group">
					<label for="inputTel" class="col-sm-2 control-label">Tel</label>
					<div class="col-sm-10">
						<input type="tel" class="form-control" id="inputTel" value="${userInfo.tel}" name="tel">
					</div>
				</div>
				<div class="form-group">
					<label for="inputBirth" class="col-sm-2 control-label">Bitrh</label>
					<div class="col-sm-10">
						<input type="date" class="form-control" id="inputBirth" value="${userInfo.birthDate}" name="birthDate">
					</div>
				</div>				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default submit">회원정보 수정하기</button>
						<button class="btn btn-default" id="back_to_myPage">마이페이지로 돌아가기</button>
					</div>
				</div>
			</form>
		</div><!-- class=row -->
	</div><!-- class=container -->


<script type="text/javascript">

	$(document).ready(function() {
		
		$("#back_to_myPage").click(function(event) {
			event.preventDefault();
			
			var userid = $("#inputId").val();
			location.assign("/member/read/" + userid);
		});

		
		$(".submit").click(function(event) {
			event.preventDefault();

			var pw1 = $("#inputPassword").val();
			var pw2 = $("#inputPassword2").val();
			
			if (pw1 != pw2) {
				alert("비밀번호가 일치하지 않습니다.");
				$("#inputPassword2").focus();
			} else {
				$("form").submit();
			}
		});
		
		
		$("#searchAdd").click(function(event) {
			event.preventDefault();
			postcode();

		});
		
		
	    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	    function postcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수

	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("roadAddress").value = roadAddr;
	                
	            }

	        }).open();
	    }
	    
	    
	});

</script>
</body>
</html>