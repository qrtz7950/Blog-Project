<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	var friendId = prompt("친구신청을 하고싶은 대상의 ID를 입력하세요" ,"");
	var bool = confirm(friendId + " 님에게 친구 신청을 보냅니다");
	if(bool){
		alert(friendId + " 님에게 친구 신청을 보냈습니다.");
		location.href = "${pageContext.request.contextPath}";
	} else{
		alert("친구신청을 취소하였습니다.");
		location.href = "${pageContext.request.contextPath}";
	}
	
</script>
</head>
<body>
	
</body>
</html>