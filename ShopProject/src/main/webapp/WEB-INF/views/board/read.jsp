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
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
	#idCheck {
		margin-top: 10px;
	}
	
	h1{
		text-align: center;
		padding: 10px;
	}
	
	#inputAdd{
		margin-top: 10px;
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
					&nbsp;&nbsp;&nbsp;&nbsp;<button id="mypage_btn">마이페이지</button>
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

	<div class="container">
		<div class="row">
			<h1 class="page-header" style="text-align: center; margin-bottom: 80px;">${dto.title}</h1>
		</div>
		<div class="row" style="text-align: center;">
			<form class="form-horizontal" action="/board/insert" method="post">
				<div class="form-group">
					<label for="boardId" class="col-sm-2 control-label">글 번호</label>
					<div class="col-sm-4">
						<input class="form-control" id="boardId" value="${dto.boardId}" name="boardId" readonly>
					</div>
					<label for="qna_type" class="col-sm-2 control-label">구분</label>
					<div class="col-sm-4">
						<input class="form-control" id="qna_type" value="${dto.qna_type}" name="qna_type" readonly>
					</div>
				</div>			
				<div class="form-group">
					<label for="productName" class="col-sm-2 control-label">상품명</label>
					<div class="col-sm-4">
						<input class="form-control" id="productName" value="${dto.productName}" name="productName" readonly>
					</div>
					<label for="userid" class="col-sm-2 control-label">작성자</label>
					<div class="col-sm-4">
						<input class="form-control" id="userid" value="${dto.userid}" name="userid" readonly>
					</div>
				</div>
				<div class="form-group">
					<label for="regDate" class="col-sm-2 control-label">작성일</label>
					<div class="col-sm-10">
						<input class="form-control" id="regDate" value="${dto.regDate}" name="regDate" readonly>
					</div>
				</div>
				<div class="form-group">
					<label  for="content" class="col-sm-2 control-label">내용</label>
					<div class="col-sm-10">
						<textarea rows="10" name="content" class="form-control" readonly>${dto.content}</textarea>
					</div>
				</div>			
								
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
					<c:if test="${login.userid == 'admin'}">
						<button id="reply_form" class="btn btn-default">댓글</button>
					</c:if>
					<c:choose>
						<c:when test="${dto.userid == login.userid}">
							<button type="submit" class="btn btn-default update">글 수정하기</button>
							<button type="submit" class="btn btn-default delete">글 삭제하기</button>
							<button type="submit" class="btn btn-default back_to_qna">Q&A로 돌아가기</button>
						</c:when>
						<c:otherwise>
							<button type="submit" class="btn btn-default update" disabled="disabled">글 수정하기</button>
							<button type="submit" class="btn btn-default back_to_qna">Q&A로 돌아가기</button>
						</c:otherwise>
					</c:choose>	
					</div>
				</div>
			</form>
		</div><!-- class=row -->

		<div class="collapse form-horizontal" id="myCollapse" style="text-align: center;">
			<div class="form-group">
				<label for="writer" class="col-sm-2 control-label">작성자</label> 
				<div class="col-sm-10">
					<input class="form-control" id="writer" value="${login.userid}" name="writer" readonly>
				</div>
			</div>

			<div class="form-group">
				<label for="rep_content" class="col-sm-2 control-label">내용</label>
				<div class="col-sm-10">
					<textarea class="form-control" id="rep_content" name="rep_content" rows="5"></textarea>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
				<button class="btn btn-default" id="board_read_btn_rep_insert">댓글등록</button>
				<button class="btn btn-default" id="board_read_btn_rep_reset">초기화</button>
				</div>
			</div>
		</div>

		<div class="row">
			<label for="rep_content" class="col-sm-2 control-label"></label>
			<div id="replies"></div>
		</div>
		
		<div class="row">
		<!-- 부트스트랩에서 modal 검색 후 긁어오기 : modal 팝업창 같은 기능인데, 내가 버튼을 누르지 않으면 없어지지 않음 -->
			<div id="myModal" class="modal fade" tabindex="-1" role="dialog">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title"></h4>
						</div>
						<div class="modal-body">
							<input id="modal_reply_text" class="form-control" />
							<!-- modal창의 댓글 내용을 보여주며 수정할 수 있도록 입력받게 하는 곳 -->
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
							<button id="modal_btn_update" type="button" class="btn btn-primary" data-dismiss="modal">댓글 수정</button>
								<!-- data-dismiss="modal" : 작업이 완료되면 modal창을 사라지게 하는 속성 -->
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
		</div>
		<!-- class = row for modal -->		
		
	</div><!-- class=container -->


<script type="text/javascript">

	$(document).ready(function() {
		
		var boardId = $("#boardId").val();
		var curPage = 1;
		
		
		$("#reply_form").on('click', function(event) {
			event.preventDefault();
			$("#myCollapse").collapse("toggle");
		});
		
		
		$("#replies").on('click', '.btn-update', function() {
			
			var rno = $(this).attr("data-rno");
			$(".modal-title").text(rno);
			var replytext = $(this).prev("p").text();
			$("#modal_reply_text").val(replytext);
			$("#myModal").modal("show");
			
		});
		

		$("#modal_btn_update").click(function() {
		
			var rep_no = $(".modal-title").text();
			var rep_content = $("#modal_reply_text").val();
		
			$.ajax({
			
				type : 'put',
				url : '/reply',
				headers : {
					'Content-Type' : 'application/json',
					'X-HTTP-Method-Override' : 'put'
				},
			
				data : JSON.stringify({
					rep_no : rep_no,
					rep_content : rep_content
				}),
			
				dataType : 'text',
				success : function(result) {
					if (result == "O") {
						alert("수정하였습니다.");
						list(boardId, 1);
					} else {
					 	alert("수정을 실패하였습니다.");
					}
					
				}
			});
		});	
	
		

		$("#replies").on('click', ".btn-delete" ,function() {
			var backEle = $(this);
			var rep_no = $(this).attr("data-rno");
			var boardId = $("#boardId").val();

			var yesOrNo = confirm("정말로 삭제하시겠습니까?");
			if (yesOrNo) {
				
				$.ajax({
					
					type : 'delete',
					url : '/reply',
					headers : {
						'Content-Type' : 'application/json',
						'X-HTTP-Method-Override' : 'delete'
					},
					
					data : JSON.stringify({
						rep_no : rep_no,
						boardId : boardId
					}),
					
					dataType : 'text',
					success : function (result) {
						
						if (result == "O") {
							backEle.parent().parent().remove();
							alert("댓글이 삭제되었습니다.");
						} else {
							alert("삭제를 실패하였습니다.");
						}
					}
				});
				
			} else {
				alert("삭제가 취소되었습니다.");
			}
		});
		
		setQnaType();
		
		$(".delete").click(function(event) {
			event.preventDefault();
			
			var writer = $("#userid").val();
			var loginId = $("#login_userid").val();
			
			if (writer == loginId) {
				var isOk = confirm("정말로 삭제할까요?");
				if (isOk) {
					var boardId = $("#boardId").val();
					location.assign("/board/delete/" + boardId);
					alert("삭제가 완료되었습니다.");
				} else {
					alert("삭제를 취소했습니다.");
				}			
			} else {
				alert("삭제할 수 있는 권한이 없습니다.");
			}
			
		});
		
		$(".update").click(function(event) {
			event.preventDefault();
			
			var writer = $("#userid").val();
			var loginId = $("#login_userid").val();
			
			if (writer == loginId) {
				var boardId = $("#boardId").val();
				location.assign("/board/update/" + boardId);
			} else {
				alert("수정할 수 있는 권한이 없습니다.");
			}
			
		});
		
		$(".back_to_qna").click(function(event) {
			event.preventDefault();
			location.assign("/board/qna");
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
		
		function setQnaType() {
			
			var str = '';
			var qnaType = $("#qna_type").val();
			
			if (qnaType == 1) {				
				str = "상품관련";
				$("#qna_type").val(str);
			} else if (qnaType == 2) {
				str = "배송관련";
				$("#qna_type").val(str);
			} else if (qnaType == 3) {
				str = "상품리뷰";
					$("#qna_type").val(str);
			} else if (qnaType == 4) {
				str = "기타문의";
					$("#qna_type").val(str);
			}
		}
		
		
		$("#board_read_btn_rep_reset").on('click', function() {
			replyInputReset();
		});
		
		$("#board_read_btn_rep_insert").on('click', function() {
			
			var writer = $("#writer").val();
			var rep_content = $("#rep_content").val();
			var boardId = $("#boardId").val();
			
			
 			$.ajax({
				
				type : 'post',
				url : '/reply',
				headers : {
		             'Content-Type' : 'application/json',
		             'X-HTTP-Method-Override' : 'post'
		        },
				
				data : JSON.stringify({
					
					boardId : boardId,
					writer : writer,
					rep_content : rep_content
				}),
				
				dataType : 'text',
				success : function(result) {
					
					if(result == "o"){
						alert("댓글 입력이 성공했습니다.");
						replyInputReset();
						list(boardId,1);
					} else {
						alert("댓글 입력이 실패했습니다.");
					}
				}
			}); 
			
		});
		
		list(boardId,1);
		
		function replyInputReset() {
			
			$("#rep_content").val("");			
		}
		
		function list(boardId, curPage) {
			
			$.getJSON("/reply/"+boardId, function(result) {
				
				var str = '';
				var arr = result;
				
				for(var i = 0; i<arr.length; i++){
					var obj = arr[i];
					var d = new Date(obj["updateDate"]);
					var year = d.getFullYear();
					var month = d.getMonth()+1 < 10 ? '0'+ (d.getMonth()+1) : (d.getMonth()+1);
					var date = d.getDate() < 10 ? '0'+d.getDate() : d.getDate();
					
					var dateStr = year + "/" + month + "/" + date;
					
					str += '<div class="panel panel-default col-sm-10">' +
					'<div class="panel-heading">' +
						'<span>No.:'+ obj["rep_no"] + '<span class="glyphicon glyphicon glyphicon-user" aria-hidden="true"></span> 작성자:'
						+ obj["writer"] +'</span>'
						+ '<span class="pull-right"><span class="glyphicon glyphicon glyphicon-time" aria-hidden="true"></span> 최종수정일:'
						+ dateStr +'</span></div>'
						+ '<div class="panel-body">'
						+ '<p>' + obj["rep_content"] +'</p>'
						+ '<c:if test="${login.userid == 'admin'}">'
						+ '<button data-rno="'+ obj["rep_no"]+'" class="btn btn-default btn-sm btn-update">수정</button>'
						+ '&nbsp;&nbsp;&nbsp;'
						+ '<button data-rno="'+ obj["rep_no"]+'" class="btn btn-sm btn-delete">삭제</button></c:if>'
					+ '</div>'
				 + '</div>';
				}
				
				$("#replies").html(str);
				
			});
				
		}
	    
	});

</script>
</body>
</html>