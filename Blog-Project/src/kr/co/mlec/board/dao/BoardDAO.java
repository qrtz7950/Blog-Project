package kr.co.mlec.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.util.ConnectionFactory;
import kr.co.mlec.util.JDBCClose;

public class BoardDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	List<BoardVO> boardList = null;
	BoardVO board = null;
	StringBuilder sql = null;
	
	public void write(BoardVO board) {
		
		try {
			conn = ConnectionFactory.getConnection();
			
			sql = new StringBuilder();
			sql.append("insert into b_board(id, board_no, title, content, category_name, tag) ");
			sql.append("			values ( ?, seq_board_no.nextval, ?, ?, ?) ");

			pstmt = conn.prepareStatement(sql.toString());
			
			int loc = 1;

			pstmt.setString(loc++, board.getId());
			pstmt.setString(loc++, board.getTitle());
			pstmt.setString(loc++, board.getContent());
			pstmt.setString(loc++, board.getCategory_name());
			pstmt.setString(loc++, board.getTag());
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			
		} finally {
			JDBCClose.close(conn, pstmt);
		}
		
	}

}
