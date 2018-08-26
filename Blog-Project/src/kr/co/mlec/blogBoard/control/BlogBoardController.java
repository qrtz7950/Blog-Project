package kr.co.mlec.blogBoard.control;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.mlec.blogBoard.service.BlogBoardService;
import kr.co.mlec.blogBoard.vo.BlogBoardVO;
import kr.co.mlec.framework.ModelAndView;
import kr.co.mlec.framework.annotation.Controller;
import kr.co.mlec.framework.annotation.RequestMapping;

@Controller
public class BlogBoardController {
	
	@RequestMapping(value="/blog/detailBlogBoard.do")
	public ModelAndView viewDetailBoard(HttpServletRequest request, HttpServletResponse response)
				throws Exception{
		
		ServletContext sc = request.getServletContext();
		
		BlogBoardService service = (BlogBoardService) sc.getAttribute("blogBoardService");
		// @@@@@@@@@@@오류일지도 모름
		BlogBoardVO detailBlogBoard = service.selectDetailBlogBoard(Integer.parseInt(request.getParameter("no")));
		
		ModelAndView mav = new ModelAndView();
		mav.setView("/jsp/blog/detailBlogBoard.jsp");
		mav.addAttribute("detailBlogBoard", detailBlogBoard);
		
		return mav;
	}
	
}
