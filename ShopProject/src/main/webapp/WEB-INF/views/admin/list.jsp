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
			<li class="li_btns active"><a href="/admin/list">회원 관리</a></li>
			<li class="li_btns"><a href="/admin/product/insert">상품 등록</a></li>
			<li class="li_btns"><a href="/admin/product/list">상품 조회</a></li>
		</ul>
	</div>

	<div class="container admin_container">
		<div class="row">
			<h1 class="jumbotron" style="text-align: center; margin: 50px 0;">회원 리스트</h1>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>회원ID</th>
						<th>이름</th>
						<th>Email</th>
						<th>전화번호</th>
						<th>주소</th>
						<th>생일</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${to.list}" var="vo">
						<tr>
							<td><a href="/member/read/${vo.userid}">${vo.userid}</a></td>
							<td>${vo.username}</td>
							<td>${vo.email}</td>
							<td>${vo.tel}</td>
							<td>${vo.useraddress}</td>
							<td>${vo.birthDate}</td>
							<td>
								<button class="btn btn-default del_member" data-Id="${vo.userid}">회원 삭제</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- class = row -->
		<div class="row">
			<nav aria-label="Page navigation">
				<ul class="pagination">
				
					<li><c:if test="${to.curPage > 1}">
					<a href="/admin/list/${to.curPage <= 1 ? 1 : to.curPage-1}" aria-label="Previous"> 
					<span aria-hidden="true">
					&laquo;</span></a></c:if></li>
					<!--  << -->
					<c:forEach begin="${to.beginPageNum}" end="${to.stopPageNum}" var="idx">
						<li class="${to.curPage == idx ? 'active' : ''}"><a href="/admin/list/${idx}">${idx}</a></li>
						<!-- 현재 페이지와 idx페이지가 같은 경우에만 class값을 부여해 활성화 된 것 처럼 표현해 줄 수 있다. -->
						<!-- curPage와 idx가 같니? 그렇다면 class에는 active값을 부여해주고, 아니면 그냥 빈칸으로 둬라. -->
					</c:forEach>

					<li><c:if test="${to.curPage < to.totalPage}">
					<a href="/admin/list/${to.curPage >= to.totalPage ? to.totalPage : to.curPage+1}" aria-label="Next">
					<!-- 삼항연산자를 사용해 curPage가 totalPage보다 크면 totalPage값을 가질 수 있도록 설정해줌 -->
					<span aria-hidden="true">
					&raquo;</span></a></c:if></li>
					<!-- >> -->
				</ul>
			</nav>

		</div>		
	</div>
	<script type="text/javascript">
	
	$(document).ready(function() {
		
		$(".del_member").click(function() {
			var item = $(this);
			var userid = item.attr("data-Id");
			var isOk = confirm("회원을 삭제합니다.");
			
			if (isOk) {
				$.ajax({
					
					type : 'post',
					url : '/admin/memberDelete/' + userid,
					data : {
						userid : userid
					},
					dataType : 'text',
					success : function(result) {
						if (result == 1) {
							alert("회원 삭제가 완료되었습니다.");
							location.assign("/admin/list");
						} else {
							alert("회원 삭제에 실패하였습니다.");
						}
					}
					
				});
				
			}
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