package kr.co.mlec.blog.control;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.mlec.board.service.BoardService;
import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.framework.ModelAndView;
import kr.co.mlec.framework.annotation.Controller;
import kr.co.mlec.framework.annotation.RequestMapping;
import kr.co.mlec.member.service.MemberService;
import kr.co.mlec.member.vo.MemberVO;

@Controller
public class BlogController {

	@RequestMapping("/index.do")
	public ModelAndView myBlog(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<MemberVO> friend = null;
		
		System.out.println("메인홈페이지다");

		ServletContext sc = request.getServletContext();
		BoardService boardService = (BoardService) sc.getAttribute("boardService");
		MemberService memberService = (MemberService) sc.getAttribute("memberService");
		
		HttpSession session = request.getSession();
		MemberVO me =  (MemberVO) session.getAttribute("userVO");
		
		System.out.println("blogController 안에서 세션정보 찍기 : \n" + me);
		
		if(me != null) {
			System.out.println("진입?");
			friend = memberService.selectFriend(me);
		}
		List<BoardVO> mainPopular = boardService.selectPopularBoard(); 
		List<BoardVO> mainRecent = boardService.selectPresentBoard();
		
		ModelAndView mav = new ModelAndView();
		mav.setView("/index.jsp");
		mav.addAttribute("friend", friend);
		mav.addAttribute("mainPopular", mainPopular);
		mav.addAttribute("mainRecent", mainRecent);
		
		return mav;
	}
}
