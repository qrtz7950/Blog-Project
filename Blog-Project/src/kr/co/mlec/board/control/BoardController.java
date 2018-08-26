package kr.co.mlec.board.control;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.mlec.board.service.BoardService;
import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.framework.ModelAndView;
import kr.co.mlec.framework.annotation.Controller;
import kr.co.mlec.framework.annotation.RequestMapping;

@Controller
public class BoardController extends HttpServlet {
	
	@RequestMapping("/writeForm.do")
	public ModelAndView write(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("wirte() 호출...");
		
		ModelAndView mav = new ModelAndView("/jsp/blog/writeForm.jsp");
		
		return mav;
	}
	
	@RequestMapping("/write.do")
	public ModelAndView writeProcess(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("wirteProcess() 호출...");
		
		BoardVO board = new BoardVO();
		
		String id = request.getParameter("id");
		String category_name = request.getParameter("category_name");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String tag = request.getParameter("tag");
		
		board.setId(id);
		board.setCategory_name(category_name);
		board.setTitle(title);
		board.setContent(content);
		board.setTag(tag);
		
		ServletContext sc = request.getServletContext();
		BoardService service = (BoardService) sc.getAttribute("boardService");
		service.write(board);
		
		ModelAndView mav = new ModelAndView();
		mav.setView(request.getContextPath());
		
		return mav;
	}
}
