package kr.co.mlec.friend.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.co.mlec.friend.vo.FriendVO;
import kr.co.mlec.member.vo.MemberVO;
import kr.co.mlec.util.ConnectionFactory;

public class FriendDAO {

	public FriendVO friendPlus(FriendVO friendVO) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("select target_id, req_id ");
		sql.append("from friend_req ");
		sql.append(" where target_id = ? ");
		
		try(
				Connection conn = ConnectionFactory.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			
			pstmt.setString(1, friendVO.getTarget_id());
			
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				friendVO = new FriendVO();
				friendVO.setTarget_id(rs.getString("target_id"));
				
				String req_id = rs.getReq_id("req_id");
				FriendVO friend = new FriendVO();
				friend.setReq_id(req_id);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return friendVO;
	
	}
}
