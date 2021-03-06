<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop</title>
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
		font-family: '๋๋๋ช์กฐ Bold';
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
		<nav id="top_nav">
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
				<label>๊ฐ๊ฒฉ : </label><span>&nbsp;<fmt:formatNumber value="${productInfo.price}" type="number"/></span><span>&nbsp;์</span>
				<input type="hidden" value="${productInfo.price}" id="price">
			</div>
			<div class="form-group" style="text-align: left;">
				<label>๋ฐฐ์ก๋น : </label><span>&nbsp;2500์</span>
				<p>๋์์ฐ๊ฐ์ง์ญ ๋ฐฐ์ก๋น 5000์ / 3๋ง์ ์ด์ ๊ฒฐ์?์ ๋ฌด๋ฃ๋ฐฐ์ก</p>
			</div>
			<div class="form-group" style="text-align: left;">
				<label>์?๋ฆฝ๊ธ : </label><span><fmt:parseNumber var="test" value="${productInfo.price / 100}" integerOnly="true"/> ${test}&nbsp;์
				<input value="${test}" type="hidden" name="getPoint" id="point"></span>
			</div>

			<c:choose>
				<c:when test="${productInfo.productDist != 'acc' && productInfo.productDist != 'bag'}">
					<div class="form-horizontal" style="text-align: left;">
						<label>์ต์ : </label> 
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
				<label>๊ตฌ๋งค์๋ : </label> 
				<c:choose>
					<c:when test="${productInfo.stock == 0}">
						<span>ํ์?๋ ์ํ์๋๋ค.</span>
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
						<button class="btn btn-default btn-order" disabled="disabled">์ฃผ๋ฌธํ๊ธฐ</button>
						<button class="btn btn-default btn-cart" disabled="disabled">์ฅ๋ฐ๊ตฌ๋</button>
					</c:when>
					<c:otherwise>
						<button class="btn btn-default btn-order" type="submit">์ฃผ๋ฌธํ๊ธฐ</button>
						<button class="btn btn-default btn-cart">์ฅ๋ฐ๊ตฌ๋</button>					
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
					<li id="about">์ํ์์ธ</li>
					<li id="review">๋ฆฌ๋ทฐ</li>
				</ul>
			</nav>
		</div>

		<div class="row" style="margin: 50px 0;">
			<h1 class="jumbotron">
				<div class="container">
					<h1>์ํ ์์ธ ํ์ด์ง ์๋๋ค.</h1>
					<small>This is product page.</small>
				</div>
			</h1>
		</div>

		<div class="row about_product"
			style="text-align: center; height: auto;">
			<h1 class="page-header">์ํ ์์ธ</h1>

		</div>

		<div class="row reviews" style="margin-top: 100px;">
			<h1 class="page-header">Review&nbsp;&nbsp;<small>์ํ์ ์ฌ์ฉํด๋ณด์? ๋ถ๋ค์ ์ค์? ํ๊ธฐ์๋๋ค.</small></h1>
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

	<hr>
	
	<div class="footer">
		<p>@copyright EZEN computer art academy</p>
	</div>

	<script type="text/javascript">
	
	$(document).ready(function() {
		
		var productId = $("#productId").val();
		var userid = $("#login_userid").val();
		
		$(".btn-cart").click(function(event) {
			event.preventDefault();
			var qty = $("#select_count").val();
			var price = "<c:out value='${test}'/>";
			
			var point = Number(price) * Number(qty);
			$("#point").val(point);

		});
		
		$(".btn-order").click(function(event) {
			
			event.preventDefault();
			if (userid == null) {
				alert("๋ก๊ทธ์ธ์ด ํ์ํฉ๋๋ค.");
				location.assign("/member/login");
			} else {
				$("form").submit();
			}
			
		});
		
		$(".btn-cart").click(function(event) {
			
			event.preventDefault();
			
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
		
		$("#about").click(function() {
			
			var scrollPosition = $(".about_product").offset().top;
			$("html").animate({scrollTop: scrollPosition}, 500); 
		});
		
		$("#select_count").on('blur', function() {
			var count = $(this).val();
			var price = $("#price").val();
			var opt = $(".opt_select").val();
			
			
			if (count*price >= 30000) {
				var shipping = '๋ฌด๋ฃ๋ฐฐ์ก';
				var finalPrice = count*price;
			} else {
				var shipping = 2500;
				var finalPrice = (count*price) + shipping;
			}
			
			var str = '';
			
			str += '<p><label>์๋ : </label><span>&nbsp;' + count + '</span>&nbsp;&nbsp;&nbsp;';	
			
			if (opt != 'S' && opt != 'M' && opt != 'L') {
				str += '<lable></lable>';
			} else {
				str += '<label>์ต์ : </label><span>&nbsp;' + opt + '</span>&nbsp;&nbsp;&nbsp;';	
			}
			
			str += '<label>๋ฐฐ์ก๋น : </label><span>&nbsp;' + shipping + '</span>&nbsp;&nbsp;&nbsp;';
			str	+= '<label>๊ฐ๊ฒฉ : </label><span>&nbsp;' + price + ' ์</span></p>';
			str += '<h4><label>๊ฒฐ์?๊ธ์ก : </label><span>&nbsp;' + finalPrice + ' ์</span></h4>'; 
			
			$(".selected_option").html(str);
			console.log(opt);
		});		
		
		$("#top_nav ul li").on('click', function() {

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