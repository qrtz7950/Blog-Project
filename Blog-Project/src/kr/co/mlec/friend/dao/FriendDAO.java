package kr.co.mlec.friend.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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

	public List<FriendVO> getReqFriendList(String id) {

		List<FriendVO> friList = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		sql.append("select target_id, req_id, req_no, to_char(reg_date ,'yyyy-mm-dd') as reg_date " );
		sql.append(" from friend_req ");
		sql.append(" where target_id = ? ");
		
		try(
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				FriendVO f = new FriendVO();
				f.setReq_id(rs.getString("req_id"));
				f.setTarget_id(rs.getString("target_id"));
				f.setReq_no(rs.getString("req_no"));
				f.setReg_date(rs.getString("reg_date"));
				
				friList.add(f);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}

		return friList;
	}
}
