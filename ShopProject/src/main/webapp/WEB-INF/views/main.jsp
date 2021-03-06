<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
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
	
	.products li, .products_new li{
		list-style: none;
	}
	
	.products li .scale, .products_new li .scale{
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
					<button id="mycart_btn">์ฅ๋ฐ๊ตฌ๋</button>
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
	
	<div style="text-align: right; background-color: #ffd800; position: relative;">
		<div id="text_in_the_image">
			<h1>HELLO SPRING!</h1>
			<h3>SPRING SALE</h3>
			<p>UP TO <span>50%</span></p>
			</div>
		<img alt="jumpping_woman" src="/resources/young-woman-jumping-isolated-yellow-wall_1368-45425.jpg" style="max-width:100%; height:auto;">
	</div>
	<div class="container">
		
		<div class="content">
			<h1 class="page-header">์ธ๊ธฐ์ํ&nbsp;&nbsp;<small>๊ธ์ฃผ์ ๊ฐ์ฅ๋ง์ด ํ๋ฆฐ ์?ํ!</small></h1>
			<div class="row products"></div>
		</div>
		
		<br>
		
		<div class="content" style="margin-top: 200px;">
			<h1 class="page-header">์?๊ท ์๊ณ? ์ํ&nbsp;&nbsp;<small>์?์ํ์๋๋ค.</small></h1>
			<div class="row products_new"></div>
		</div>

		<div class="row" style="margin-top: 200px;">
			<h1 class="page-header">
				Review&nbsp;&nbsp;<small>์๋น์๋ค์ด ์ง์? ๋จ๊ฒจ์ค ๋ฆฌ๋ทฐ์๋๋ค.</small>
			</h1>
			<div class="row">
				<div class="row">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>No.</th>
								<th>์?๋ชฉ</th>
								<th>์์ฑ์</th>
								<th>์์ฑ์ผ</th>
								<th>์กฐํ์</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="vo">
								<tr>
									<td>${vo.boardId}</td>
									<td><a href="/board/read/${vo.boardId}">${vo.title}</a></td>
									<td>${vo.userid}</td>
									<td><fmt:formatDate value="${vo.regDate}" type="date"
											pattern="yyyy-MM-dd" /></td>
									<td>${vo.viewCnt}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
	</div>
	
	<hr>
	
	<div class="footer">
		<p>@copyright EZEN computer art academy</p>
	</div>

<script type="text/javascript">
	
	$(document).ready(function() {
		
		var userid = $("#login_userid").val();
		
		$.getJSON("/admin/productList", function(result) {
			
			var str = '';
			
			$(result).each(function() {
			
				var data = this; 
				console.log(data);
				str += makeHtmlcode_list(data);
					
			});
			
			$(".products").html(str);
			
		});

		$.getJSON("/admin/newProducts", function(result) {
			
			var str = '';
			
			$(result).each(function() {
				var data = this;
				
				str += makeHtmlcode_list(data);
					
			});
			
			$(".products_new").html(str);
			
		});
		
		$(".products").on("click", ".btn-incart", function(event) {
			
			event.preventDefault();
			
			var productId = $(this).attr("value");
			
			if (userid == null) {
				alert("๋ก๊ทธ์ธ์ด ํ์ํฉ๋๋ค.");
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
							alert("์นดํธ์ ๋ฑ๋ก๋์์ต๋๋ค.");
			
						} else if (result.trim() == 'already_existed') {
							alert("์ด๋ฏธ ์นดํธ์ ๋ฑ๋ก๋ ์ํ์๋๋ค.");
						}
					}
				});
			} 
		});
		
		$("#mycart_btn").click(function(event) {
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
	
	});
	
</script>

</body>
</html>