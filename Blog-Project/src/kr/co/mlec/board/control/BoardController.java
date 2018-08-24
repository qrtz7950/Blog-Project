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
		
		BoardVO board = new BoardVO();
		
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String category_name = request.getParameter("category");

		board.setId(id);
		board.setTitle(title);
		board.setContent(content);
		board.setCategory_name(category_name);
		
		ServletContext sc = request.getServletContext();
		BoardService service = (BoardService) sc.getAttribute("boardService");
		service.write(board);
		
		ModelAndView mav = new ModelAndView();
		mav.setView("/list.do");
		
		return mav;
	}
}
