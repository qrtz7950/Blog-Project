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
	<h2>끼에에에엥에ㅔㅔㅇㅇ</h2>
</body>
</html>