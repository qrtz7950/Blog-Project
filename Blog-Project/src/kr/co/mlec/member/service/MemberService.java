package kr.co.mlec.member.service;

import java.util.List;

import kr.co.mlec.member.dao.MemberDAO;
import kr.co.mlec.member.vo.MemberVO;

public class MemberService {
	
	private MemberDAO dao;

	public MemberService(MemberDAO dao) {
		this.dao = dao;
	}
	
	public MemberVO login(MemberVO loginVO) {
		return dao.login(loginVO);
	}

	public void signUp(MemberVO member) {
		dao.signUp(member);
	}

	public List<MemberVO> selectFriend(MemberVO me) {
		
		List<MemberVO> list = dao.selectFriend(me);
		return list;
	}
}
