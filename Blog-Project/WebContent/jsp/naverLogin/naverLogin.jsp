<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%
    String clientId = "2kGWBEBOAzXlf2bEx1eA";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8000/Blog-Project/jsp/naverLogin/callback.jsp", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %>
<a href="<%=apiURL%>">
	<div style="background-color:#1EC800" align="center">
		<img height="50" src="https://github.com/qrtz7950/Blog-Project/blob/master/naver.png?raw=true"/>
	</div>
</a>