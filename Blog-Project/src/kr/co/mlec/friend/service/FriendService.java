package kr.co.mlec.friend.service;

import java.util.List;

import kr.co.mlec.friend.dao.FriendDAO;
import kr.co.mlec.friend.vo.FriendVO;
import kr.co.mlec.member.vo.MemberVO;

public class FriendService {

	private FriendDAO dao ;
	
	public FriendService(FriendDAO dao) {
		this.dao = dao;
	}
	public boolean friendPlus(FriendVO friendVO) {
		boolean friendReqOverlapCheck = dao.friendReqOverlapCheck(friendVO);
		
		if(friendReqOverlapCheck) {
			return true;
		} else {
			dao.friendPlus(friendVO);
			return false;
		}
	}
	public List<FriendVO> getReqFriendList(String id) {
		return dao.getReqFriendList(id);
	}
}
