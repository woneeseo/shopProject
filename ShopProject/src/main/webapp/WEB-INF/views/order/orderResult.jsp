<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Top</title>
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
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
		font-family: '๋๋๋ช์กฐ Bold';
	}
	
	.nav li{
		cursor: pointer;
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
					<span id="login_log" style="border-bottom: 1px solid white;">${login.userid} ๋, ํ์ํฉ๋๋ค.</span>
					<span class="glyphicon glyphicon-heart-empty" style="color: white;" aria-hidden="true"></span>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<c:if test="${login.userid == 'admin'}">
						<button id="go_to_adminPage">๊ด๋ฆฌ์ ํ์ด์ง</button>
					</c:if>
					<button class="mycart_btn">์ฅ๋ฐ๊ตฌ๋</button>
					<button id="mypage_btn">๋ง์ดํ์ด์ง</button>
					<button id="logout_btn">๋ก๊ทธ์์</button>
					<input type="hidden" value="${login.userid}" id="login_userid">
				</c:when>
				
				<c:otherwise>
					<button onclick="location.href='/member/login'">๋ก๊ทธ์ธ</button><button onclick="location.href='/member/insert'">ํ์๊ฐ์</button>
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
	
	<div class="container">

		<c:set value="${orderDTO}" var="dto"/>
		<div class="row" style="text-align: center;">
			<h1 class="page-header" style="margin-bottom: 50px;">์ฃผ๋ฌธ์ด ์๋ฃ๋์์ต๋๋ค.</h1>
			<table class="table table-hover" style="margin: auto; border-bottom: 1px solid #D5D5D5;">
				<thead>
					<tr>
						<th colspan="2" style="text-align: center !important;">์ํ๋ช</th>
						<th>๊ฐ๊ฒฉ</th>
						<th>์๋</th>
						<th>์ต์</th>
						<th>๊ฒฐ์?๊ธ์ก</th>
					</tr>
				</thead>
				<tbody style="text-align: left; vertical-align: middle;">
						<tr>
							<td style="text-align: center;"><img alt="thumbnail" src="/resources/upload${dto.fullname}" width="30%">
							<input type="hidden" value="${dto.productId}" name="productId" id="productId">
							</td>
							<td>${dto.productName}<br>${dto.productInfo}</td>
							<td><fmt:formatNumber type="number" value="${dto.price}"/>&nbsp;์</td>
							<td>${dto.order_Qty}</td>
							<td>${dto.selected_Opt}</td>
							<td><fmt:formatNumber type="number" value="${dto.totalAmount}"/>&nbsp;์</td>
						</tr>
				</tbody>
			</table>
		</div>
		
		<hr>
		
		<div class="row" style="text-align: center;">
			
			<table class="table table-hover" style="margin: auto; border-bottom: 1px solid #D5D5D5;">
				<thead>
					<tr>
						<th>์ฃผ๋ฌธ์</th>
						<th>๋ฐฐ์ก์ง</th>
						<th>์?ํ๋ฒํธ</th>
						<th>๋ฐฐ์ก์ํ</th>
						<th>๋ฐฐ์ก๋ฉ์ธ์ง</th>
					</tr>
				</thead>
				<tbody style="text-align: left;">
						<tr>
							<td>${dto.username}</td>
							<td>${dto.postcode}<br>${dto.useraddress}</td>
							<td>${dto.tel}</td>
							<td id="del_situ"></td>
							<td>${dto.deliver_msg}</td>
						</tr>
				</tbody>
			</table>
		</div>
		
		<div class="row" style="margin: 80px 0; text-align: center;">
			<button class="btn btn-default back_btn">์ผํ์ ๊ณ์ํ๊ธฐ</button>
			<button class="btn btn-default mycart_btn">์ฅ๋ฐ๊ตฌ๋๋ก ์ด๋ํ๊ธฐ</button>
		</div>
	</div>
	
	<div class="footer">
		<p>@copyright EZEN computer art academy</p>
	</div>	

<script type="text/javascript">
	
	$(document).ready(function() {
		
		var userid = $("#login_userid").val();
		var productId = $("#productId").val();
		
		del_situ();
		
		
		$(".back_btn").click(function(event) {
			event.preventDefault();
			location.assign("/");
		});

		$(".mycart_btn").click(function(event) {
			event.preventDefault();
			location.assign("/order/mycart/" + userid);
			
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
			
			var logout = confirm("๋ก๊ทธ์์ ํ์๊ฒ?์ต๋๊น?");
			
			if (logout) {
				location.assign("/member/logout");
			}
		});
		
		$("#go_to_adminPage").click(function(event) {
			event.preventDefault();
			
			location.assign("/admin/orderedlist");
		
		});
		
		$("#searchAdd").click(function(event) {
			event.preventDefault();
			postcode();

		});
	    
	    function del_situ() {
	    	var situ = "<c:out value='${dto.deliver_situ}'/>";
	    	if (situ == '0') {
				situ = "๋ฐฐ์ก ์ค๋น์ค";
			} else if (situ == '1') {
				situ = "๋ฐฐ์ก์ค";
			} else if (situ == '2') {
				situ = "๋ฐฐ์ก ์๋ฃ";
			}
	    	
	    	$("#del_situ").html(situ);
		}
	
	});
	
</script>

</body>
</html>