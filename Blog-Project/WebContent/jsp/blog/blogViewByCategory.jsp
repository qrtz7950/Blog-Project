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
				<h4>[${category}]</h4>
				<hr style="border: thin solid gray;">
				<table class="type11" width="95%">
				    <tr>
				        <th width="60%">제목</th>
				        <th width="15%">등록일</th>
				        <th width="15%">조회수</th>
				    </tr>
				    <c:forEach var="board" items="${boardList}">
					    <tr>
					        <td onclick="location.href='${pageContext.request.contextPath}/blog/detailBoard.do?board_no=${board.board_no}'">${board.title}</th>
					        <td>${board.reg_date}</th>
					        <td>${board.view_cnt}</th>
					    </tr>
					 </c:forEach>
				</table>
				<hr style="border: thin solid gray;">
				
			</div>
			<jsp:include page="/jsp/include/aside.jsp" />

		</div>
		</main>

	</div>
</body>
</html>