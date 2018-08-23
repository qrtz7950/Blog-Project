package kr.co.mlec.error;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/error")
public class ErrorServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<HTML>");
		out.println("<HEAD>");
		out.println("<TITLE>오류처리 페이지</TITLE>");
		out.println("</HEAD>");
		out.println("<BODY>");
		out.println("<h2>오류내용</h2>");
		Exception e = (Exception)request.getAttribute("exception");
		out.println("message : "+ e.getMessage() + "<br>");
		e.printStackTrace(out);
		out.println("</BODY>");
		out.println("</HTML>");
	}
	
}
