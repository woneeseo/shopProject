<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 현황</title>
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
	#text_in_the_image{
		float: left;
		margin-top: 50px;
		margin-left: 130px;
		text-align: left;
	}
	
	#text_in_the_image h1{

		font-size: 5em;
		font-family: 'Impact';
	}
	
	#text_in_the_image h3{

		font-size: 3em;
		font-family: 'Copperplate';
	}	
	
	#text_in_the_image p{

		font-size: 8em;
		font-family: 'Impact';
	}	
	
	#text_in_the_image p span{
	
		text-align: center;
		font-family: 'Impact';
		color: red;
		text-shadow: 3px 4px 5px gray;
	}
	
	.side_nav{
		width: 15% !important;
		margin-top: 10px;
		float: left;
		margin-right: 20px;
		text-align: center;
	}
	
		
	.admin_container{
		float: right;
		width: 80%;
		margin-right: 30px;
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
					&nbsp;&nbsp;&nbsp;&nbsp;
					<c:if test="${login.userid == 'admin'}">
						<button id="go_to_adminPage">관리자 페이지</button>
					</c:if>
					<button id="mypage_btn">마이페이지</button>
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
	
	<br>
	
	
	
	<div class="row side_nav">
		<ul class="nav nav-pills nav-stacked">
			<li class="li_btns active"><a href="/admin/orderedlist">주문 현황</a></li>
			<li class="li_btns"><a href="/admin/list">회원 관리</a></li>
			<li class="li_btns"><a href="/admin/product/insert">상품 등록</a></li>
			<li class="li_btns"><a href="/admin/product/list">상품 조회</a></li>
		</ul>
	</div>

	<div class="container admin_container">
		<div class="row">
			<h1 class="jumbotron" style="text-align: center; margin: 50px 0; ">주문 현황</h1>
			<table class="table table-hover" style="border-bottom: 1px solid #D5D5D5; border-top: 1px solid #D5D5D5;">
				<thead>
					<tr>
						<th>주문ID</th>
						<th>상품ID</th>
						<th>상품명</th>
						<th>주문량</th>
						<th>상품옵션</th>
						<th>결제일</th>
						<th>주문일</th>
						<th>배송현황</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="dto">
						<tr>
							<td>${dto.orderId}
								<input type="hidden" value="${dto.orderId}" name="orderId">
								<input type="hidden" value="${dto.order_seq_num}" name="order_seq_num">
								</td>
							<td>${dto.productId}</td>
							<td>${dto.productName}</td>
							<td>${dto.order_Qty}</td>
							<td>${dto.selected_Opt}</td>
							<td><fmt:formatDate value="${dto.billingDate}" pattern="yyyy-MM-dd" type="date"/></td>
							<td><fmt:formatDate value="${dto.orderDate}" pattern="yyyy-MM-dd" type="date"/></td>
							<td>
								<select class="form-control" style="width: 80px; float: left;" name="deliver_situ">
								<option value=""></option>
								<option value="0">배송준비중</option>
								<option value="1">발송 완료</option>
								<option value="2">배송 완료</option>
							</select>
							&nbsp;
							<button class="btn btn-default update_deliver_situ">확인</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- class = row -->

		<div class="row" style="text-align: center;">
			<h1 class="jumbotron">주문자 정보</h1>
			<table class="table table-hover"
				style="margin: 50px 0; border-bottom: 1px solid #D5D5D5; border-top: 1px solid #D5D5D5;">
				<thead>
					<tr>
						<th>회원ID</th>
						<th>주문자</th>
						<th>배송지</th>
						<th>전화번호</th>
						<th>배송메세지</th>
					</tr>
				</thead>
				<tbody style="text-align: left;">
					<tr>
						<c:forEach items="${list}" var="dto">
						<td>${dto.userid}</td>
						<td>${dto.username}</td>
						<td>${dto.postcode}<br>${dto.useraddress}</td>
						<td>${dto.tel}</td>
						<td>${dto.deliver_msg}</td>
						</c:forEach>
					</tr>
				</tbody>
			</table>

		</div>

		<div class="row" style="text-align: center; margin: 80px;">
			<button class="btn btn-default back_to_orderedlist">주문 현황으로 돌아가기</button>
		</div>
	</div>
	



<script type="text/javascript">
	
	$(document).ready(function() {

		
		$(".update_deliver_situ").click(function() {
			
			var deliver_situ = $("select[name='deliver_situ']").val();
			var orderId = $("input[name='orderId']").val();
			var order_seq_num = $("input[name='order_seq_num']").val();
			
			$.ajax({
				
				type : 'post',
				url : '/admin/updateDelSitu',
				data : {
					orderId : orderId,
					order_seq_num : order_seq_num,
					deliver_situ : deliver_situ
				},
				dataType : 'text',
				success : function(result) {
					
					if (result == 1) {
						alert("배송현황을 변경하였습니다.");

					} else {
						alert("배송현황 변경을 실패했습니다.");
					}
				}
			});

		});
		
		$(".back_to_orderedlist").click(function() {
			location.assign("/admin/orderedlist");
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