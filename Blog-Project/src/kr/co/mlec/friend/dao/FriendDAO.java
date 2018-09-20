package kr.co.mlec.friend.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.friend.vo.FriendVO;
import kr.co.mlec.member.vo.MemberVO;
import kr.co.mlec.util.ConnectionFactory;

public class FriendDAO {

	public void friendPlus(FriendVO friendVO) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("insert into friend_req(req_no, target_id, req_id) ");
		sql.append("			values(seq_friend_req_no.nextval ,?, ?) ");
		
		try(
				Connection conn = ConnectionFactory.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			
			pstmt.setString(1, friendVO.getTarget_id());
			pstmt.setString(2, friendVO.getReq_id());
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	public boolean friendReqOverlapCheck(FriendVO friendVO) {
		
		boolean friendReqOverlapCheck = true;
		
		StringBuilder sql = new StringBuilder();
		sql.append("select req_id, target_id " );
		sql.append(" from friend_req ");
		sql.append(" where req_id = ? and target_id = ? ");
		
		try(
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			
			pstmt.setString(1, friendVO.getReq_id());
			pstmt.setString(2, friendVO.getTarget_id());
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				friendReqOverlapCheck = true;
				
			} else {
				
				friendReqOverlapCheck = false;
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}

		return friendReqOverlapCheck;
	}
}
