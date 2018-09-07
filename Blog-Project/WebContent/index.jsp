<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 1000px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
  </style>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="d-inline-block align" href="#"><img style="margin-top: 10px; margin-right: 10px;" width="35px" height="35px" src="${ pageContext.request.contextPath }/img/a.png"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="${pageContext.request.contextPath}/index.do">Home</a></li>
        <c:if test="${ not empty userVO }">
        	<li><a href="${pageContext.request.contextPath}/blogHome.do?blogHost=${userVO.id}">MyBlog</a></li>
        </c:if>
      </ul>
      <form action="${pageContext.request.contextPath}/login/loginForm.do" method="post">
	      <ul class="nav navbar-nav navbar-right">
	      	<c:choose >
	      		<c:when test="${empty userVO}">
			        <li>
			        <li><a href="${pageContext.request.contextPath}/login/loginForm.do?select=Register"> Register</a></li>
			        <li><a href="${pageContext.request.contextPath}/login/loginForm.do?select=Login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
	      		</c:when>
	      		<c:otherwise>
			        <li><a href="${pageContext.request.contextPath}/login/logout.do"><span class="glyphicon glyphicon-log-in"></span> LogOut</a></li>
	      		</c:otherwise>
	      	</c:choose>
	      </ul>
      </form>
    </div>
  </div>
</nav>
  
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
		<c:if test="${ not empty userVO }">    
	      <h6>친구 추천</h6>
	      	<div align="left" style="padding: 40px;">
		      <c:forEach items="${ friend }" var="fri">
		    	<p><a href="${pageContext.request.contextPath}/blogHome.do?blogHost=${fri.id}"><img width="30px" height="30px" src="${ pageContext.request.contextPath }/img/b.jpg">&nbsp;${ fri.id }</a></p>
		      </c:forEach>
		    </div>
	    </c:if>
	    <c:if test="${ empty userVO }">
	    	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	    	<p>지금 가입하여 친구들을 만들어 보세요!</p>
	    </c:if>
      
    </div>
    <div class="col-sm-8 text-left"> 
      <h1>인기 게시글</h1>
      <p>새로운 친구를 찾고 블로그를 방문해 보세요!</p>
      <hr><br><br>
      <c:forEach items="${ mainPopular }" var="pop">
      
    	<div style="display: inline-block; width: 30%;">
    	   <div>
              <div>
                <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail" alt="Thumbnail [100%x225]" style="height: 225px; width: 100%; display: block;" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22288%22%20height%3D%22225%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20288%20225%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_1656b46a0e6%20text%20%7B%20fill%3A%23eceeef%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A14pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_1656b46a0e6%22%3E%3Crect%20width%3D%22288%22%20height%3D%22225%22%20fill%3D%22%2355595c%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2296.8359375%22%20y%3D%22118.8%22%3EThumbnail%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true">
              </div>
            </div>
    	</div>
    	<div style="display: inline-block; width: 65%; float: right;">
    	  <div style="height: 30%;">
    	  	<h4><a href="${pageContext.request.contextPath}/blog/detailBoard.do?blogHost=${pop.id}&board_no=${pop.board_no}">${ pop.title }</a></h4>
    	  </div>
    	  <div style="height: 60%;">
    	    ${ pop.content }
    	  </div>
    	</div>
	      <hr>
	      
		</c:forEach>
    </div>
    
    <div class="col-sm-2 sidenav">
      <h4>최근에 등록된 게시물</h4>
      	<c:forEach items="${ mainRecent }" var="pre">
	      
	      <div class="well" align="left">
	        <h4><a href="${pageContext.request.contextPath}/blog/detailBoard.do?blogHost=${pre.id}&board_no=${pre.board_no}">${ pre.title }</a></h4>
	        <h6>${ pre.content }</h6>
	      </div>
	      
	    </c:forEach>
    </div>
  </div>
</div>

<footer class="container-fluid text-center">
  <p></p>
</footer>

</body>
</html>
