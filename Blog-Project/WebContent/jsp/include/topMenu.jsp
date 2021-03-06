<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script type="text/javascript">
	
		var myId = '${userVO.id}';
		var friendId = '${param.blogHost}';
		
		console.log(myId,friendId)
		
		function firendRequest() {
			if(myId == ''){
				alert('로그인이 필요한 서비스 입니다');
			} else {
				var bool = confirm(friendId + " 님에게 친구 신청을 보냅니다");
				if(bool){
					location.href = "${pageContext.request.contextPath}/friend/friendPlus.do?friendId=" + friendId + "&myId=" + myId;
				} else{
					alert("친구신청을 취소하였습니다.");
				}
			}
		}

	</script>
</head>
 
<div align="center">
	<div align="center">
		<a href="${pageContext.request.contextPath}/blogHome.do?blogHost=${param.blogHost}" style="font-size: 30pt;" >${param.blogHost}의 블로그</a>
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
				<form action="${pageContext.request.contextPath}/blogHome.do?blogHost=${userVO.id}" method="post">
					<input type="hidden" name="blogID" value="${ userVO.id }">
					<input type="submit" value="내 블로그" class="btn btn-outline-secondary btn-sm">
					<c:if test="${userVO.id == param.blogHost}">
						<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='${pageContext.request.contextPath}/blogSetting.do?blogHost=${param.blogHost}'" style="margin-top: 10px; margin-bottom: 10px">블로그 설정</button>
					</c:if>
					<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='${pageContext.request.contextPath}/index.do'">홈으로</button>
					<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='${pageContext.request.contextPath}/login/logout.do'">로그아웃</button>
				</form>
				<c:if test="${userVO.id == param.blogHost}">
					<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='${pageContext.request.contextPath}/writeForm.do?blogHost=${param.blogHost}'" style="margin-top: 10px; margin-bottom: 10px">글쓰기</button>
				</c:if>
				<c:if test="${userVO.id != param.blogHost}">
					<%-- <button type="button" id="firendReq" class="btn btn-outline-secondary btn-sm" onclick="location.href='${pageContext.request.contextPath}/jsp/friend/friendPlus.jsp'" style="margin-top: 10px; margin-bottom: 10px">친구신청</button> --%>
					<button type="button" class="btn btn-outline-secondary btn-sm" onclick="firendRequest()" style="margin-top: 10px; margin-bottom: 10px">친구신청</button>
				</c:if>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<div style="background-color: #6B747C; margin-top: 5px;">
	<div class="btn-group" role="group" aria-label="Button group with nested dropdown" style="background-color: #6B747C;">
	  <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/board/blogViewByCategory.do?blogHost=${param.blogHost}&category=잡담'">잡담</button>
	  <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/board/blogViewByCategory.do?blogHost=${param.blogHost}&category=일상'">일상</button>
	  <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/board/blogViewByCategory.do?blogHost=${param.blogHost}&category=사건'">사건</button>
	  <div class="btn-group" role="group">
	    <button id="btnGroupDrop1" type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	       	카테고리
	    </button>
	    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
	      <c:forEach var="category" items="${categoryList}" varStatus="status">
		      <c:if test="${status.count > 3}">
		      	<a class="dropdown-item" href="${pageContext.request.contextPath}/board/blogViewByCategory.do?blogHost=${param.blogHost}&category=${category}">${category}</a>
		      </c:if>
		  </c:forEach>
	    </div>
	  </div>
	</div>
</div>