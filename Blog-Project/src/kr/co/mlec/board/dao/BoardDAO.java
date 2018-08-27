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
	
	public void write(BoardVO board) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("insert into b_board(id, board_no, title, content, category_name, tag) ");
		sql.append("			values ( ?, seq_board_no.nextval, ?, ?, ?, ?) ");
		
		try(
				Connection conn = ConnectionFactory.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			){
				int loc = 1;
		
				pstmt.setString(loc++, board.getId());
				pstmt.setString(loc++, board.getTitle());
				pstmt.setString(loc++, board.getContent());
				pstmt.setString(loc++, board.getCategory_name());
				pstmt.setString(loc++, board.getTag());
				
				pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} 		
	}
	
	public static void main(String[] args) {
		BoardVO b = new BoardVO();
		b.setId("qrtz7950");
		b.setTitle("합칠까");
		b.setContent("그럴까!");
		b.setCategory_name("카테");
		b.setTag("#병문병문#규성규성");
		
		new BoardDAO().write(b);
		System.out.println(b);
	}

}
