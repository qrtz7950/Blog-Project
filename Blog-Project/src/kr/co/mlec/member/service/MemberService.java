package kr.co.mlec.member.service;

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
}
