package kr.co.mlec.framework;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DispatcherServlet
 */
@WebServlet(
		urlPatterns = { "*.do" }, 
		initParams = { 
				@WebInitParam(name = "controllers", 
							  value = "kr.co.mlec.board.control.BoardController" + 
									  "|kr.co.mlec.login.control.LoginController" +
									  "|kr.co.mlec.member.control.MemberController")
		})
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private HandlerMapping mappings;
	
	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		
		String ctrlNames = config.getInitParameter("controllers");
		try {
			mappings = new HandlerMapping(ctrlNames);
		} catch(Exception e) {
			throw new ServletException(e);
		}
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String uri = request.getRequestURI();
		uri = uri.substring(request.getContextPath().length());
//		System.out.println("요청 uri : " + uri);
		
		String view ="";
		try {
			
			CtrlAndMethod cam = mappings.getCtrlAndMethod(uri);
			if(cam == null) {
				throw new Exception("요청하신 URL은 존재하지 않습니다");
			}
			
			Object target = cam.getTarget();
			Method method = cam.getMethod();
			
			ModelAndView mav = (ModelAndView) method.invoke(target, request, response);
			
			// 1. model객체 추출 후 request 공유영역에 등록
			Map<String, Object> model = mav.getModel();
			Set<String> keys = model.keySet();
			
			for(String key : keys) {
				request.setAttribute(key, model.get(key));
			}
			
			view = mav.getView();
			
		} catch (Exception e) {
//			e.printStackTrace();
			request.setAttribute("exception", e);
			view = "/jsp/error/error.jsp";
//			view = "/error";
		}
		
		// 2. 해당 jsp로 이동
		if(view.startsWith("redirect:")) {
			// sendRedirect
			response.sendRedirect(view.substring("redirect:".length()));
		}else {
			// forward
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}
	}

}