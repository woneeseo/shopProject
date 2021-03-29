<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>
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
					<input type="hidden" value="${login.userid}" name="userid" id="login_userid">
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

	<div class="container" style="text-align: center;">
	
	<div class="row">
		<h1 class="page-header" style="text-align: center; margin: 50px 0;">Q&A</h1>
	</div>
	
	<div class="row" style="float: left;">
		<button class="btn btn-defualt btn_b_insert">글 쓰기</button>
		<form action="/board/insert" method="get">
			<input type="hidden" value="${login.userid}" name="userid">
		</form>
	</div>

		<div class="row">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>No.</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${to.list}" var="vo">
						<tr>
							<td>${vo.boardId}</td>
							<td><a href="/board/read/${vo.boardId}">${vo.title}</a>&nbsp;&nbsp;[${vo.replyCnt}]</td>
							<td>${vo.userid}</td>
							<td><fmt:formatDate value="${vo.regDate}" type="date" pattern="yyyy-MM-dd"/></td>
							<td>${vo.viewCnt}</td>
							<c:if test="${login.userid == 'admin'}">
								<td><button class="btn btn-default del_from_board" data-bId="${vo.boardId}">삭제하기</button></td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		

		<div class="row">
			<nav aria-label="Page navigation">
				<ul class="pagination">
				
					<li><c:if test="${to.curPage > 1}">
					<a href="/board/qna/${to.curPage <= 1 ? 1 : to.curPage-1}" aria-label="Previous"> 
					<span aria-hidden="true">
					&laquo;</span></a></c:if></li>
					<!--  << -->
					<c:forEach begin="${to.beginPageNum}" end="${to.stopPageNum}" var="idx">
						<li class="${to.curPage == idx ? 'active' : ''}"><a href="/board/qna/${idx}">${idx}</a></li>
						<!-- 현재 페이지와 idx페이지가 같은 경우에만 class값을 부여해 활성화 된 것 처럼 표현해 줄 수 있다. -->
						<!-- curPage와 idx가 같니? 그렇다면 class에는 active값을 부여해주고, 아니면 그냥 빈칸으로 둬라. -->
					</c:forEach>

					<li><c:if test="${to.curPage < to.totalPage}">
					<a href="/board/qna/${to.curPage >= to.totalPage ? to.totalPage : to.curPage+1}" aria-label="Next">
					<!-- 삼항연산자를 사용해 curPage가 totalPage보다 크면 totalPage값을 가질 수 있도록 설정해줌 -->
					<span aria-hidden="true">
					&raquo;</span></a></c:if></li>
					<!-- >> -->
				</ul>
			</nav>

		</div>		
		
		<div class="row" style="text-align: center; margin-left: 360px;">
			<div class="input-group" style="margin-top: 50px; width: 50%;">
				<span class="input-group-addon">
				<!-- button이 아닐 경우에는 class를 input-group-addon로 지정해준다 -->
					<select id="searchSel">
						<optgroup label="검색 기준">
						<option value="userid">작성자</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
						</optgroup>
					</select>
				</span>
    	 		<input id="keyword" type="text" class="form-control " placeholder="검색어를 입력하세요.">
      			<span class="input-group-btn">
        		<button id="search_btn" class="btn btn-default" type="button">검색</button></span>
    		</div><!-- /input-group -->	
		</div>
	</div>
	
	<hr>
	
	<div class="footer">
		<p>@copyright EZEN computer art academy</p>
	</div>
	
	<script type="text/javascript">
	
	$(document).ready(function() {
		
		var userid = $("#login_userid").val();
		
		$(".del_from_board").click(function(event) {
			event.preventDefault();
			var item = $(this);
			var boardId = item.attr("data-bId");
			
			var isOk = confirm("게시글을 삭제할까요?");
			if (isOk) {
				
				location.assign("/board/delete/" + boardId);
				alert("게시글을 삭제했습니다.");
			} else {
				alert("삭제를 취소합니다.");
			}
		});
		
		$("#search_btn").click(function(){
			
			var searchType = $("#searchSel option:selected").val();
			var keyword = $("#keyword").val();
			var url = "/board/qna/"+searchType+"/"+keyword+"/1";
			window.open(url);
			
		});
		
		$(".btn_b_insert").click(function(event) {
			event.preventDefault();
			
			if (userid == null) {
				alert("로그인이 필요합니다.");
				location.assign("/member/login");
			} else{
				$("form").submit();
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