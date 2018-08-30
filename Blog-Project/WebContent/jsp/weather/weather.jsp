<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>전국주간날씨</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script type="text/javascript" src="jquery.ajax-cross-origin.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
        <script type="text/javascript">
        $(document).ready(function(){
        	 $.ajax({
                 crossOrigin: true,    // 크로스도메인 해결 플러그인
                 url: 'http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=1165051000',
                 dataType: 'xml',
                 success: function(response){
                     console.log(response);
                     
                     var city = $(response).find('category').text();
                     $('#weather').append(city + '<br>');
                     
                     $(response).find('data').each(function(){
                         var day = $(this).find('day').text();
                         var dayTxt = "오늘";
                         $('#weather').append('<br>');
                         var hour = $(this).find('hour').text();
                         var wfKor = $(this).find('wfKor').text();
                         var temp = $(this).find('temp').text();
                         if(day == 1) { var dayTxt = "내일"; }
                         if(day == 2) { var dayTxt = "모레"; }
                         var output = dayTxt + " " + hour + "시 " + wfKor + " " + temp;
                         $('#weather').append(output + '<br>');
                     })
                 }
             })
         })
        function callback(data){
        	 $.ajax({
                 crossOrigin: true,    // 크로스도메인 해결 플러그인
                 url: 'http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=1165051000',
                 dataType: 'xml',
                 success: function(response){
                     console.log(response);
                     
                    	 $('#weather').empty();
                     var city = $(response).find('category').text();
                     $('#weather').append(city + '<br>');
                     
                     $(response).find('data').each(function(){
                         var day = $(this).find('day').text();
                         var dayTxt = "오늘";
                         $('#weather').append('<br>');
                         var hour = $(this).find('hour').text();
                         var wfKor = $(this).find('wfKor').text();
                         var temp = $(this).find('temp').text();
                         if(day == 1) { var dayTxt = "내일"; }
                         if(day == 2) { var dayTxt = "모레"; }
                         var output = dayTxt + " " + hour + "시 " + wfKor + " " + temp;
                         $('#weather').append(output + '<br>');
                         
                     })
                 }
             })
         
        };
        
        	
       
             /* $("#f5").click(function(){
	        	 $("#weather").empty(); 
			    $("#weather").load("weather.jsp");
			}); */
       
        </script>
    </head>
    <body>
    	<!-- <input type="button" value="새로고침" id="f5" onclick="callback()" > -->
    </body>
</html>