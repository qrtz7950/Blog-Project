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
		
		
		//////////////////////////DAO 메소드 고쳐야됨////////////////////////////////////
		
		try {
			conn = ConnectionFactory.getConnection();
			
			sql = new StringBuilder();
			sql.append("select no, title, writer, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
			sql.append("	from t_board ");
			sql.append("   order by no desc ");

			
			
			pstmt = conn.prepareStatement(sql.toString());
			
			ResultSet rs = pstmt.executeQuery();

			boardList = new ArrayList<>();
			
			while(rs.next()){
				int no			 = rs.getInt("no");
				String title 	 = rs.getString("title");
				String writer	 = rs.getString("writer");
				String reg_date  = rs.getString("reg_date");
				
				BoardVO board = new BoardVO();
				
				board.setNo(no);
				board.setTitle(title);
				board.setWriter(writer);
				board.setRegDate(reg_date);
				
				boardList.add(board);
			}
		} catch (Exception e) {
			
		} finally {
			JDBCClose.close(conn, pstmt);
		}
		
		return boardList;
	}
	}
}
