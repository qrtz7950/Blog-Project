<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.sel{
		display: inline-block;
	}
	.friendReq{
		display: inline-block;
		font-size: 15pt;
	}	
	.friendSel{
		font-size: 15pt;
		margin: 5px;
	}	
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<jsp:include page="/jsp/include/topMenu.jsp" />
		<main role="main">
		<div align="center" style="margin: 15px;">
          <h1 class="jumbotron-heading">블로그 환경설정</h1>
		</div>
		
	      <section class="jumbotron text-center">
	          <h4>친구 신청 현황</h4><br>
	          <c:choose>
	          	<c:when test="${ empty friList }">
	          		<div class="friendSel">
	          			새로운 친구 신청이 없습니다
	          		</div>
	          	</c:when>
	          	<c:otherwise>
	          		<div class="container" style="background: lightgray; width:50%;">
			            <c:forEach var="fri" items="${friList}">
			            <div>
				            <div class="friendSel">
								<div class="friendReq"><b>${fri.req_id}</b>님이</div>
								<div class="friendReq">나에게 친구 신청하였습니다</div>
							</div>
								<div>
									<button type="button" id="Y${fri.req_no}" class="btn btn-success">수락</button>
									<button type="button" id="N${fri.req_no}" class="btn btn-danger">거절</button>
								</div>
						</div>
						</c:forEach>
					</div>			
	          	</c:otherwise>
	          </c:choose>
	      </section>
	
			<section class="jumbotron text-center">
				<h4>블로그 테마 선택</h4>
				<br><br>
	          <div class="row">
		            <div class="col-md-4">
		              <div class="card mb-4 shadow-sm">
		                <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail" alt="Thumbnail [100%x225]" style="height: 225px; width: 100%; display: block;" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22288%22%20height%3D%22225%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20288%20225%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_1656b46a0e6%20text%20%7B%20fill%3A%23eceeef%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A14pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_1656b46a0e6%22%3E%3Crect%20width%3D%22288%22%20height%3D%22225%22%20fill%3D%22%2355595c%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2296.8359375%22%20y%3D%22118.8%22%3EThumbnail%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true">
		                <div class="card-body" align="center">
							<input type="radio">
		                </div>
		              </div>
		            </div>
		            <div class="col-md-4">
		              <div class="card mb-4 shadow-sm">
		                <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail" alt="Thumbnail [100%x225]" style="height: 225px; width: 100%; display: block;" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22288%22%20height%3D%22225%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20288%20225%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_1656b46a0e6%20text%20%7B%20fill%3A%23eceeef%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A14pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_1656b46a0e6%22%3E%3Crect%20width%3D%22288%22%20height%3D%22225%22%20fill%3D%22%2355595c%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2296.8359375%22%20y%3D%22118.8%22%3EThumbnail%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true">
		                <div class="card-body" align="center">
							<input type="radio">
		                </div>
		              </div>
		            </div>
		            <div class="col-md-4">
		              <div class="card mb-4 shadow-sm">
		                <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail" alt="Thumbnail [100%x225]" style="height: 225px; width: 100%; display: block;" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22288%22%20height%3D%22225%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20288%20225%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_1656b46a0e6%20text%20%7B%20fill%3A%23eceeef%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A14pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_1656b46a0e6%22%3E%3Crect%20width%3D%22288%22%20height%3D%22225%22%20fill%3D%22%2355595c%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2296.8359375%22%20y%3D%22118.8%22%3EThumbnail%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true">
		                <div class="card-body" align="center">
							<input type="radio">
		                </div>
		              </div>
		            </div>
	            </div>
	            
	            <div align="center">
		            <button type="button" class="btn btn-secondary btn-lg">선택</button>
	            </div>
            </section>
	    </main>
      </div>
</body>
</html>
