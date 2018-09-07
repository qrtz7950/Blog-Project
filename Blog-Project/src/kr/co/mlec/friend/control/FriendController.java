package kr.co.mlec.friend.control;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.mlec.framework.ModelAndView;
import kr.co.mlec.framework.annotation.Controller;
import kr.co.mlec.framework.annotation.RequestMapping;
import kr.co.mlec.friend.service.FriendService;
import kr.co.mlec.friend.vo.FriendVO;
import kr.co.mlec.member.vo.MemberVO;

@Controller
public class FriendController {
	
	@RequestMapping("/friend/friendPlus.do")
	public ModelAndView friendPlus(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("friendPlus() 메소드 호출...");
		
		String target_id = request.getParameter("target_id");
		
		HttpSession session = request.getSession();
		MemberVO me = (MemberVO)session.getAttribute("userVO");
		
		FriendVO friendVO = new FriendVO(target_id, me.getId());
		
		ServletContext sc = request.getServletContext();
		FriendService service = (FriendService)sc.getAttribute("friendService");
		service.friendPlus(friendVO);
		
		System.out.println(target_id);
		System.out.println(me.getId());
		
		ModelAndView mav = new ModelAndView("/jsp/friend/friendPlus.jsp");
		
		return mav;
	}
	
}
