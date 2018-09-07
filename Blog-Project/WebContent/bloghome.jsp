<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
  <head>
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
          <p class="lead mb-0"><a href="#" class="text-white font-weight-bold">Continue reading...</a></p>
      </div>

      <div class="row mb-2">
        <div class="col-md-6">
          <div class="card flex-md-row mb-4 shadow-sm h-md-250">
            <div class="card-body d-flex flex-column align-items-start">
              <strong class="d-inline-block mb-2 text-primary">인기 게시글</strong>
              <h3 class="mb-0">
                <a class="text-dark" href="#">${ popularBoard.title }</a>
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
              <strong class="d-inline-block mb-2 text-success">최근 댓글이 달린 게시글</strong>
              <h3 class="mb-0">
                <a class="text-dark" href="#">최근 댓글이 달린 게시글 제목</a>
              </h3>
              <div class="mb-1 text-muted">Nov 11</div>
              <p class="card-text mb-auto">최근 댓글이 달린 게시글 내용</a>
              <div class="card" style="width: 18rem;">
							<img class="card-img-top" src="data:image/jpeg;base64,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"
								alt="Card image cap">
							<div class="card-body">
								<p class="card-text"></p>
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
        <table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>등록일</th>
		</tr>
		<h2>전체 게시글 목록</h2>
			<c:forEach items="${ recentBoard }" var="board">
				<tr>
					<td>${board.board_no }</td>
					<td>${board.title }</td>
					<td>${board.id }</td>
					<td>${board.reg_date }</td>
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