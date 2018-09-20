package kr.co.mlec.friend.service;

import kr.co.mlec.friend.dao.FriendDAO;
import kr.co.mlec.friend.vo.FriendVO;

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
}
