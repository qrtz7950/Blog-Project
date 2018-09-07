package kr.co.mlec.friend.service;

import kr.co.mlec.friend.dao.FriendDAO;
import kr.co.mlec.friend.vo.FriendVO;

public class FriendService {

	private FriendDAO dao ;
	
	public FriendService(FriendDAO dao) {
		this.dao = dao;
	}
	public FriendVO friendPlus(FriendVO friendVO) {
		return dao.friendPlus(friendVO);
	}
}
