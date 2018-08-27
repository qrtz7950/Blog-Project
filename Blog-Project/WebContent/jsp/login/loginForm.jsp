<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script>
	function checkForm() {
		
		var form = document.lform;
		if(isNull(form.id, '아이디를 입력해주세요')) {
			return false;
		}
		
		if(isNull(form.pw, '패스워드를 입력해주세요')) {
			return false;
		}
		
		return true;
	}
	
	function isNull(obj, msg) {
		if(obj.value == '') {
			alert(msg);
			obj.focus();
			return true;
		}
		return false;
	}
	
</script>

</head>
<body style="width:80%; margin: 0 auto;">
	<section>
		<div align="center">
			<br>
			<hr>
			<h2>Blog</h2>
			<hr>
			<br>
			<form action="${pageContext.request.contextPath}/login/loginProcess.do" onsubmit="return checkForm()" name="lform"  style="width: 50%;" method="post">
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="basic-addon1">아이디</span>
				  </div>
				  <input type="text" class="form-control" placeholder="ID" type="text" name="id" size="20" autofocus="autofocus">
				</div>
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="basic-addon1">비밀번호</span>
				  </div>
				  <input type="text" class="form-control" placeholder="Password" type="text" name="pw" size="20">
				</div>
				<input type="submit" class="btn btn-outline-secondary" value="로그인"></input>
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}'">메인으로</button>
			</form>
		</div>
	</section>
</body>
</html>