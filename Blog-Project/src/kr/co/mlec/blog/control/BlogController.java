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
import kr.co.mlec.friend.service.FriendService;
import kr.co.mlec.friend.vo.FriendVO;
import kr.co.mlec.member.service.MemberService;
import kr.co.mlec.member.vo.MemberVO;


@Controller
public class BlogController {

	@RequestMapping("/index.do")
	public ModelAndView myBlog(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<MemberVO> friend = null;
		
		ServletContext sc = request.getServletContext();
		BoardService boardService = (BoardService) sc.getAttribute("boardService");
		MemberService memberService = (MemberService) sc.getAttribute("memberService");
		
		HttpSession session = request.getSession();
		MemberVO me =  (MemberVO) session.getAttribute("userVO");
		
		if(me != null) {
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
	
	@RequestMapping("/blogSetting.do")
	public ModelAndView blogSetting(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		MemberVO me = (MemberVO) session.getAttribute("userVO");
		
		ServletContext sc = request.getServletContext();
		FriendService friservice = (FriendService) sc.getAttribute("friendService");
		
		List<FriendVO> friList = friservice.getReqFriendList(me.getId());
		
		System.out.println("blogSetting() 호출");
		System.out.println(friList);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addAttribute("friList", friList);
		mav.setView("/jsp/blog/setting.jsp");

		return mav;
	}
		
	
}
