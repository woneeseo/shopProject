<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About</title>
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
<script src="/resources/js/upload.js" type="text/javascript"></script>
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
	
	.container{
		margin-top: 50px;
	}
	
	.products li{
		list-style: none;
	}
	
	.products li .scale{
		text-align: center;
		font-family: '나눔명조 Bold';
	}
	
	.nav li{
		cursor: pointer;
	}
	
	.about_product li{
		list-style: none;
	}

	.about_product li img{
		margin: 70px 0;
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
					<button id="mycart_btn">장바구니</button>
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
	
	<br>
	
	<div class="container" style="width: 70%">
		<form action="/order/insert" method="post">
		<div class="row"><h1 class="page-header" style="text-align: center; margin-bottom: 50px;">${productInfo.productName}</h1>
			<input type="hidden" name="productId" value="${productInfo.productId}" id="productId">
		</div>
		<div class="row" style="float: left; text-align: center; width:35%;">
			<img alt="productPhoto" src="/resources/upload${productInfo.filename}" width="150%">
		</div>

		<div class="row productInfo" style="width: 40%; float: right;" >
			<div class="form-group" style="text-align: center;">
				<h3 class="page-header"><span>${productInfo.productName}</span><br><small>${productInfo.productInfo}</small></h3>
			</div>
			<div class="form-group" style="text-align: left;">
				<label>가격 : </label><span>&nbsp;<fmt:formatNumber value="${productInfo.price}" type="number"/></span><span>&nbsp;원</span>
				<input type="hidden" value="${productInfo.price}" id="price">
			</div>
			<div class="form-group" style="text-align: left;">
				<label>배송비 : </label><span>&nbsp;2500원</span>
				<p>도서산간지역 배송비 5000원 / 3만원 이상 결제시 무료배송</p>
			</div>
			<div class="form-group" style="text-align: left;">
				<label>적립금 : </label><span><fmt:parseNumber var="test" value="${productInfo.price / 100}" integerOnly="true"/> ${test}&nbsp;원
				<input value="${test}" type="hidden" name="getPoint" id="point"></span>
			</div>

			<c:choose>
				<c:when test="${productInfo.productDist != 'acc' && productInfo.productDist != 'bag'}">
					<div class="form-horizontal" style="text-align: left;">
						<label>옵션 : </label> 
						<select class="form-control opt_select" name="selected_Opt">
							<option value="S">S</option>
							<option value="M">M</option>
							<option value="L">L</option>
						</select>
					</div>
				</c:when>
				<c:otherwise></c:otherwise>
			</c:choose>		
			<div class="form-horizontal" style="text-align: left;">
				<label>구매수량 : </label> 
				<c:choose>
					<c:when test="${productInfo.stock == 0}">
						<span>품절된 상품입니다.</span>
					</c:when>
					<c:otherwise>
						<select class="form-control" id="select_count" name="order_Qty">
						<c:forEach begin="1" end="${productInfo.stock > 5 ? 5 : productInfo.stock}" var="count">
						<option value="${count}">${count}</option></c:forEach>
						</select>					
					</c:otherwise>
				</c:choose>
			</div>	
			<hr>
			
			<div class="row">
				<div class="selected_option" style="text-align: right;">
				</div>
				<div style="text-align: center;">
				<c:choose>
					<c:when test="${productInfo.stock == 0}">
						<button class="btn btn-default btn-order" disabled="disabled">주문하기</button>
						<button class="btn btn-default btn-cart" disabled="disabled">장바구니</button>
					</c:when>
					<c:otherwise>
						<button class="btn btn-default btn-order" type="submit">주문하기</button>
						<button class="btn btn-default btn-car">장바구니</button>					
					</c:otherwise>
				</c:choose>

				</div>
			</div>
			<hr>		
		</div>
		</form>
	</div>

	<div class="container">
		<div class="row nav">
			<nav id="middle_nav">
				<ul class="nav nav-tabs nav-justified">
					<li id="about">상품상세</li>
					<li id="review">리뷰</li>
					<li id="qna">상품문의</li>
				</ul>
			</nav>
		</div>
		
		<div class="row" style="margin: 50px 0;">
			<h1 class="jumbotron">
				<div class="container">
					<h1>Hello world</h1>
					<small>This is product page.</small>
				</div>
			</h1>
		</div>
		
		<div class="row about_product" style="text-align: center; height: auto;">
			<h1 class="page-header">상품 상세</h1>

		</div>
		<div class="row reviews" style="text-align: center; margin: 80px 0;">
			<h1 class="page-header" style="margin-bottom: 50px;">Review</h1>
			<c:forEach begin="1" end="5">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Panel title</h3>
				</div>
				<div class="panel-body">Panel content</div>
			</div>
			</c:forEach>
		</div>

		<div class="row qnas" style="text-align: center; height: 700px;">
			<h1 class="page-header">상품 Q&A</h1>
			<table class="table table-hover" style="width: 70%; margin: auto;">
				<thead>
					<tr>
						<th>회원ID</th>
						<th>이름</th>
						<th>Email</th>
						<th>전화번호</th>
						<th>주소</th>
						<th>생일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="vo">
						<tr>
							<td>${vo.userid}</td>
							<td>${vo.username}</td>
							<td>${vo.email}</td>
							<td>${vo.tel}</td>
							<td>${vo.useraddress}</td>
							<td>${vo.birthDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<hr>
	
	<div class="footer"></div>

	<script type="text/javascript">
	
	$(document).ready(function() {
		
		var productId = $("#productId").val();
		var userid = $("#login_userid").val();
		
		$(".btn-car").click(function(event) {
			event.preventDefault();
			var qty = $("#select_count").val();
			var price = "<c:out value='${test}'/>";
			
			var point = Number(price) * Number(qty);
			$("#point").val(point);

		});
		
		$(".btn-order").click(function(event) {
			
			event.preventDefault();
			if (userid == null) {
				alert("로그인이 필요합니다.");
				location.assign("/member/login");
			} else {
				$("form").submit();
			}
			
		});
		
		$(".btn-cart").click(function(event) {
			
			event.preventDefault();
			
			if (userid == null) {
				alert("로그인이 필요합니다.");
				location.assign("/member/login");
				
			} else {
				
				$.ajax({
					
					type : "post",
					url : "/order/cart/" + productId,
					data : {
						productId : productId
					},
					dataType : "text",
					success : function(result) {
						
						if (result.trim() == 'add_success') {
							alert("카트에 등록되었습니다.");
			
						} else if (result.trim() == 'already_existed') {
							alert("이미 카트에 등록된 상품입니다.");
						}
					}
				});
			}

		});
		
		$.getJSON("/admin/product/getAttaches/" + productId, function(result) {
			
			var str = '';
			
			$(result).each(function() {
				var data = this;
				
				str += aboutProductPhotos(data);
					
			});
			
			$(".about_product").append(str);
			
		});
		
		$("#mycart_btn").click(function(event) {
			event.preventDefault();
			location.assign("/order/mycart/" + userid);
			
		});
		
		$("#review").click(function() {
			
			var scrollPosition = $(".reviews").offset().top;
			$("html").animate({scrollTop: scrollPosition}, 500); 
		});
		
		$("#qna").click(function() {
		
			var scrollPosition = $(".qnas").offset().top;
			$("html").animate({scrollTop: scrollPosition}, 500); 
		});
		
		$("#about").click(function() {
			
			var scrollPosition = $(".about_product").offset().top;
			$("html").animate({scrollTop: scrollPosition}, 500); 
		});
		
		$("#select_count").on('blur', function() {
			var count = $(this).val();
			var price = $("#price").val();
			var opt = $(".opt_select").val();
			
			
			if (count*price >= 30000) {
				var shipping = '무료배송';
				var finalPrice = count*price;
			} else {
				var shipping = 2500;
				var finalPrice = (count*price) + shipping;
			}
			
			var str = '';
			
			str += '<p><label>수량 : </label><span>&nbsp;' + count + '</span>&nbsp;&nbsp;&nbsp;';	
			
			if (opt != 'S' && opt != 'M' && opt != 'L') {
				str += '<lable></lable>';
			} else {
				str += '<label>옵션 : </label><span>&nbsp;' + opt + '</span>&nbsp;&nbsp;&nbsp;';	
			}
			
			str += '<label>배송비 : </label><span>&nbsp;' + shipping + '</span>&nbsp;&nbsp;&nbsp;';
			str	+= '<label>가격 : </label><span>&nbsp;' + price + ' 원</span></p>';
			str += '<h4><label>결제금액 : </label><span>&nbsp;' + finalPrice + ' 원</span></h4>'; 
			
			$(".selected_option").html(str);
			console.log(opt);
		});
		
		$("#top_nav ul li").on('click', function() {
			var productDist = $(this).attr("value");
			location.assign("/product/" + productDist);
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
			
			location.assign("/admin/main");
		
		});
	
	});
	
</script>

</body>
</html>