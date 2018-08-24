<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>새 글 작성</title>
<style type="text/css">
	table {
		text-align: center;
	}
	
	input {
		
		border: none;
	}
	
</style>
<script type="text/javascript">

	function doWrite() {
		
		var w = document.wForm;
		
		if(isNull(w.title, '제목을 입력하세요')){
			return false;
		}
		if(isNull(w.content, '내용을 입력하세요')){
			return false;
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
	
	function checkExt(obj) {
		
		var forbid = ['exe', 'java', 'jsp', 'js', 'class'];
		var fileName = obj.value;
		var ext = fileName.substring(fileName.lastIndexOf('.')+1)
		
		for(var i = 0; i<forbid.length; i++) {
			if(forbid[i] === ext){
				alert(ext + "파일은 업로드 정책에 위배됩니다")
				return true;
			}
		}
		
		return false;
	}
</script>
</head>
<body>
	<div class="container">
		<jsp:include page="/jsp/include/topMenu.jsp" />
		<div>
			<br>
			<div class="container">
				<div>
					<div class="input-group" style="width: 30%; float: left;">
						<select class="custom-select" id="inputGroupSelect04"aria-label="Example select with button addon">
							<option selected>카테고리</option>
							<option value="1">카테</option>
							<option value="2">고리</option>
							<option value="3">흐헿</option>
						</select>
					</div>
					<div class="input-group mb-3"style="border: none; width: 68%; float: right;">
						<input type="text" class="form-control"
							aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-default" placeholder="제목">
					</div>
				</div>
				<div class="input-group">
					<textarea class="form-control" aria-label="With textarea"style="min-height: 350px;" placeholder="내용을 입력하세요"></textarea>
				</div>
			</div>
			<div class="container" style="margin-top: 10px; width: 50%;">
				<div class="input-group">
					<div class="custom-file">
						<input type="file" class="custom-file-input" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04"> <label
							class="custom-file-label" for="inputGroupFile04">Choosefile</label>
					</div>
				</div>
				<div class="input-group mb-3" style="margin-top: 10px;">
				  <div class="input-group-prepend">
				    <div class="input-group-text">
				      <input type="checkbox" aria-label="Checkbox for following text input">
				    </div>
				  </div>
				  <input type="text" class="form-control" aria-label="Text input with checkbox" disabled value="댓글 허용" style="text-align: center;">
				  <select class="custom-select" id="inputGroupSelect01">
				    <option selected>친구만</option>
				    <option value="1">모두</option>
				  </select>
				<div class="input-group" style="margin-top: 10px;">
					<div class="input-group-prepend">
					  <span class="input-group-text">Tag</span>
					</div>
					<input type="text" aria-label="Tag content" class="form-control" placeholder="EX) #집에#가고#싶다" >
				</div>
				</div>
			</div>
			<div align="center">
				<button type="button" class="btn btn-secondary btn-lg">게시하기</button>
				<button type="button" class="btn btn-dark btn-lg">돌아가기</button>
			</div>
		</div>
	</div>
</body>
</html>