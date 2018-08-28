<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오류처리</title>
</head>
<body>
	<h2>오류 내용</h2>
	message : ${requestScope.exception.message}<br>
</body>
</html>