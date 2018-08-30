package kr.co.mlec.reply.control;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.mlec.framework.ModelAndView;
import kr.co.mlec.framework.annotation.Controller;
import kr.co.mlec.framework.annotation.RequestMapping;
import kr.co.mlec.reply.service.ReplyService;
import kr.co.mlec.reply.vo.ReplyVO;

@Controller
public class ReplyController extends HttpServlet {
	
	@RequestMapping("/reply/write.do")
	public ModelAndView write(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ReplyVO reply = new ReplyVO();
		reply.setBoard_no(Integer.parseInt(request.getParameter("board_no")));
		reply.setId(request.getParameter("id"));
		reply.setContent(request.getParameter("content"));
		reply.setDepth(Integer.parseInt(request.getParameter("depth")));
		reply.setSeq(Integer.parseInt(request.getParameter("seq")));
		
		ServletContext sc = request.getServletContext();
		ReplyService service =  (ReplyService) sc.getAttribute("replyService");
		
		
		service.write(reply);
		
		ModelAndView mav = new ModelAndView();
		mav.setView("/blog/detailBoard.do?board_no="+reply.getBoard_no());
		
		return mav;
	}

}
