<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="https://getbootstrap.com/favicon.ico">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<title>HOME</title>

<link
	href="https://getbootstrap.com/docs/4.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="container">
		<header>
			<div align="center">
				<!-- Image and text -->
				<nav class="navbar navbar-light bg-light">
					<a class="navbar-brand" href="${ pageContext.request.contextPath }/Home.jsp"> <img
						src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFlb-IqSXi_WUIrYpDIKVhieZ54TyExEKhy7vLC5jhFhWb8nUF" width="30"
						height="30" class="d-inline-block align-top" alt="">
						BLOG PROJECT HOME
					</a>
				<div align="right">
					<c:choose>
						<c:when test="${empty userVO}">
							<button type="button" class="btn btn-outline-secondary btn-sm"
								onclick="location.href='${pageContext.request.contextPath}/login/loginForm.do'">로그인</button>
							<button type="button" class="btn btn-outline-secondary btn-sm"
								onclick="location.href='${pageContext.request.contextPath}/member/signUp.do'">회원가입</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-outline-secondary btn-sm"
								onclick="location.href='${pageContext.request.contextPath}/login/logout.do'">로그아웃</button>
						</c:otherwise>
					</c:choose>
				</div>
				</nav>
			</div>
			

		</header><br>
		
		
		<div class="bd-example" style="width:100%; height:30%;" align="center">
			<div id="carouselExampleCaptions" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleCaptions" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
					<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100"
							src="https://www.fmkorea.com/files/attach/images/486263/006/757/060/c779fb92eff581f5e033f926f2e4b2f5.jpg"
							alt="First slide" />
						<div class="carousel-caption d-none d-md-block">
							<h5>First slide label</h5>
							<p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block w-100"
							src="https://www.fmkorea.com/files/attach/images/486263/476/768/060/ba279872661ceaab9bdac851013587a8.jpg"
							alt="Second slide" />
						<div class="carousel-caption d-none d-md-block">
							<h5>Second slide label</h5>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block w-100"
							src="https://www.fmkorea.com/files/attach/images/486263/341/785/060/38e5e2a3b3135a02877ced5d18d63022.jpg"
							alt="Third slide" />
						<div class="carousel-caption d-none d-md-block">
							<h5>Third slide label</h5>
							<p>Praesent commodo cursus magna, vel scelerisque nisl
								consectetur.</p>
						</div>
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleCaptions"
					role="button" data-slide="prev">
					 <span class="carousel-control-prev-icon" aria-hidden="true"></span> 
					 <span class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleCaptions"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div><Br><br><br>
	</div>
</body>
</html>