<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<style>
div {
	word-break: break-all;
}
table.type11 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: center;
    line-height: 1.5;
    margin: 20px 10px;
}
table.type11 th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background-color: #6B747C;
}
table.type11 td {
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
table.type11 tr {
	background: #eee;
}
table.type11 tr:hover{
	background-color: lightyellow;
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
				<h4>[${hashtag}]</h4>
				<hr style="border: thin solid gray;">
				<table class="type11" width="95%">
				    <tr>
				        <th width="50%">제목</th>
				        <th width="15%">작성자</th>
				        <th width="20%">등록일</th>
				        <th width="15%">조회수</th>
				    </tr>
				    <c:forEach var="board" items="${boardList}" varStatus="status">
				   		<c:if test="${status.index/10 >= curPage-1 && status.index/10 < curPage}">
						    <tr>
						        <td onclick="location.href='${pageContext.request.contextPath}/blog/detailBoard.do?blogHost=${board.id}&board_no=${board.board_no}'">${board.title}</th>
						        <td>${board.id}</td>
						        <td>${board.reg_date}</th>
						        <td>${board.view_cnt}</th>
						    </tr>
						</c:if>
					 </c:forEach>
				</table>
				<hr style="border: thin solid gray;">
				
				<div align="center">
					<c:choose>
						<c:when test="${curPage<10}">
							<c:forEach var="i" begin="1" end="${totalPage}">
								<a href="${pageContext.request.contextPath}/board/blogViewByHashtag.do?blogHost=${param.blogHost}&hashtag=${param.hashtag}&curPage=${i}">${i}</a>
								&nbsp;
							</c:forEach>
						</c:when>
						<c:when test="${curPage+10>totalPage}">
							<c:forEach var="i" begin="${totalPage-9}" end="${totalPage}">
								<a href="${pageContext.request.contextPath}/board/blogViewByHashtag.do?blogHost=${param.blogHost}&hashtag=${param.hashtag}&curPage=${i}">${i}</a>
								&nbsp;
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach var="i" begin="${curPage-5}" end="${curPage+5}">
								<a href="${pageContext.request.contextPath}/board/blogViewByHashtag.do?blogHost=${param.blogHost}&hashtag=${param.hashtag}&curPage=${i}">${i}</a>
								&nbsp;
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
				
			</div>
			<jsp:include page="/jsp/include/aside.jsp" />

		</div>
		</main>

	</div>
</body>
</html>