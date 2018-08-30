<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<aside class="col-md-4 blog-sidebar">
			<div class="p-3 mb-3 bg-light rounded">
				<h4 class="font-italic">방문자수</h4>
				<p class="mb-0">
					Today 2000
					Total 1000000
				</p>
			</div>

			<div class="p-3">
				<h4 class="font-italic">게시물 업로드 날짜</h4>
				<ol class="list-unstyled mb-0">
					<li><a href="#">March 2014</a></li>
					<li><a href="#">February 2014</a></li>
					<li><a href="#">January 2014</a></li>
					<li><a href="#">December 2013</a></li>
					<li><a href="#">November 2013</a></li>
					<li><a href="#">October 2013</a></li>
					<li><a href="#">September 2013</a></li>
					<li><a href="#">August 2013</a></li>
					<li><a href="#">July 2013</a></li>
					<li><a href="#">June 2013</a></li>
					<li><a href="#">May 2013</a></li>
					<li><a href="#">April 2013</a></li>
				</ol>
			</div>
			
        
			
			<div class="p-3">
				<h4 class="font-italic">Elsewhere</h4>
				<ol class="list-unstyled">
					<li><a href="https://github.com/qrtz7950/MVC-Model-2-Blog-Project">GitHub</a></li>
					<li><a href="#">Twitter</a></li>
					<li><a href="#">Facebook</a></li>
				</ol>
			</div>
		
			
			
			
			<h2 class="font-italic">
				서초1동 날씨
				<p>(3시간)</p>
			</h2>
			<input type="button" value="새로고침" id="f5" onclick="callback()" >
			<div id="weather">
				<jsp:include page="/jsp/weather/weather.jsp"/>	
			</div>
			
				
			
			
		</aside>