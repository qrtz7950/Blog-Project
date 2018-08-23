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
		<a style="font-size: 30pt;" >???의 Blog</a>
	</div>
	<div align="right">
		<%-- <c:choose>
			<c:when test="${empty userVO}"}> --%>
				<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='${pageContext.request.contextPath}'">로그인</button>
				<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='${pageContext.request.contextPath}/member/signUp.do'">회원가입</button>
			<%-- </c:when> --%>
			<%-- <c:otherwise> --%>
				<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='${pageContext.request.contextPath}'">로그아웃</button>
			<%-- </c:otherwise>
		</c:choose> --%>
		<br>
		<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='${pageContext.request.contextPath}'" style="margin-top: 10px; margin-bottom: 10px">글쓰기</button>
		<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='${pageContext.request.contextPath}'" style="margin-top: 10px; margin-bottom: 10px">친구신청</button>
	</div>
</div>
<div style="background-color: #6B747C;">
	<div class="btn-group" role="group" aria-label="Button group with nested dropdown" style="background-color: #6B747C;">
	  <button type="button" class="btn btn-secondary">잡담</button>
	  <button type="button" class="btn btn-secondary">일상</button>
	  <button type="button" class="btn btn-secondary">사건</button>
	
	  <div class="btn-group" role="group">
	    <button id="btnGroupDrop1" type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	       	카테고리
	    </button>
	    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
	      <a class="dropdown-item" href="#">카테</a>
	      <a class="dropdown-item" href="#">고리</a>
	      <a class="dropdown-item" href="#">흐헤</a>
	    </div>
	  </div>
	</div>
</div>