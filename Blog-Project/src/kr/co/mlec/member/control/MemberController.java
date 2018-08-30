package kr.co.mlec.member.control;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.mlec.framework.ModelAndView;
import kr.co.mlec.framework.annotation.Controller;
import kr.co.mlec.framework.annotation.RequestMapping;
import kr.co.mlec.member.service.MemberService;
import kr.co.mlec.member.vo.MemberVO;

@Controller
public class MemberController {

	@RequestMapping("/member/signUp.do")
	public ModelAndView signUp(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return new ModelAndView("/jsp/sign/signUpForm.jsp");
	}
	
	@RequestMapping("/member/signUpProcess.do")
	public ModelAndView signUpProcess(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String id = request.getParameter("username");
		String pw = request.getParameter("password");
				
		MemberVO member = new MemberVO();
		member.setId(id);
		member.setPw(pw);
		
		ServletContext sc = request.getServletContext();
		MemberService service = (MemberService) sc.getAttribute("memberService");
		
		service.signUp(member);
		
		return new ModelAndView("/jsp/sign/signUp.jsp");
	}
	
	
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
		
		MemberVO loginVO = new MemberVO(id, pw);
		
		ServletContext sc = request.getServletContext();
		MemberService service = (MemberService) sc.getAttribute("memberService");
		
		MemberVO userVO = service.login(loginVO);
		System.out.println(userVO);
		
		ModelAndView mav = new ModelAndView();
		if(userVO==null) {
			mav.setView("redirect:" + request.getContextPath() + "/login/loginFail.do");
		}else {
			mav.setView("redirect:" + request.getContextPath()+ "/index.do");
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
