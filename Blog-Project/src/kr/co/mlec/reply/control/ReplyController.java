package kr.co.mlec.reply.control;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.mlec.framework.ModelAndView;
import kr.co.mlec.framework.annotation.Controller;
import kr.co.mlec.framework.annotation.RequestMapping;
import kr.co.mlec.reply.service.ReplyService;

@Controller
public class ReplyController extends HttpServlet{
	
	@RequestMapping("reply/write.do")
	public ModelAndView write(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ServletContext sc = request.getServletContext();
		ReplyService service =  (ReplyService) sc.getAttribute("replyService");
		
		
		service.write();
		
		ModelAndView mav = new ModelAndView();
		mav.setView("/jsp/blog/replyWriteProcess.jsp");
		
		return mav;
	}

}
