<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script>
	$(document).ready(function(){
		$('.reply4').click(function (){
			
			var con = document.getElementById("replyInput");
			
			if(con.style.display=='none'){
				con.style.display = 'block';
			}else{
				con.style.display = 'none';
			}
		})
	})
	
	function displayReplyInput(num){
		var con = document.getElementById("replyInput"+num);
		
		if(con.style.display=='none'){
			con.style.display = 'block';
		}else{
			con.style.display = 'none';
		}
	}
</script>
<style>
	.replyForm1{
		word-wrap: break-word;
		display: inline-block;
		width: 20%;
	}
	.replyForm2{
		word-wrap: break-word;
		display: inline-block;
		width: 45%;
	}
	.replyForm3{
		word-wrap: break-word;
		display: inline-block;
		width: 20%;
	}
	.replyForm4{
		word-wrap: break-word;
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
				<h3 style="font-weight: bold;">게시글 제목</h3>
				<a style="float: right;">등록일</a><br>
				<hr style="border: thin solid gray;">
				<br>
				<div class="blog-post">
					게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글<br>
					게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글<br>
					게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글<br>
					게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글<br>
					게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글<br>
					게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글<br>
					게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글<br>
					게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글게시글
				</div>
				<br>
				<table width="100%">
					<tr>
						<td width="10%">
							<button id="like" type="submit" class="btn btn-light btn-sm" ><img src="../../img/like.jpg" /></button>
						</td>
						<td colspan="3">
							<sub>?명이 이 게시물을 좋아합니다</sub>
						</td>
					</tr>
					<tr>
						<td></td>
						<c:forEach begin="1" end="3">
							<td>
								#열글자까지만된답니다
							</td>						
						</c:forEach>						
					</tr>
				</table>
				<hr style="border: thin solid gray;">
				&lt; 댓글 &gt;
				<br>
				
				<c:forEach begin="1" end="10" varStatus="status">
					<div id="reply${status.count}">
						<div>
							<div class="replyForm1">id${status.count}</div>
							<div class="replyForm2">ㅎㅇ</div>
							<div class="replyForm3">등록일</div>
							<div class="replyForm4"><a href="javascript:void(0)" onclick="displayReplyInput(${status.count})" style="text-decoration: none;")>답하기</a></div>
						</div>
						<div id="replyInput${status.count}" style="display: none;">
							<form action="#">
								<div class="input-group" style="width: 95%;">
									  <textarea type="text" class="form-control" placeholder="남기고 싶은 댓글을 남기세요" aria-label="reply" aria-describedby="button-addon2"></textarea>
									  <div class="input-group-append">
									    <button class="btn btn-outline-secondary" type="submit" id="button-addon2">댓글달기</button>
									  </div>
								</div>
							</form>
						</div>
					</div>
				</c:forEach>
				
				
				<br>
				<form action="#">
					<div class="input-group">
						  <textarea type="text" class="form-control" placeholder="남기고 싶은 댓글을 남기세요" aria-label="reply" aria-describedby="button-addon2"></textarea>
						  <div class="input-group-append">
						    <button class="btn btn-outline-secondary" type="submit" id="button-addon">댓글달기</button>
						  </div>
					</div>
				</form>
				<br>
			</div>
			<!-- /.blog-main -->

			<aside class="col-md-4 blog-sidebar">
				<div class="p-3 mb-3 bg-light rounded">
					<h4 class="font-italic">방문자수</h4>
					<p class="mb-0">Today 2000 Total 1000000</p>
				</div>

				<div class="p-3">
					<h4 class="font-italic">게시물 업로드 날짜</h4>
					<ol class="list-unstyled mb-0">
						<li><a href="#">March 2014</a></li>
						<li><a href="#">February 2014</a></li>
						<li><a href="#">January 2014</a></li>
						<li><a href="#">December 2013</a></li>
						<li><a href="#">November 2013</a></li>
						<li><a href="#">October 2013</a></li>
						<li><a href="#">September 2013</a></li>
						<li><a href="#">August 2013</a></li>
						<li><a href="#">July 2013</a></li>
						<li><a href="#">June 2013</a></li>
						<li><a href="#">May 2013</a></li>
						<li><a href="#">April 2013</a></li>
					</ol>
				</div>
				<div class="p-3">
					<h4 class="font-italic">오늘의 날씨</h4>
				</div>
				<div class="p-3">
					<h4 class="font-italic">Elsewhere</h4>
					<ol class="list-unstyled">
						<li><a
							href="https://github.com/qrtz7950/MVC-Model-2-Blog-Project">GitHub</a></li>
						<li><a href="#">Twitter</a></li>
						<li><a href="#">Facebook</a></li>
					</ol>
				</div>
			</aside>
			<!-- /.blog-sidebar -->

		</div>
		<!-- /.row --> </main>

	</div>
</body>
</html>