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
		font-family: '나눔명조 Bold';
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
			<h1 class="page-header">주문하기</h1>
			<table class="table table-hover" style="width: 70%; margin: auto; border-bottom: 1px solid #D5D5D5;">
				<thead>
					<tr>
						<th colspan="2" style="text-align: center;">상품명</th>
						<th>가격</th>
						<th>수량</th>
						<th>옵션</th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td><img alt="thumbnail" src="/resources/upload${dto.filename}" width="40%">
							<input type="hidden" value="${dto.productId}" name="productId" id="productId">
							</td>
							<td>${dto.productName}<br>${dto.productInfo}</td>
							<td><label id="totalPrice"></label>&nbsp;원<br>
								적립금 : <label id="point"></label>원								
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
							<td><button class="btn btn-default confirm">확인</button></td>	
						</tr>
				</tbody>
			</table>
		</div>
		
		<div class="row" style="text-align: center; margin: 80px 0;">
		<c:set value="${memberInfo}" var="vo"/>
			<h1 class="page-header">주문정보 확인</h1>
			<h4 style="color: red;">주문자 정보와 배송지가 다른 경우 직접 입력해주세요.</h4>
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
						<input type="button" class="btn btn-default btn-sm" id="searchAdd" value="우편번호 찾기"><br>
						<input class="form-control" type="text" id="roadAddress" name="useraddress" value="${vo.useraddress}">
						<input class="form-control" type="text" id="detailAddress" name="detailAddress" placeholder="상세주소">
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
					<label for="inputTel" class="col-sm-2 control-label">배송 메세지</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="deliver_msg" placeholder="배송 메세지" name="deliver_msg">
					</div>
				</div>				
			</div>
		</div><!-- class=row -->
		
		<div class="row" style="text-align: center; margin: 80px 0;">
			<h1 class="page-header">결제수단 확인</h1>
			<div style="text-align: center;">
				<input type="radio" name="cal_info" value="transfer"><label style="margin-right: 50px;">&nbsp;계좌이체</label>
				<input type="radio" name="cal_info" value="no_bankingBook"><label style="margin-right: 50px;">&nbsp;무통장 입금</label>
				<input type="radio" name="cal_info" value="tel_billing"><label style="margin-right: 50px;">&nbsp;핸드폰 결제</label>
				<input type="radio" name="cal_info" value="card"><label>&nbsp;카드 결제</label>
			</div>
			<hr>
			<div class="row" style="text-align: center; margin: 50px 0;">
				<label>상품가격 :&nbsp; <span id="price"></span>&nbsp;원</label>
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
				<label>배송비 :&nbsp;<span id="del_fee"></span>&nbsp;원
				</label>
				<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
				<label style="font-size: 1.5em;">총 결제금액 : <span id="totalprice"></span>&nbsp;원
				<input type="hidden" id="amount" name="totalAmount">
				</label>
			</div>
			<div>
				<button class="btn btn-default cal-btn" type="submit">결제하기</button>
				<button class="btn btn-default back_btn">돌아가기</button>
			</div>
		</div>
		</form>
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
			
			var logout = confirm("로그아웃 하시겠습니까?");
			
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