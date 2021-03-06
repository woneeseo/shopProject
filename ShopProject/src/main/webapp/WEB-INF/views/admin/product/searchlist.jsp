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
			<li class="li_btns"><a href="/admin/orderedlist">주문 현황</a></li>
			<li class="li_btns"><a href="/admin/list">회원 관리</a></li>
			<li class="li_btns"><a href="/admin/product/insert">상품 등록</a></li>
			<li class="li_btns active"><a href="/admin/product/list">상품 조회</a></li>
		</ul>
	</div>

	<div class="container admin_container">
		<div class="row">
			<h1 class="jumbotron" style="text-align: center; margin: 50px 0;">상품 리스트</h1>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>상품 ID</th>
						<th>상품명</th>
						<th>가격</th>
						<th>재고</th>
						<th>판매량</th>
						<th>상품 구분</th>
						<th>상품 정보</th>
						<th>상품 등록일</th>
						<th>최종 업데이트</th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${spt.list}" var="dto">
						<tr>
							<td><a href="/admin/product/read/${dto.productId}">${dto.productId}</a></td>
							<td>${dto.productName}</td>
							<td>${dto.price}</td>
							<td>${dto.stock}</td>
							<td>${dto.sold_rate}</td>
							<td>${dto.productDist}</td>
							<td>${dto.productInfo}</td>
							<td><fmt:formatDate value="${dto.regDate}" pattern="yyyy-MM-dd" type="date"/></td>
							<td><fmt:formatDate value="${dto.updateDate}" pattern="yyyy-MM-dd" type="date"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- class = row -->
		<div class="row">
			<nav aria-label="Page navigation">
				<ul class="pagination">
				
					<li><c:if test="${spt.curPage > 1}">
					<a href="/admin/product/list/${spt.searchType}/${spt.keyword}/${spt.curPage <= 1 ? 1 : spt.curPage-1}" aria-label="Previous"> 
					<span aria-hidden="true">
					&laquo;</span></a></c:if></li>
					<!--  << -->
					<c:forEach begin="${spt.beginPageNum}" end="${spt.stopPageNum}" var="idx">
						<li class="${spt.curPage == idx ? 'active' : ''}"><a href="/admin/product/list/${spt.searchType}/${spt.keyword}/${idx}">${idx}</a></li>
						<!-- 현재 페이지와 idx페이지가 같은 경우에만 class값을 부여해 활성화 된 것 처럼 표현해 줄 수 있다. -->
						<!-- curPage와 idx가 같니? 그렇다면 class에는 active값을 부여해주고, 아니면 그냥 빈칸으로 둬라. -->
					</c:forEach>

					<li><c:if test="${spt.curPage < spt.totalPage}">
					<a href="/admin/product/list/${spt.searchType}/${spt.keyword}/${spt.curPage >= spt.totalPage ? spt.totalPage : spt.curPage+1}" aria-label="Next">
					<!-- 삼항연산자를 사용해 curPage가 totalPage보다 크면 totalPage값을 가질 수 있도록 설정해줌 -->
					<span aria-hidden="true">
					&raquo;</span></a></c:if></li>
					<!-- >> -->
				</ul>
			</nav>

		</div>	
		
		<div class="row" style="text-align: center; margin-left: 360px; margin-bottom: 100px;">
			<div class="input-group" style="margin-top: 50px; width: 50%;">
				<span class="input-group-addon">
				<!-- button이 아닐 경우에는 class를 input-group-addon로 지정해준다 -->
					<select id="searchSel">
						<optgroup label="검색 기준">
						<option value="productName">상품명</option>
						<option value="productId">상품ID</option>
						<option value="productDist">상품구분</option>
						</optgroup>
					</select>
				</span>
    	 		<input id="keyword" type="text" class="form-control " placeholder="검색어를 입력하세요.">
      			<span class="input-group-btn">
        		<button id="search_btn" class="btn btn-default" type="button">검색</button></span>
    		</div><!-- /input-group -->	
		</div>
	</div>
	</div>

	<script type="text/javascript">
	
	$(document).ready(function() {
		
		$("#search_btn").click(function(){
			
			var searchType = $("#searchSel option:selected").val();
			var keyword = $("#keyword").val();
			var url = "/admin/product/list/"+searchType+"/"+keyword+"/1";
			window.open(url);
			
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