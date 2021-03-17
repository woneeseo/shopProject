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
		<nav id="top_nav">
			<ul class="nav nav-tabs nav-justified">
				<li value="about">ABOUT</li>
				<li value="outer">OUTER</li>
				<li value="top">TOP</li>
				<li value="bottom">BOTTOM</li>
				<li value="bag">BAG</li>
				<li value="acc">ACC</li>
				<li value="sale">SALE</li>
				<li value="event">EVENT</li>
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
					<label for="inputBirth" class="col-sm-2 control-label">Point</label>
					<div class="col-sm-10">
						<input class="form-control" id="getPoint"  name="getPoint" value="${userInfo.getPoint}" readonly>
						<label>5,000p 부터 현금처럼 사용할 수 있습니다.</label>
					</div>
				</div>				
				<div class="row">
					<div class="form-group" style="text-align: center; margin-top: 50px;">
						<button class="btn btn-default" id="update_userInfo">회원정보 수정</button>
						<button class="btn btn-default" id="back_to_main">메인으로 돌아가기</button>
						<button class="btn btn-default" id=drop_out_of_member>회원 탈퇴하기</button>
					</div>
				</div>				

				<div class="form-group">
					<div class="row" style="text-align: center;">
						<h1 class="page-header" style="margin-bottom: 50px;">나의 주문 내역</h1>
						<table class="table table-hover"
							style="margin: auto; border-bottom: 1px solid #D5D5D5;">
							<thead>
								<tr>
									<th colspan="2" style="text-align: center;">상품명</th>
									<th>가격</th>
									<th>수량</th>
									<th>옵션</th>
									<th>결제금액</th>
									<th>결제일</th>
									<th>배송현황</th>
								</tr>
							</thead>
							<tbody style="text-align: left;">
								<c:choose>
									<c:when test="${orderList == null}">
										<tr style="text-align: center;"><td colspan="8"><h3>주문 내역이 없습니다.</h3></td></tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${orderList}" var="dto">
											<tr>
												<td style="text-align: center;"><img alt="thumbnail"
													src="/resources/upload${dto.fullname}" width="40%"> <input
													type="hidden" value="${dto.productId}" name="productId"
													id="productId"></td>
												<td>${dto.productName}<br>${dto.productInfo}</td>
												<td><fmt:formatNumber type="number"
														value="${dto.price}" />&nbsp;원</td>
												<td>${dto.order_Qty}</td>
												<td>${dto.selected_Opt}</td>
												<td><fmt:formatNumber type="number"
														value="${dto.totalAmount}" />&nbsp;원</td>
												<td><fmt:formatDate value="${dto.billingDate}"
														type="date" pattern="yyyy-MM-dd" /></td>
												<td>${dto.deliver_situ == 0 ? "배송준비중" : 
															dto.deliver_situ == 1 ? "배송중" : "배송완료"}</td>
												<c:choose>
													<c:when test="${dto.deliver_situ != 0}">
														<td>
															<button class="btn btn-default disable"
																disabled="disabled">주문취소</button>
															<br>
															<button class="btn btn-default disable"
																disabled="disabled">주문변경</button>
															<br>
														</td>
													</c:when>
													<c:otherwise>
														<td>
															<button class="btn btn-default order_cancel"
																onclick="location.href='/order/cancel/'+ ${dto.orderId}">주문취소</button>
															<br>
															<button class="btn btn-default">주문변경</button>
														</td>
													</c:otherwise>
												</c:choose>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>

			</div>
		</div><!-- class=row -->
	</div><!-- class=container -->
<script type="text/javascript">
	$(document).ready(function () {
		
		$("#top_nav ul li").on('click', function() {
			var productDist = $(this).attr("value");
			location.assign("/product/" + productDist);
		});
		
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