<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
 
<div align="center">
	<div align="center">
		<a style="font-size: 30pt;" >${ userVO.id }의 블로그</a>
	</div>
	<div align="right">
		<c:choose>
			<c:when test="${empty userVO}">
				<form action="${pageContext.request.contextPath}/login/loginForm.do" method="post">
				<input type="submit" name="select" value="Login" class="btn btn-outline-secondary btn-sm">
				<input type="submit" name="select" value="regiseter" class="btn btn-outline-secondary btn-sm">
				</form>
			</c:when>
			<c:otherwise>
				<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='${pageContext.request.contextPath}/login/logout.do'">로그아웃</button>
				<form action="${pageContext.request.contextPath}/myBlog.do" method="post">
					<input type="hidden" name="blogID" value="${ userVO.id }">
					<input type="submit" value="내 블로그" class="btn btn-outline-secondary btn-sm">
				</form>
				<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='${pageContext.request.contextPath}/jsp/blog/setting.jsp'" style="margin-top: 10px; margin-bottom: 10px">블로그 설정</button>
			</c:otherwise>
		</c:choose>
		<br>
		<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='${pageContext.request.contextPath}/writeForm.do'" style="margin-top: 10px; margin-bottom: 10px">글쓰기</button>
		<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='${pageContext.request.contextPath}/jsp/friend/friendPlus.jsp'" style="margin-top: 10px; margin-bottom: 10px">친구신청</button>
	</div>
</div>
<div style="background-color: #6B747C;">
	<div class="btn-group" role="group" aria-label="Button group with nested dropdown" style="background-color: #6B747C;">
	  <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/board/blogViewByCategory.do?category=잡담'">잡담</button>
	  <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/board/blogViewByCategory.do?category=일상'">일상</button>
	  <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/board/blogViewByCategory.do?category=사건'">사건</button>
	
	  <div class="btn-group" role="group">
	    <button id="btnGroupDrop1" type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	       	카테고리
	    </button>
	    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
	      <c:forEach var="category" items="${categoryList}" varStatus="status">
		      <c:if test="${status.count > 3}">
		      	<a class="dropdown-item" href="${pageContext.request.contextPath}/board/blogViewByCategory.do?category=${category}">${category}</a>
		      </c:if>
		  </c:forEach>
	    </div>
	  </div>
	</div>
</div>