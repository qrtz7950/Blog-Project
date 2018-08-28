package kr.co.mlec.login.control;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.mlec.framework.ModelAndView;
import kr.co.mlec.framework.annotation.Controller;
import kr.co.mlec.framework.annotation.RequestMapping;
import kr.co.mlec.login.service.LoginService;
import kr.co.mlec.login.vo.LoginVO;

@Controller
public class LoginController {
	
	@RequestMapping("/login/loginForm.do")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response)
				throws Exception {
		
		System.out.println("로그인 메소드 호출...");
		
		ModelAndView mav = new ModelAndView("/jsp/login/loginForm.jsp");
		
		
		return mav;
	}
	
	@RequestMapping("/login/loginProcess.do")
	public ModelAndView loginProcess(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		LoginVO loginVO = new LoginVO(id, pw);
		
		ServletContext sc = request.getServletContext();
		LoginService service = (LoginService) sc.getAttribute("loginService");
		
		LoginVO userVO = service.login(loginVO); //범인
		System.out.println(userVO);
		
		ModelAndView mav = new ModelAndView();
		if(userVO==null) {
			mav.setView("redirect:" + request.getContextPath() + "/login/loginFail.do");
		}else {
			mav.setView("redirect:" + request.getContextPath());
			HttpSession session = request.getSession();
			session.setAttribute("userVO", userVO);
		}
		
		return mav;
	}
	
	@RequestMapping("/login/loginFail.do")
	public ModelAndView loginFail(HttpServletRequest request, HttpServletResponse resonse) throws Exception {
		return new ModelAndView("/jsp/login/loginFail.jsp");
	}
	
	@RequestMapping("/login/logout.do")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse resonse) throws Exception {
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		return new ModelAndView("redirect:" + request.getContextPath());
	}
	
}
