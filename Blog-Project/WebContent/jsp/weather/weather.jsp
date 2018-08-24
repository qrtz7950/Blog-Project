<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>전국주간날씨</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script type="text/javascript" src="jquery.ajax-cross-origin.min.js"></script><!-- 크로스도메인 해결 플러그인 -->
        <script type="text/javascript">
        $(document).ready(function(){    
            $.ajax({
                crossOrigin: true,    // 크로스도메인 해결 플러그인
                url: 'http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=108',
                dataType: 'xml',
                success: function(response){
                    console.log(response);
                    $(response).find('location').each(function(){
                        var city = $(this).find('city').text();
                        if(city == '서울'){
                            $('aside').append(city + '<br>');
                            $(this).find('data').each(function(){
                                var output = $(this).find('tmEf').text() + " " + $(this).find('wf').text();
                                $('aside').append(output + '<br>');
                            })
                        }
                    })
                }
            })
        })
        </script>
    </head>
    <body>
    </body>
</html>
