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
	
	<div class="container">
		<form action="/order/orderResult" method="post">
		<c:set value="${productInfo}" var="dto"/>
		<c:set value="2500" var="del_fee"/>
		<div class="row qnas" style="text-align: center;">
			<h1 class="page-header">์ฃผ๋ฌธํ๊ธฐ</h1>
			<table class="table table-hover" style="width: 70%; margin: auto; border-bottom: 1px solid #D5D5D5;">
				<thead>
					<tr>
						<th colspan="2" style="text-align: center;">์ํ๋ช</th>
						<th>๊ฐ๊ฒฉ</th>
						<th>์๋</th>
						<th>์ต์</th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td><img alt="thumbnail" src="/resources/upload${dto.filename}" width="40%">
							<input type="hidden" value="${dto.productId}" name="productId" id="productId">
							</td>
							<td>${dto.productName}<br>${dto.productInfo}</td>
							<td><label id="totalPrice"></label>&nbsp;์<br>
								์?๋ฆฝ๊ธ : <label id="point"></label>์								
							<td><select name="order_Qty" class="form-control order_Qty">
								<c:forEach begin="1" end="${dto.stock > 5 ? 5 : dto.stock}" var="stock">
									<option value="${stock}">${stock}</option>
								</c:forEach>
							</select>
							</td>
							<td><c:choose>
									<c:when
										test="${dto.productDist != 'acc' && dto.productDist != 'bag'}">
										<div class="form-horizontal" style="text-align: left;">
											<select class="form-control" name="selected_Opt">
												<option value="S">S</option>
												<option value="M">M</option>
												<option value="L">L</option>
											</select>
										</div>
									</c:when>
									<c:otherwise><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></c:otherwise>
								</c:choose></td>
							<td><button class="btn btn-default confirm">ํ์ธ</button></td>	
						</tr>
				</tbody>
			</table>
		</div>
		
		<div class="row" style="text-align: center; margin: 80px 0;">
		<c:set value="${memberInfo}" var="vo"/>
			<h1 class="page-header">์ฃผ๋ฌธ์?๋ณด ํ์ธ</h1>
			<h4 style="color: red;">์ฃผ๋ฌธ์ ์?๋ณด์ ๋ฐฐ์ก์ง๊ฐ ๋ค๋ฅธ ๊ฒฝ์ฐ ์ง์? ์๋?ฅํด์ฃผ์ธ์.</h4>
			<input type="hidden" value="${vo.getPoint}" name="getPoint" id="getPoint">
		</div>
		<div class="row">
			<div class="form-horizontal">
				<div class="form-group">
					<label for="inputId" class="col-sm-2 control-label">ID</label>
					<div class="col-sm-10">
						<input class="form-control" id="inputId" placeholder="ID" name="userid" value="${vo.userid}" readonly>
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputName" class="col-sm-2 control-label">Name</label>
					<div class="col-sm-10">
						<input class="form-control" id="inputName" placeholder="Name" name="username" value="${vo.username}">
					</div>
				</div>				
				<div class="form-group">
					<label for="inputAdd" class="col-sm-2 control-label">Address</label>
					<div class="col-sm-10">
						<input type="text" id="postcode" name="postcode" value="${vo.postcode}">&nbsp;
						<input type="button" class="btn btn-default btn-sm" id="searchAdd" value="์ฐํธ๋ฒํธ ์ฐพ๊ธฐ"><br>
						<input class="form-control" type="text" id="roadAddress" name="useraddress" value="${vo.useraddress}">
						<input class="form-control" type="text" id="detailAddress" name="detailAddress" placeholder="์์ธ์ฃผ์">
					</div>
				</div>				
				<div class="form-group">
					<label for="inputEmail" class="col-sm-2 control-label">Email</label>
					<div class="col-sm-10">
						<input type="email" class="form-control" id="inputEmail" placeholder="Email" name="email" value="${vo.email}">
					</div>
				</div>
				<div class="form-group">
					<label for="inputTel" class="col-sm-2 control-label">Tel</label>
					<div class="col-sm-10">
						<input type="tel" class="form-control" id="inputTel" placeholder="Tel" name="tel" value="${vo.tel}">
					</div>
				</div>
				<div class="form-group">
					<label for="inputTel" class="col-sm-2 control-label">๋ฐฐ์ก ๋ฉ์ธ์ง</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="deliver_msg" placeholder="๋ฐฐ์ก ๋ฉ์ธ์ง" name="deliver_msg">
					</div>
				</div>				
			</div>
		</div><!-- class=row -->
		
		<div class="row" style="text-align: center; margin: 80px 0;">
			<h1 class="page-header">๊ฒฐ์?์๋จ ํ์ธ</h1>
			<div style="text-align: center;">
				<input type="radio" name="cal_info" value="transfer"><label style="margin-right: 50px;">&nbsp;๊ณ์ข์ด์ฒด</label>
				<input type="radio" name="cal_info" value="no_bankingBook"><label style="margin-right: 50px;">&nbsp;๋ฌดํต์ฅ ์๊ธ</label>
				<input type="radio" name="cal_info" value="tel_billing"><label style="margin-right: 50px;">&nbsp;ํธ๋ํฐ ๊ฒฐ์?</label>
				<input type="radio" name="cal_info" value="card"><label>&nbsp;์นด๋ ๊ฒฐ์?</label>
			</div>
			<hr>
			<div class="row" style="text-align: center; margin: 50px 0;">
				<label>์ํ๊ฐ๊ฒฉ :&nbsp; <span id="price"></span>&nbsp;์</label>
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
				<label>๋ฐฐ์ก๋น :&nbsp;<span id="del_fee"></span>&nbsp;์
				</label>
				<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
				<label style="font-size: 1.5em;">์ด ๊ฒฐ์?๊ธ์ก : <span id="totalprice"></span>&nbsp;์
				<input type="hidden" id="amount" name="totalAmount">
				</label>
			</div>
			<div>
				<button class="btn btn-default cal-btn" type="submit">๊ฒฐ์?ํ๊ธฐ</button>
				<button class="btn btn-default back_btn">๋์๊ฐ๊ธฐ</button>
			</div>
		</div>
		</form>
	</div>

	<div class="footer">
		<p>@copyright EZEN computer art academy</p>
	</div>
<script type="text/javascript">
	
	$(document).ready(function() {
		
		var userid = $("#login_userid").val();
		var productId = $("#productId").val();
		
		$(".confirm").click(function(event) {
			event.preventDefault();
			var point = "<c:out value='${getPoint}'/>";
			var price = "<c:out value='${dto.price}'/>";
			var qty = $(".order_Qty").val();
			
			var totalPrice = price * qty;
			var totalPoint = point * qty;
			
			$("#totalPrice").html(totalPrice);
			$("#point").html(totalPoint);
			
		});
		
		$("input[name='cal_info']").click(function() {
			
			var qty = $(".order_Qty").val();
			var price = "<c:out value='${dto.price}'/>";
			var del_fee = "<c:out value='${del_fee}'/>";
			var point = $("#point").html();
			var bPoint = $("#getPoint").val();
			
			var p = parseInt(point);
			var b = parseInt(bPoint);

			var amount = price * qty;
			var totalPoint = p + b;

   			if (amount < 30000) {	
				totalAmount = Number(amount) + Number(del_fee);
				$("#price").html(amount);
				$("#del_fee").html(del_fee);
				$("#totalprice").html(totalAmount);
				$("#amount").val(totalAmount);
			} else {
				totalAmount = amount;
				$("#price").html(totalAmount);
				$("#del_fee").html(0);
				$("#totalprice").html(totalAmount);
				$("#amount").val(totalAmount);
			}
			
   			$("#getPoint").val(totalPoint);

		});
		
		$(".back_btn").click(function(event) {
			event.preventDefault();
			location.assign("/product/show/" + productId);
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
		
		$("#searchAdd").click(function(event) {
			event.preventDefault();
			postcode();

		});
		
		
	    //๋ณธ ์์?์์๋ ๋๋ก๋ช ์ฃผ์ ํ๊ธฐ ๋ฐฉ์์ ๋ํ ๋ฒ๋?น์ ๋ฐ๋ผ, ๋ด๋?ค์ค๋ ๋ฐ์ดํฐ๋ฅผ ์กฐํฉํ์ฌ ์ฌ๋ฐ๋ฅธ ์ฃผ์๋ฅผ ๊ตฌ์ฑํ๋ ๋ฐฉ๋ฒ์ ์ค๋ชํฉ๋๋ค.
	    function postcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // ํ์์์ ๊ฒ์๊ฒฐ๊ณผ ํญ๋ชฉ์ ํด๋ฆญํ์๋ ์คํํ? ์ฝ๋๋ฅผ ์์ฑํ๋ ๋ถ๋ถ.

	                // ๋๋ก๋ช ์ฃผ์์ ๋ธ์ถ ๊ท์น์ ๋ฐ๋ผ ์ฃผ์๋ฅผ ํ์ํ๋ค.
	                // ๋ด๋?ค์ค๋ ๋ณ์๊ฐ ๊ฐ์ด ์๋ ๊ฒฝ์ฐ์ ๊ณต๋ฐฑ('')๊ฐ์ ๊ฐ์ง๋ฏ๋ก, ์ด๋ฅผ ์ฐธ๊ณ?ํ์ฌ ๋ถ๊ธฐ ํ๋ค.
	                var roadAddr = data.roadAddress; // ๋๋ก๋ช ์ฃผ์ ๋ณ์
	                var extraRoadAddr = ''; // ์ฐธ๊ณ? ํญ๋ชฉ ๋ณ์

	                // ๋ฒ์?๋๋ช์ด ์์ ๊ฒฝ์ฐ ์ถ๊ฐํ๋ค. (๋ฒ์?๋ฆฌ๋ ์?์ธ)
	                // ๋ฒ์?๋์ ๊ฒฝ์ฐ ๋ง์ง๋ง ๋ฌธ์๊ฐ "๋/๋ก/๊ฐ"๋ก ๋๋๋ค.
	                if(data.bname !== '' && /[๋|๋ก|๊ฐ]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // ๊ฑด๋ฌผ๋ช์ด ์๊ณ?, ๊ณต๋์ฃผํ์ผ ๊ฒฝ์ฐ ์ถ๊ฐํ๋ค.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // ํ์ํ? ์ฐธ๊ณ?ํญ๋ชฉ์ด ์์ ๊ฒฝ์ฐ, ๊ดํธ๊น์ง ์ถ๊ฐํ ์ต์ข ๋ฌธ์์ด์ ๋ง๋?๋ค.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }

	                // ์ฐํธ๋ฒํธ์ ์ฃผ์ ์?๋ณด๋ฅผ ํด๋น ํ๋์ ๋ฃ๋๋ค.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("roadAddress").value = roadAddr;
	                
	            }

	        }).open();
	    }
	
	});
	
</script>

</body>
</html>