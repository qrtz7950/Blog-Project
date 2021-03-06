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
	
	@RequestMapping("/blogHome.do")
	public ModelAndView mainView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MemberVO blogHost = new MemberVO();
		blogHost.setId(request.getParameter("blogHost"));
		
		System.out.println("mainView() 호출...");
				
		ServletContext sc = request.getServletContext();
		BoardService boardservice = (BoardService) sc.getAttribute("boardService");
		ReplyService replyservice = (ReplyService) sc.getAttribute("replyService");

		List<ReplyVO> recentReplyList = replyservice.selectRecentReplyList(blogHost);
		List<BoardVO> recentBoard = boardservice.selectRecentBoardList(blogHost);
		BoardVO presentBoard = boardservice.selectPresentBoard(blogHost);
		BoardVO popularBoard = boardservice.selectPopularBoard(blogHost);
		
		ModelAndView mav = new ModelAndView();
		mav.setView("/bloghome.jsp");
		mav.addAttribute("member", blogHost);
		mav.addAttribute("recentBoard", recentBoard);
		mav.addAttribute("presentBoard", presentBoard);
		mav.addAttribute("popularBoard", popularBoard);
		mav.addAttribute("recentReplyList", recentReplyList);
		
//		System.out.println("지금 이 블로그의 주인 : " + blogHost);
//		System.out.println("최근글\n");
//		System.out.println(recentBoard);
//		System.out.println("대표글\n");
//		System.out.println(presentBoard);
//		System.out.println("인기글\n");
//		System.out.println(popularBoard);
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
		
		String blogHost = request.getParameter("blogHost");
		
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
		mav.setView("/jsp/blog/write.jsp?blogHost=" + blogHost);
		
		return mav;
	}
	
	@RequestMapping(value="/blog/detailBoard.do")
	public ModelAndView viewDetailBoard(HttpServletRequest request, HttpServletResponse response)
				throws Exception{
		
		MemberVO blogHost = new MemberVO();
		blogHost.setId(request.getParameter("blogHost")); 
		
		ServletContext sc = request.getServletContext();
		
		BoardService service = (BoardService) sc.getAttribute("boardService");
		int board_no = Integer.parseInt(request.getParameter("board_no"));
		
		
		HttpSession session = request.getSession();
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		
		// 게시글 번호로 게시글 정보 조회
		BoardVO detailBlogBoard = service.selectDetailBoardByNo(board_no, userVO);
		
		// 해시태그정리
		List<String> tags = null;
		if(detailBlogBoard.getTag() != null) {
			tags = new ArrayList<String>(Arrays.asList(detailBlogBoard.getTag().split("#")));
			tags.remove(0);
			for(int i=0; i<tags.size(); i++) {
				tags.set(i, "#" + tags.get(i));
				System.out.println(tags.get(i));
			}
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
	
	@RequestMapping("/board/blogViewByCategory.do")
	public ModelAndView viewByCategory(HttpServletRequest request, HttpServletResponse response){
		ServletContext sc = request.getServletContext();
		String category = request.getParameter("category");
		
		String blogHost = request.getParameter("blogHost");
		
		BoardService service = (BoardService) sc.getAttribute("boardService");
		List<BoardVO> boardList = service.selectByCategory(category, blogHost);
		
		int totalPage = 0;
		int numPerPage = 10;
		
		int totalRecord = boardList.size();
		
		if(totalRecord != 0) {
			if(totalRecord % numPerPage == 0) {
				totalPage = totalRecord / numPerPage;
			} else {
				totalPage = totalRecord / numPerPage + 1;
			}
		}
		
		int curPage = 1;
		if(request.getParameter("curPage") != null) {
			if(Integer.parseInt(request.getParameter("curPage")) <= totalPage) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setView("/jsp/blog/blogViewByCategory.jsp");
		mav.addAttribute("category", category);
		mav.addAttribute("boardList", boardList);
		mav.addAttribute("totalPage", totalPage);
		mav.addAttribute("curPage", curPage);
		
		return mav;
	}
	
	@RequestMapping("/board/blogViewByRegDate.do")
	public ModelAndView viewByRegDate(HttpServletRequest request, HttpServletResponse response){
		
		ServletContext sc = request.getServletContext();
		BoardService service = (BoardService) sc.getAttribute("boardService");

		String ym = request.getParameter("YM");
		String blogHost = request.getParameter("blogHost");
		
		List<String> yyyymm = service.boardListYM(blogHost);
		
		System.out.println(yyyymm);
		
		List<BoardVO> boardList = service.selectByRegDate(ym, blogHost);
		
		int totalPage = 0;
		int numPerPage = 10;
		
		int totalRecord = boardList.size();
		
		if(totalRecord != 0) {
			if(totalRecord % numPerPage == 0) {
				totalPage = totalRecord / numPerPage;
			} else {
				totalPage = totalRecord / numPerPage + 1;
			}
		}
		
		int curPage = 1;
		if(request.getParameter("curPage") != null) {
			if(Integer.parseInt(request.getParameter("curPage")) <= totalPage) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setView("/jsp/blog/blogViewByRegDate.jsp");
		mav.addAttribute("ym", ym);
		mav.addAttribute("boardList", boardList);
		mav.addAttribute("totalPage", totalPage);
		mav.addAttribute("curPage", curPage);
		
		//String[] month = {"January","February","March","April","May","June","July","August","September","October","November","December"}; 
		
		return mav;
	}
		
	@RequestMapping("/board/blogViewByHashtag.do")
	public ModelAndView viewByHashtag(HttpServletRequest request, HttpServletResponse response){
		ServletContext sc = request.getServletContext();
		String hashtag = request.getParameter("hashtag");
		
		String blogHost = request.getParameter("blogHost");
		
		BoardService service = (BoardService) sc.getAttribute("boardService");
		System.out.println(hashtag);
		List<BoardVO> boardList = service.selectByHashtag(hashtag);
		
		int totalPage = 0;
		int numPerPage = 10;
		
		int totalRecord = boardList.size();
		
		if(totalRecord != 0) {
			if(totalRecord % numPerPage == 0) {
				totalPage = totalRecord / numPerPage;
			} else {
				totalPage = totalRecord / numPerPage + 1;
			}
		}
		
		int curPage = 1;
		if(request.getParameter("curPage") != null) {
			if(Integer.parseInt(request.getParameter("curPage")) <= totalPage) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setView("/jsp/blog/blogViewByHashtag.jsp");
		mav.addAttribute("hashtag", hashtag);
		mav.addAttribute("boardList", boardList);
		mav.addAttribute("totalPage", totalPage);
		mav.addAttribute("curPage", curPage);
		
		return mav;
	}
	
	@RequestMapping("/board/like.do")
	public ModelAndView like(HttpServletRequest request, HttpServletResponse response) {
		int board_no = Integer.parseInt(request.getParameter("board_no"));
		ServletContext sc = request.getServletContext();
		BoardService service = (BoardService) sc.getAttribute("boardService");
		String blogHost = request.getParameter("blogHost");
		
		service.likeIt(board_no);
		
		ModelAndView mav = new ModelAndView();
		mav.setView("/blog/detailBoard.do?blogHost=" + blogHost + "&board_no=" + board_no);
		
		return mav;
	}
}
