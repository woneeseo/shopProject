<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
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
#text_in_the_image {
	float: left;
	margin-top: 50px;
	margin-left: 130px;
	text-align: left;
}

#text_in_the_image h1 {
	font-size: 5em;
	font-family: 'Impact';
}

#text_in_the_image h3 {
	font-size: 3em;
	font-family: 'Copperplate';
}

#text_in_the_image p {
	font-size: 8em;
	font-family: 'Impact';
}

#text_in_the_image p span {
	text-align: center;
	font-family: 'Impact';
	color: red;
	text-shadow: 3px 4px 5px gray;
}

.side_nav {
	width: 15% !important;
	margin-top: 10px;
	float: left;
	margin-right: 20px;
	text-align: center;
}

.admin_container {
	float: right;
	width: 80%;
	margin-right: 30px;
}

.productInfo {
	float: right;
	text-align: left;
	width: 50%;
}

.productInfo .btns {
	text-align: center;
	margin-top: 50px;
}

#fileDrop {
	float: left;
	width: 40%;
	border: 1px solid;
	height: 150px;
}

.fileDrop {
	float: left;
	width: 100%;
	height: 150px;
}

.uploadedList {
	padding: 0;
}

.uploadedList li {
	list-style: none;
	margin-right: 20px;
}

.uploadedList p {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
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
					<span id="login_log" style="border-bottom: 1px solid white;">${login.userid} ???, ???????????????.</span>
					<span class="glyphicon glyphicon-heart-empty" style="color: white;" aria-hidden="true"></span>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<c:if test="${login.userid == 'admin'}">
						<button id="go_to_adminPage">????????? ?????????</button>
					</c:if>
					<button id="mypage_btn">???????????????</button>
					<button id="logout_btn">????????????</button>
					<input type="hidden" value="${login.userid}" id="login_userid">
				</c:when>
				
				<c:otherwise>
					<button onclick="location.href='/member/login'">?????????</button><button onclick="location.href='/member/insert'">????????????</button>
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
			<li class="li_btns"><a href="/admin/orderedlist">?????? ??????</a></li>
			<li class="li_btns"><a href="/admin/list">?????? ??????</a></li>
			<li class="li_btns active"><a href="/admin/product/insert">?????? ??????</a></li>
			<li class="li_btns"><a href="/admin/product/list">?????? ??????</a></li>
		</ul>
	</div>

	<div class="container admin_container">
		<div class="row">
			<h1 class="jumbotron" style="text-align: center; margin: 50px 0;">?????? ??????</h1>
			<div class="form-group hidden-xs" id="fileDrop">
				<label>????????? ??? ????????? ????????? ???????????????.</label>	
					<div class="fileDrop"></div>
					<ul class="clearfix uploadedList col-xs-12"></ul>
			</div>
			<div class="form-group productInfo">
				<form action="/admin/product/insert" method="post">
					<div>
						<label>?????? ID</label> <input name="productId" value="${productInfo.productId}" class="form-control productId" required>
					</div>
					<div>
						<label>?????????</label> <input name="productName" value="${productInfo.productName}" class="form-control" required>
					</div>
					<div>
						<label>????????????</label> <input name="price" value="${productInfo.price}" class="form-control" required>
					</div>
					<div>
						<label>????????????</label>
						<div class="form-inline">
							<select class="form-control" id="productDist">
								<option value="outer">1. ??????</option>
								<option value="top">2. ??????</option>
								<option value="bottom">3. ??????</option>
								<option value="bag">4. ??????</option>
								<option value="acc">5. ????????????</option>
							</select>
							<button class="btn btn-default btn_productDist">??????</button>
							<input name="productDist" value="${productInfo.productDist}"
								class="form-control" readonly>
						</div>
					</div>
					<div>
						<label>??????</label> <input name="stock" value="${productInfo.stock}" class="form-control" required>
					</div>
					<div>
						<label>????????????</label> <input name="productInfo" value="${productInfo.productInfo}" class="form-control" required>
					</div>

					<div class="btns">
						<button class="btn btn-default" type="submit" id="btn_product_insert">?????? ??????</button>
						<button class="btn btn-default" id="btn_product_back">?????? ???????????? ????????????</button>
					</div>
				</form>
			</div>
		</div>

		<!-- class = row -->
	</div>
	
	<script type="text/javascript">
	
	$(document).ready(function() {
		
		$("li").on('click', function() {
			var productDist = $(this).attr("value");
			
			if (productDist == 'qna') {
				location.assign("/board/qna");
			} else {
				location.assign("/product/" + productDist);
			}		
		});
		
		$.getJSON("/admin/productList", function(result) {
			
			var str = '';
			
			$(result).each(function() {
				var data = this; 
				
				str += makeHtmlcode_list(data);
					
			});
			
			$(".products").html(str);
			
		});
		
		var productId = $("input[name='productId']").val();
		
		$(".uploadedList").on('click', '.delbtn', function(event) {
			
			var isOK = confirm("?????????????????? ??????????????? ????????? ???????????? ??????????????? ???????????????.");
			
			if (isOK) {
				
				var that = $(this);
				
				$.ajax({
					type : 'post',
					url : '/deleteFile',
					data : {
						filename : that.attr("data-src")
					},
					dataType : 'text',
					success : function(result) {
						
						if (result =="O") {
							
							that.parent().parent().parent().remove();
							
							$.ajax({
								type : 'post',
								url : '/admin/product/deleteFile',
								data : {
									filename : that.attr("data-src")
								},
								dataType : 'text',
								success : function(result) {
									alert("????????? ?????????????????????.");
								}
							});
							
						} else {
							alert("????????????");
						}
					}
				});
				
			} else {
				
				alert("????????? ??????????????????.");
			}

		});
		
		$.getJSON("/admin/product/getAttaches/" + productId, function(result) {
			
			var str = '';
			$(result).each(function() {
				var data = this; 
				str += makeHtmlcode(data);
			});
	
			$(".uploadedList").html(str);

		});
		
		$(".fileDrop").on("dragenter dragover", function(event) {
			event.preventDefault();
		});
		
		$(".fileDrop").on("drop", function(event) {
			event.preventDefault();

			var files = event.originalEvent.dataTransfer.files;
			var file = files[0];
			
			var formData = new FormData();
			formData.append("file",file);
			
			$.ajax({
				
				type : 'post',
				url : '/ajaxtest', 
				data : formData,
				processData : false,
				contentType : false,
				dataType : 'text',
				success : function (data) {
					var str = makeHtmlcode(data);
					
					$(".uploadedList").append(str);
				}
			});

		});
		
		$("#btn_product_insert").click(function(){
			
			var str = '';
			$(".delbtn").each(function(index) {
				
				var data = $(this).attr("data-src");
				str += '<input type="hidden" value="' + data + '" name="files[' + index + ']">';
			});
			
			$("form").append(str);

			$("form").submit();
		});
		
		
		var productId = $(".productId").val();
		
		
		
		$(".btn_productDist").on('click', function(event) {
			event.preventDefault();
			var productDist = $("#productDist option:selected").val();
			console.log(productDist);
			$("input[name='productDist']").val(productDist);
			var log = $("input[name='productDist']").val();
			console.log(log);
		
		});
		
		
		$("#btn_product_back").click(function(event) {
			event.preventDefault();
			history.back();
		});
		
		
		$("#go_to_member_insert").click(function(event) {
			event.preventDefault();
			
			location.assign("/member/insert");
		});
		
		$("#mypage_btn").click(function(event) {
			event.preventDefault();
			var userid = $("#login_userid").val();
			
			location.assign("/member/read/" + userid);
		});
		
		$("#logout_btn").click(function(event) {
			event.preventDefault();
			
			var logout = confirm("???????????? ???????????????????");
			
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