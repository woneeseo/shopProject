<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
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

	
</style>

<script type="text/javascript">
function itemSum(){
    var str = "";
    var sum = 0;
    var count = $(".chkbox").length;
    for(var i=0; i < count; i++ ){
        if( $(".chkbox")[i].checked == true ){
         sum += parseInt($(".chkbox")[i].value);
        }
    }
    $("#total_sum").html(sum+" 원");
    $("#amount").val(sum);
 }

$("#allCheck").click(function(){
var chk = $("#allCheck").prop("checked");
if(chk) {
    $(".chkbox").prop("checked", true);
        itemSum();
} else {
     $(".chkbox").prop("checked", false);
    itemSum();
}
});

</script>
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

	<c:set value="${cartMap.cartList}" var="cartList"/>
	<c:set value="${cartMap.productList}" var="productList"/>
	
	<c:forEach items="${cartList}" var="cList">
		<input type="hidden" value="${cList.cartId}" name="cartId">
	</c:forEach>
		
		<div class="row qnas" style="text-align: center;">
		<form action="/order/cartOrder" method="post" id="orderForm">
			<h1 class="page-header">장바구니</h1>
			<table class="table table-hover" style="margin: auto; border-bottom: 1px solid #D5D5D5;">
				<thead>
					<tr>
						<th colspan="2" style="text-align: center;">상품명</th>
						<th>가격</th>
						<th>수량</th>
						<th>옵션</th>
						<th>상품정보</th>
					</tr>
				</thead>
				<tbody>
					<c:choose><c:when test="${productList != null}">
					<c:forEach items="${productList}" var="vo" varStatus="status">
						<tr>
							<td class="product-close">
							<input type="checkbox" class="chkbox" onClick="itemSum()" 
							 value="" data-cartNum="${vo.productId}" checked style="margin-right: 30px;">
							<img alt="thumbnail" src="/resources/upload${vo.filename}">
							</td>
							<td><a href="/product/show/${cartList[status.index].productId}">${vo.productName}</a>
								<input value="${cartList[status.index].productId}" name="productId" type="hidden">
							</td>
							<td><fmt:formatNumber type="number" value="${vo.price}"/>&nbsp;원<br>
								<span><fmt:parseNumber var="test" value="${vo.price / 100}" integerOnly="true"/> ${test}&nbsp;원
										<input value="${test}" type="hidden" name="getPoint" id="point"></span></td>
								<td><c:choose>
										<c:when test="${vo.stock == 0}">
											<span>품절된 상품입니다.</span>
										</c:when>
										<c:otherwise>
											<select class="form-control" name="order_Qty">
												<c:forEach var="count" begin="1" end="${vo.stock > 5 ? 5 : vo.stock}">
													<option>${count}</option>
												</c:forEach>
											</select>
										</c:otherwise>
									</c:choose>
									</td>
										<td><c:choose>
												<c:when
													test="${productInfo.productDist != 'acc' && productInfo.productDist != 'bag'}">
													<div class="form-horizontal" style="text-align: left;">
														<select class="form-control opt_select" name="selected_Opt">
															<option value="S">S</option>
															<option value="M">M</option>
															<option value="L">L</option>
														</select>
													</div>
												</c:when>
												<c:otherwise></c:otherwise>
											</c:choose></td>
										<td>${vo.productInfo}</td>
									<td>	
								<c:choose>
									<c:when test="${vo.stock == 0}">
										<button class="btn btn-default" disabled="disabled">주문하기</button><br>
										<button class="btn btn-default del_from_cart" data-pId="${cartList[status.index].productId}">삭제하기</button>
									</c:when>
									<c:otherwise>
										<button class="btn btn-default cart_to_order" data-pId="${cartList[status.index].productId}">주문하기</button>
										<br>
										<button class="btn btn-default del_from_cart" data-pId="${cartList[status.index].productId}">삭제하기</button>
									</c:otherwise>
								</c:choose> 
							</td>
						</tr>
					</c:forEach>
					</c:when>
					<c:otherwise>
						<tr><td colspan="5"><h3>장바구니에 내역이 없습니다.</h3></td></tr>
					</c:otherwise></c:choose>
				</tbody>
			</table>
		</form>
	</div>
		
		<div class="row" style="text-align: center; margin: 80px 0;">
			<button class="btn btn-default btn-back_to_shop">쇼핑을 계속하기</button>
		</div>
	
	</div>

<script type="text/javascript">
	
	$(document).ready(function() {
		
		var userid = $("#login_userid").val();
		
		$(".del_from_cart").click(function(event) {
			event.preventDefault();
			var item = $(this);
			var productId = item.attr("data-pId");
			var userid = $("#login_userid").val();
			
			$.ajax({
				
				type : 'post',
				url : '/order/delFromCart',
				data : {
					productId : productId,
					userid : userid
				},
				dataType : 'text',
				success : function(result) {
					
					if (result == 'ok') {
						alert("장바구니에서 삭제되었습니다.");
						location.assign("/order/mycart/" + userid);
					} else {
						alert("이미 삭제 된 상품입니다.");
					}
				}
			});
			
			
		});
		
		
		$(".cart_to_order").click(function(event) {
			event.preventDefault();
			
			if (userid != null) {
				var item = $(this);
				var productId = item.attr("data-pId");
				
				location.assign("/order/insert/" + productId);
			} else {
				alert("로그인이 필요합니다.");
				location.assign("/member/login");
			}

			
		});
		
		 $("#orderSuccess").click(function () {
			 
             var checkArr = new Array();

             
             $("input[class='chkbox']:checked").each(function () {
                 checkArr.push($(this).attr("data-cartNum"));

             });

             $("#chk").val(checkArr);
 

            if (confirm("주문 하시겠습니까?")) {
 
                 $("#orderForm").submit();
                 console.log(checkArr);
             }
         });
		
		$(".btn-back_to_shop").click(function() {
			location.assign("/");
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
	
	});
	
</script>

</body>
</html>