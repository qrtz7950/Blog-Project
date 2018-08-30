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
	
	public void signUp(MemberVO member) {
				
		StringBuilder sql = new StringBuilder();
		sql.append("insert into b_member(id, password, id_no) ");
		sql.append("  			  values(?, ?, seq_b_member_id_no.nextval) ");
		
		try(
				Connection conn = ConnectionFactory.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			
			pstmt.executeUpdate();
			
			createBlog(member);
			createCategory(member);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	private void createBlog(MemberVO member) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("insert into blog(id, blog_no) ");
		sql.append("  		  values( ?, seq_blog_no.nextval) ");
		
		try(
				Connection conn = ConnectionFactory.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			
			pstmt.setString(1, member.getId());
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	private void createCategory(MemberVO member) {
		
		String sql1 = "insert into board_category(category_no, id, category_name, depth) values(seq_board_category_no.nextval, ?, '잡담', 0) ";
		String sql2 = "insert into board_category(category_no, id, category_name, depth) values(seq_board_category_no.nextval, ?, '일상', 0) ";
		String sql3 = "insert into board_category(category_no, id, category_name, depth) values(seq_board_category_no.nextval, ?, '사건', 0) ";
		String sql4 = "insert into board_category(category_no, id, category_name, depth) values(seq_board_category_no.nextval, ?, '카테고리', 0) ";
		
		try(
				Connection conn = ConnectionFactory.getConnection();
				PreparedStatement pstmt1 = conn.prepareStatement(sql1.toString());
				PreparedStatement pstmt2 = conn.prepareStatement(sql2.toString());
				PreparedStatement pstmt3 = conn.prepareStatement(sql3.toString());
				PreparedStatement pstmt4 = conn.prepareStatement(sql4.toString());
		) {

			pstmt1.setString(1, member.getId());
			pstmt2.setString(1, member.getId());
			pstmt3.setString(1, member.getId());
			pstmt4.setString(1, member.getId());
			
			pstmt1.executeUpdate();
			pstmt2.executeUpdate();
			pstmt3.executeUpdate();
			pstmt4.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
}
