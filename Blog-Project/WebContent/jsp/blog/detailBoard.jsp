<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script>
	function displayReply(){
		var con = document.getElementById("replies");
		
		if(con.style.display=='none'){
			con.style.display = 'block';
		}else{
			con.style.display = 'none';
		}
	}

	function displayReplyInput(num){
		var con = document.getElementById("replyInput"+num);
		
		if(con.style.display=='none'){
			con.style.display = 'block';
		}else{
			con.style.display = 'none';
		}
	}
	
	function checkReply(num){
		if(${empty userVO}){
			alert("로그인을 해야 이용할수 있습니다");
			return false;
		}
		if(document.getElementById("replyContent"+num).value == ""){
			alert("글을 입력해주세요")
			return false;
		}
		return true;
	}
	
	function checkLogin(num){
		if(${empty userVO}){
			alert("로그인을 해야 이용할수 있습니다");
			return false;
		}
		return true;
	}
</script>
<style>
	div{
		word-break: break-all;
	}
	.replyForm1{
		text-align: center; vertucak-align: middle;
		display: inline-block;
		width: 15%;
		
	}
	.replyForm2{
		display: inline-block;
		padding: 10px;
	}
	.replyForm3{
		text-align: center; vertucak-align: middle;
		display: inline-block;
		width: 15%;
	}
	.replyForm4{
		text-align: center; vertucak-align: middle;
		display: inline-block;
		width: 10%;
	}
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="/jsp/include/topMenu.jsp" />
		<br>

		<main role="main" class="container">
		<div class="row">
			<div class="col-md-8 blog-main">
				<a>[${detailBlogBoard.category_name}]</a>
				<h3 style="font-weight: bold; margin-left: 10px; margin-top: 10px;">${detailBlogBoard.title}</h3>
				<a style="float: right;">${detailBlogBoard.reg_date}</a><br>
				<hr style="border: thin solid gray;">
				<br>
				<div class="blog-post">
					${detailBlogBoard.content}
				</div>
				<br>
				<table width="100%">
					<tr>
						<td width="10%">
							<form action="${pageContext.request.contextPath}/board/like.do" onsubmit="return checkLogin()" method="post">
								<input type="hidden" name="board_no" value="${detailBlogBoard.board_no}">
								<button id="like" type="submit" class="btn btn-light btn-sm" ><img src="${ pageContext.request.contextPath }/img/like.jpg" /></button>
							</form>
						</td>
						<td colspan="3">
							<sub>${detailBlogBoard.like_cnt}명이 이 게시물을 좋아합니다</sub>
						</td>
					</tr>
					<tr>
						<td></td>
						<td width="30%">${hashtags[0]}</td>						
						<td width="30%">${hashtags[1]}</td>						
						<td width="30%">${hashtags[2]}</td>						
					</tr>
				</table>
				<hr style="border: thin solid gray;">
				<a style="font-size: 12px; font-weight: bold;" href="javascript:void(0)" onclick="displayReply()">댓글 ${fn:length(replyList)}</a>
				|&nbsp;<a style="font-size: 12px; font-weight: bold;">조회수 ${detailBlogBoard.view_cnt}</a>
				<br>
				
				<div id="replies" style="display: none; background-color: #F2F2F2;">
					<c:forEach var="reply" items="${replyList}" varStatus="status">
						<div id="reply${status.count}">
							<div style="margin-left: ${reply.depth*5}%;">
								<div class="replyForm1">${reply.id}</div>
								<div class="replyForm2" style="width: ${55-reply.depth*1}%">${reply.content}</div>
								<div class="replyForm3">${reply.reg_date}</div>
								<c:if test="${reply.depth==0}">
									<div class="replyForm4"><a href="javascript:void(0)" onclick="displayReplyInput(${status.count})" style="text-decoration: none;")>답하기</a></div>
								</c:if>
							</div>
							<div id="replyInput${status.count}" style="display: none;">
								<form action="${pageContext.request.contextPath}/reply/write.do" onsubmit="return checkReply(${status.count})" method="post">
									<div class="input-group" style="width: 95%;  margin: 0 auto;">
										  <input type="hidden" name="board_no" value="${detailBlogBoard.board_no}">
										  <input type="hidden" name="id" value="${sessionScope.userVO.id}">
										  <input type="hidden" name="depth" value="1">
										  <input type="hidden" name="seq" value="${reply.seq}">
										  <textarea type="text" class="form-control" placeholder="남기고 싶은 댓글을 남기세요" name="content" id="replyContent${status.count}"></textarea>
										  <div class="input-group-append">
										    <button class="btn btn-outline-secondary" type="submit" id="button-addon2">댓글달기</button>
										  </div>
									</div>
								</form>
							</div>
							<hr>
						</div>
						<c:if test="${status.count==replyList.size()}">
							<c:set var="replySeqMax" value="${reply.seq}" scope="page" />
						</c:if>
					</c:forEach>
					<div id="replyInput0">
						<form action="${pageContext.request.contextPath}/reply/write.do" onsubmit="return checkReply(0)" method="post">
							<div class="input-group" style="width:95%;  margin: 0 auto;">
								  <input type="hidden" name="board_no" value="${detailBlogBoard.board_no}">
								  <input type="hidden" name="id" value="${sessionScope.userVO.id}">
								  <input type="hidden" name="depth" value="0">
								  <input type="hidden" name="seq" value="${pageScope.replySeqMax+1}">							  
								  <textarea type="text" class="form-control" placeholder="남기고 싶은 댓글을 남기세요" name="content" id="replyContent0"></textarea>
								  <div class="input-group-append">
								    <button class="btn btn-outline-secondary" type="submit" id="button-addon">댓글달기</button>
								  </div>
							</div>
						</form>
					</div>
				</div>
				<br>
			</div>
			<jsp:include page="/jsp/include/aside.jsp" />

		</div>
		</main>

	</div>
</body>
</html>