<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
  <head>
	<style type="text/css">
		table.type11 {
		 border-collapse: separate;
		 border-spacing: 1px;
		 text-align: center;
		 line-height: 1.5;
		 margin: 20px 10px;
		}
		table.type11 th {
		    padding: 10px;
		    font-weight: bold;
		    vertical-align: top;
		    color: #fff;
		    background-color: #6B747C;
		}
		table.type11 td {
		    padding: 10px;
		    vertical-align: top;
		    border-bottom: 1px solid #ccc;
		}
		table.type11 tr {
			background: #eee;
		}
		table.type11 tr:hover{
			background-color: lightyellow;
		}
   </style>
  
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <meta charset="UTF-8">
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    
    
<!--     <meta name="description" content="">
    <meta name="author" content=""> -->
	<link rel="icon" href="https://getbootstrap.com/favicon.ico">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <title>${param.blogHost}의 블로그</title>
    
 <link href="https://getbootstrap.com/docs/4.1/dist/css/bootstrap.min.css" rel="stylesheet">

	<!-- 글꼴 -->
	
	<style>
		/* *{
			font-family: 'Nanum Gothic';
			font-family: 'Hanna';
			font-family: 'Notosanskr';
		} */
	</style>

    <!-- Bootstrap core CSS -->
    <link href="https://getbootstrap.com/docs/4.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900" rel="stylesheet">
   <!--  <link href="blog.css" rel="stylesheet"> -->
  </head>

  <body>
    <div class="container">
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	
	<br>
      <div class="jumbotron p-3 p-md-5 text-white rounded bg-dark">
          <h1 class="display-4 font-italic">${ presentBoard.title }</h1>
          <p class="lead my-3">${ presentBoard.content }</p>
          <p class="lead mb-0"><a href="${pageContext.request.contextPath}/blog/detailBoard.do?blogHost=${presentBoard.id}&board_no=${presentBoard.board_no}" class="text-white font-weight-bold">Continue reading...</a></p>
      </div>

      <div class="row mb-2">
        <div class="col-md-6">
          <div class="card flex-md-row mb-4 shadow-sm h-md-250">
            <div class="card-body d-flex flex-column align-items-start">
              <strong class="d-inline-block mb-2 text-primary">인기 게시글</strong>
              <h3 class="mb-0">
                <a class="text-dark" href="${pageContext.request.contextPath}/blog/detailBoard.do?blogHost=${popularBoard.id}&board_no=${popularBoard.board_no}">${ popularBoard.title }</a>
              </h3>
						<div class="mb-1 text-muted">${ popularBoard.reg_date }</div>
              <p class="card-text mb-auto"></a>
						<div class="card" style="width: 18rem;">
							<img class="card-img-top" src="https://t1.daumcdn.net/cfile/tistory/2726D84C5478A7572D"
								alt="Card image cap">
							<div class="card-body">
								<p class="card-text">${ popularBoard.content }</p>
							</div>
						</div>
            </div>
            <!-- <img class="card-img-right flex-auto d-none d-lg-block" data-src="holder.js/200x250?theme=thumb" alt="Card image cap"> -->
          </div>
        </div>
        
        <div class="col-md-6">
          <div class="card flex-md-row mb-4 shadow-sm h-md-250">
            <div class="card-body d-flex flex-column align-items-start">
              <strong class="d-inline-block mb-2 text-success">최근 댓글...</strong>
              <div class="card" style="width: 18rem;">
							<div class="card-body">
								<c:forEach items="${ recentReplyList }" var="reply">
									<a href="${pageContext.request.contextPath}/blog/detailBoard.do?blogHost=${param.blogHost}&board_no=${reply.board_no}"><p class="card-text">${ reply.content }&nbsp;${ reply.reg_date }</p></a>
								</c:forEach>
							</div>
						</div>
            </div>
            <!-- <img class="card-img-right flex-auto d-none d-lg-block" data-src="holder.js/200x250?theme=thumb" alt="Card image cap"> -->
          </div>
        </div>
      </div>
     
		
    </div>
   
    <main role="main" class="container">
      <div class="row">
        <div class="col-md-8 blog-main">
			<table class="type11" width="70%">
			    <tr>
			        <th width="60%">제목</th>
			        <th width="15%">등록일</th>
			        <th width="15%">조회수</th>
			    </tr>
			    <c:forEach var="board" items="${recentBoard}">
				    <tr>
				        <td onclick="location.href='${pageContext.request.contextPath}/blog/detailBoard.do?blogHost=${param.blogHost}&board_no=${board.board_no}'">${board.title}</th>
				        <td>${board.reg_date}</th>
				        <td>${board.view_cnt}</th>
				    </tr>
				 </c:forEach>
			</table>
          <%-- <h3 class="pb-3 mb-4 font-italic border-bottom">
            From the Firehose
          </h3>

          <div class="blog-post">
				
            <h2 class="blog-post-title">게시판</h2>
            <p class="blog-post-meta">January 1, 2014 by <a href="#">Mark</a></p>

            <p>게시판 들어올 자리 This blog post shows a few different types of content that's supported and styled with Bootstrap. Basic typography, images, and code are all supported.</p>
            <hr>
            <p>Cum sociis natoque penatibus et magnis <a href="#">dis parturient montes</a>, nascetur ridiculus mus. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Sed posuere consectetur est at lobortis. Cras mattis consectetur purus sit amet fermentum.</p>
            <blockquote>
              <p>Curabitur blandit tempus porttitor. <strong>Nullam quis risus eget urna mollis</strong> ornare vel eu leo. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
            </blockquote>
            <p>Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur.</p>
            
            <h2>Heading</h2>
            <p>Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>
            <h3>Sub-heading</h3>
            <p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>
            <pre><code>Example code block</code></pre>
            <p>Aenean lacinia bibendum nulla sed consectetur. Etiam porta sem malesuada magna mollis euismod. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa.</p>
            
            <h3>Sub-heading</h3>
            <p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean lacinia bibendum nulla sed consectetur. Etiam porta sem malesuada magna mollis euismod. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
            <ul>
              <li>Praesent commodo cursus magna, vel scelerisque nisl consectetur et.</li>
              <li>Donec id elit non mi porta gravida at eget metus.</li>
              <li>Nulla vitae elit libero, a pharetra augue.</li>
            </ul>
            <p>Donec ullamcorper nulla non metus auctor fringilla. Nulla vitae elit libero, a pharetra augue.</p>
            <ol>
              <li>Vestibulum id ligula porta felis euismod semper.</li>
              <li>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</li>
              <li>Maecenas sed diam eget risus varius blandit sit amet non magna.</li>
            </ol>
            <p>Cras mattis consectetur purus sit amet fermentum. Sed posuere consectetur est at lobortis.</p>
          </div><!-- /.blog-post -->

          <div class="blog-post">
            <h2 class="blog-post-title">Another blog post</h2>
            <p class="blog-post-meta">December 23, 2013 by <a href="#">Jacob</a></p>

            <p>Cum sociis natoque penatibus et magnis <a href="#">dis parturient montes</a>, nascetur ridiculus mus. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Sed posuere consectetur est at lobortis. Cras mattis consectetur purus sit amet fermentum.</p>
            <blockquote>
              <p>Curabitur blandit tempus porttitor. <strong>Nullam quis risus eget urna mollis</strong> ornare vel eu leo. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
            </blockquote>
            <p>Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur.</p>
            <p>Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>
          </div><!-- /.blog-post -->

          <div class="blog-post">
            <h2 class="blog-post-title">New feature</h2>
            <p class="blog-post-meta">December 14, 2013 by <a href="#">Chris</a></p>

            <p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean lacinia bibendum nulla sed consectetur. Etiam porta sem malesuada magna mollis euismod. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
            <ul>
              <li>Praesent commodo cursus magna, vel scelerisque nisl consectetur et.</li>
              <li>Donec id elit non mi porta gravida at eget metus.</li>
              <li>Nulla vitae elit libero, a pharetra augue.</li>
            </ul>
            <p>Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur.</p>
            <p>Donec ullamcorper nulla non metus auctor fringilla. Nulla vitae elit libero, a pharetra augue.</p>
          </div><!-- /.blog-post -->

          <nav class="blog-pagination">
            <a class="btn btn-outline-primary" href="#">Older</a>
            <a class="btn btn-outline-secondary disabled" href="#">Newer</a>
          </nav> --%>

        </div><!-- /.blog-main -->

        <jsp:include page="/jsp/include/aside.jsp"/>
		<!-- /.blog-sidebar -->

      </div><!-- /.row -->

    </main><!-- /.container -->
	
	
    <footer class="blog-footer" align="center">
      <p>Blog template built for <a href="https://getbootstrap.com/">Bootstrap</a> by <a href="https://twitter.com/mdo">@mdo</a>.</p>
      <p>
        <a href="#">Back to top</a>
      </p>
    </footer>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
     <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script> 
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>    
	    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>                                                                                        
	    <script src="https://getbootstrap.com/docs/4.1/assets/js/vendor/popper.min.js"></script>                                                                                                                      
	   <!--  <script src="/Blog-Project/js/bootstrap.min.js"></script>                                                                                                                                                     
	    <script src="/Blog-Project/js/bootstrap.js"></script>                                                                                                                                                         
	    <script src="/Blog-Project/js/npm.js"></script>       -->                                                                                                                                                         
		<!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> -->                                                                                                                                  
		<script src="https://getbootstrap.com/docs/4.1/dist/js/bootstrap.min.js"></script>                                                                                                                            
		<script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js"></script>
		<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
        <!-- <script type="text/javascript" src="jquery.ajax-cross-origin.min.js"></script>크로스도메인 해결 플러그인    -->                                                                                                                    
		

   <!--  <script>window.jQuery || document.write('<script src="https://getbootstrap.com/docs/4.1/assets/js/vendor/holder.min.js"/></script> -->
    <script>
      /* Holder.addTheme('thumb', {
        bg: '#55595c',
        fg: '#eceeef',
        text: 'Thumbnail'
      }); */
    WebFont.load({
        google: {
          families: ['Droid Sans', 'Droid Serif']
        }
      });
      
    </script>
    
    
  </body>
</html>