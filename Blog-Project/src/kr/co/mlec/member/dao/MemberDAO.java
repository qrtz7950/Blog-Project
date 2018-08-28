package kr.co.mlec.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.co.mlec.member.vo.MemberVO;
import kr.co.mlec.util.ConnectionFactory;

public class MemberDAO {

	public MemberVO login(MemberVO loginVO) {
		MemberVO userVO = null;
		
		StringBuilder sql = new StringBuilder();
		sql.append("select id, password ");
		sql.append("  from b_member ");
		sql.append("  where id = ? and password = ? ");
		
		try(
				Connection conn = ConnectionFactory.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			
			pstmt.setString(1, loginVO.getId());
			pstmt.setString(2, loginVO.getPw());
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				userVO = new MemberVO();
				userVO.setId(rs.getString("id"));
				userVO.setPw(rs.getString("password"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return userVO;
	}
}