package kr.co.mlec.blog.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.mlec.framework.ModelAndView;
import kr.co.mlec.framework.annotation.Controller;
import kr.co.mlec.framework.annotation.RequestMapping;
import kr.co.mlec.member.vo.MemberVO;

@Controller
public class BlogController {

//	@RequestMapping("/myBlog.do")
	public ModelAndView myBlog(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("myBlog() 호출...");
		
		HttpSession session = request.getSession();
		MemberVO me =  (MemberVO) session.getAttribute("userVO");
		
		System.out.println(me);
		
		return new ModelAndView("");
	}
	
}
