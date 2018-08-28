package kr.co.mlec.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.util.ConnectionFactory;

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
	
	public BoardVO selectDetailBoardByNo(int no) {
		
		BoardVO board = null;
		
		StringBuilder sql = new StringBuilder();
		sql.append("select id, board_no, view_cnt, title, content, tag, category_name, like_cnt, to_char(reg_date ,'yyyy-mm-dd') as reg_date " );
		sql.append(" from b_board ");
		sql.append(" where board_no = ? ");
		try(
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			
			pstmt.setInt(1, no);
			
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			
			board = new BoardVO();
			board.setId(rs.getString("id"));
			board.setBoard_no(rs.getInt("board_no"));
			board.setView_cnt(rs.getInt("view_cnt"));
			board.setTitle(rs.getString("title"));
			board.setContent(rs.getString("content"));
			board.setTag(rs.getString("tag"));
			board.setCategory_name(rs.getString("category_name"));
			board.setLike_cnt(rs.getInt("like_cnt"));
			board.setReg_date(rs.getString("reg_date"));
			
			System.out.println(board);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		 return board;
	}

}
