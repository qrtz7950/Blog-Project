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
		
		HttpSession session = request.getSession();
		MemberVO me = (MemberVO)session.getAttribute("userVO");
		
		String target_id = request.getParameter("friendId");
		String req_id = me.getId();
		
		FriendVO friendVO = new FriendVO(target_id, req_id);
		
		ServletContext sc = request.getServletContext();
		FriendService friService = (FriendService)sc.getAttribute("friendService");
		
		boolean friendOverlapCheck = friService.friendPlus(friendVO);
		
		ModelAndView mav = new ModelAndView();
		
		if(friendOverlapCheck) {

			mav.addAttribute("msg", "이미 친구 신청한 사용자입니다");
			mav.setView("/jsp/friend/friendPlus.jsp");
			
			return mav;
			
		} else {
			
			mav.addAttribute("msg", "친구 신청 되었습니다");
			mav.setView("/jsp/friend/friendPlus.jsp");
			
			return mav;
		}
	}
	
}
