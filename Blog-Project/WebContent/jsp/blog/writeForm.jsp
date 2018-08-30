<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>새 글 작성</title>
<style type="text/css">
</style>
<script src="/Blog-Project/js/myCheck.js"></script>
<script type="text/javascript">

	function doWrite() {
		
	var w = document.forms[0];
	
		if(isNull(w.title, '제목을 입력하세요')){
			return false;
		}
		if(isNull(w.content, '내용을 입력하세요')){
			return false;
		}
		if(isNull(w.category_name, '카테고리을 입력하세요')){
			return false;
		}
 		if(document.getElementById('reply_allow').value == "on"){
			if(isNull(w.reply_access, '유형을 선택하세요')){
				return false;
			}
		}
		
		//파일 확장자 체크
		if(checkExt(w.attachfile1)){
			alert('!');
			return false;
		}
		if(checkExt(w.attachfile2)){
			alert('?');			
			return false;
		}
		
		return true;
	}
</script>
</head>
<body>
	<div class="container">
		<jsp:include page="/jsp/include/topMenu.jsp" />
		<div>
			<br>
			<form action="${ pageContext.request.contextPath }/write.do" id="wForm" method="post" onsubmit="return doWrite()">
				<input type="hidden" name="id" value="${sessionScope.userVO.id}">
				<div class="container">
					<div>
						<div class="input-group" style="width: 30%; float: left;">
							<select class="custom-select"name="category_name" id="category_name">
								<option selected value="">카테고리</option>
								<c:forEach items="${categoryList}" var="cat">
									<option value="${cat}">${cat}</option>
								</c:forEach>
							</select>
						</div>
						<div class="input-group mb-3"style="border: none; width: 68%; float: right;">
							<input type="text" class="form-control" placeholder="제목" name="title" id="title">
						</div>
					</div>
					<div class="input-group">
						<textarea name="content" class="form-control" id="content" style="min-height: 350px;" placeholder="내용을 입력하세요"></textarea>
					</div>
				</div>
				<div class="container" style="margin-top: 10px; width: 50%;">
					<div class="input-group">
						<div class="custom-file">
							<input type="file" class="custom-file-input"> <label
								class="custom-file-label" for="inputGroupFile04">Choosefile</label>
						</div>
					</div>
					<div class="input-group mb-3" style="margin-top: 10px;">
					  <div class="input-group-prepend">
					    <div class="input-group-text">
					      <input type="checkbox" id="reply_allow">
					    </div>
					  </div>
					  <input type="text" class="form-control" disabled value="댓글 허용" style="text-align: center;">
					  <select class="custom-select" id="reply_access" name="reply_access" id="reply_access">
					    <option selected value="">허용할 범위</option>
					    <option value="everyone">모두</option>
					    <option value="friend">친구만</option>
					  </select>
					<div class="input-group" style="margin-top: 10px;">
						<div class="input-group-prepend">
						  <span class="input-group-text">Tag</span>
						</div>
						<input type="text" class="form-control" placeholder="EX) #집에#가고#싶다" name="tag">
					</div>
					</div>
				</div>
				<div align="center">
					<button type="submit" class="btn btn-secondary btn-lg">게시하기</button>
					<button type="button" class="btn btn-dark btn-lg">돌아가기</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>