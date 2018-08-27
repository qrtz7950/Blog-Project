package kr.co.mlec.blogBoard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.co.mlec.blogBoard.vo.BlogBoardVO;
import kr.co.mlec.util.ConnectionFactory;

public class BlogBoardDAO {
	
	public BlogBoardVO selectDetailBlogBoard(int no) {
		
		BlogBoardVO blogBoardVO = null;
		
		StringBuilder sql = new StringBuilder();
		sql.append("select id, board_no, view_cnt, title, content, category_name, like_cnt, to_char(reg_date ,'yyyy-mm-dd') as reg_date " );
		sql.append(" from b_board ");
		sql.append(" where no = ? ");
		
		try(
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			
			blogBoardVO = new BlogBoardVO();
			blogBoardVO.setId(rs.getString("id"));
			blogBoardVO.setBoard_no(rs.getInt("board_no"));
			blogBoardVO.setView_cnt(rs.getInt("view_cnt"));
			blogBoardVO.setTitle(rs.getString("title"));
			blogBoardVO.setContent(rs.getString("content"));
			blogBoardVO.setCategory_name(rs.getString("category_name"));
			blogBoardVO.setLike_cnt(rs.getInt("like_cnt"));
			blogBoardVO.setReg_date(rs.getString("reg_date"));
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		 return blogBoardVO;
	}
}
