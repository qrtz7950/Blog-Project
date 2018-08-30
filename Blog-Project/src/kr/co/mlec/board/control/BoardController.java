package kr.co.mlec.board.control;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import kr.co.mlec.board.service.BoardService;
import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.framework.ModelAndView;
import kr.co.mlec.framework.annotation.Controller;
import kr.co.mlec.framework.annotation.RequestMapping;
import kr.co.mlec.member.vo.MemberVO;
import kr.co.mlec.reply.service.ReplyService;
import kr.co.mlec.reply.vo.ReplyVO;

@Controller
public class BoardController extends HttpServlet {
	
	@RequestMapping("/myBlog.do")
	public ModelAndView mainView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("mainView() 호출...");
				
		ServletContext sc = request.getServletContext();
		BoardService service = (BoardService) sc.getAttribute("boardService");
		
		HttpSession session = request.getSession();
		MemberVO me =  (MemberVO) session.getAttribute("userVO");
	
		List<BoardVO> recentBoard = service.selectRecentReplyList(me);
		
		BoardVO presentBoard = service.selectPresentBoard(me);
		BoardVO popularBoard = service.selectPopularBoard();
		
		ModelAndView mav = new ModelAndView();
		mav.setView("/bloghome.jsp");
		mav.addAttribute("member", me);
		mav.addAttribute("recentBoard", recentBoard);
		mav.addAttribute("presentBoard", presentBoard);
		mav.addAttribute("popularBoard", popularBoard);
		
		System.out.println("지금 이 블로그의 주인 : " + me.getId());
		System.out.println("최근글\n");
		System.out.println(recentBoard);
		System.out.println("대표글\n");
		System.out.println(presentBoard);
		System.out.println("인기글\n");
		System.out.println(popularBoard);
		
		return mav;
	}
	
	@RequestMapping("/writeForm.do")
	public ModelAndView write(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("wirte() 호출...");
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("userVO");
		
		ServletContext sc = request.getServletContext();
		BoardService service = (BoardService) sc.getAttribute("boardService");
		List<String> categoryList = service.getCategory(member.getId());
		
		ModelAndView mav = new ModelAndView();
		mav.setView("/jsp/blog/writeForm.jsp");
		mav.addAttribute("categoryList", categoryList);
		
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
		mav.setView("/jsp/blog/write.jsp");
		
		return mav;
	}
	
	@RequestMapping(value="/blog/detailBoard.do")
	public ModelAndView viewDetailBoard(HttpServletRequest request, HttpServletResponse response)
				throws Exception{
		
		ServletContext sc = request.getServletContext();
		
		BoardService service = (BoardService) sc.getAttribute("boardService");
		int board_no = Integer.parseInt(request.getParameter("board_no"));
		// 게시글 번호로 게시글 정보 조회
		BoardVO detailBlogBoard = service.selectDetailBoardByNo(board_no);
		
		// 해시태그정리
		List<String> tags = new ArrayList<String>(Arrays.asList(detailBlogBoard.getTag().split("#")));
		tags.remove(0);
		for(int i=0; i<tags.size(); i++) {
			tags.set(i, "#" + tags.get(i));
			System.out.println(tags.get(i));
		}
		
		// 댓글 정보 가져오기
		ReplyService replyService = (ReplyService) sc.getAttribute("replyService");
		List<ReplyVO> replyList = replyService.selectReplyByBoardNo(board_no);
		
		
		ModelAndView mav = new ModelAndView();
		mav.setView("/jsp/blog/detailBoard.jsp");
		mav.addAttribute("detailBlogBoard", detailBlogBoard);
		mav.addAttribute("hashtags", tags);
		mav.addAttribute("replyList", replyList);
		
		
		return mav;
	}
	
}
