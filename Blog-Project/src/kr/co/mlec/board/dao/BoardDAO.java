package kr.co.mlec.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.member.vo.MemberVO;
import kr.co.mlec.util.ConnectionFactory;

public class BoardDAO {
	
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

	public List<BoardVO> selectRecentBoard(MemberVO me) {
		
		List<BoardVO> list = new ArrayList<>();
		BoardVO board = null;
		int temp = 0;
		
		StringBuilder sql = new StringBuilder();
		sql.append("select id, board_no, view_cnt, title, content, tag, category_name, like_cnt, to_char(reg_date ,'yyyy-mm-dd') as reg_date " );
		sql.append(" from b_board ");
		sql.append(" where id = ? ");
		sql.append(" order by board_no ");
		try(
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			System.out.println("selectRecentBoard안에 member : " + me.getId());
			pstmt.setString(1, me.getId());
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
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
				
				list.add(board);
				temp++;
			}
			System.out.println("selectRecentBoard안에" + board);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public int selectPresentBoard(MemberVO member) {
		
		int preNo = 2;
				
		StringBuilder sql = new StringBuilder();
		
		sql.append("select PRESENT_BOARD ");
		sql.append("	   from blog ");
		sql.append(" 	   where id = ? ");
		
		try(
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			System.out.println("presentBoard 안에 member : " + member.getId());
			pstmt.setString(1, member.getId());
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				preNo= rs.getInt("PRESENT_BOARD");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return preNo;
	}

	public int selectPoppularBoard() {
		
		int popNo = 2;
		
		StringBuilder sql = new StringBuilder();
		
		sql.append("select board_no, like_cnt ");
		sql.append("	   from b_board ");
		sql.append(" 	   order by like_cnt desc ");
		
		try(
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				popNo= rs.getInt("board_no");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return popNo;
	}

	public List<BoardVO> selectRecentReplyList(MemberVO me) {
		
		List<BoardVO> list = new ArrayList<>();
		
		
		return list;
	}

	public List<String> getCategory(String id) {
		
		List<String> list = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		
		sql.append("select category_no, id, category_name, depth, parent ");
		sql.append("	   from board_category ");
		sql.append(" 	   where id = ? ");
		sql.append(" 	   order by 1 asc ");
		
		try(
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(rs.getString("category_name"));
			}
			
			for(String cat : list) {
				System.out.println(cat);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public void upViewCnt(int no) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("update b_board " );
		sql.append("  set view_cnt = view_cnt + 1 ");
		sql.append(" where board_no = ? ");
		try(
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			
			pstmt.setInt(1, no);
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public List<BoardVO> selectByCategory(String category, String id){
		
		List<BoardVO> list = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		sql.append("select board_no, title, to_char(reg_date ,'yyyy-mm-dd') as reg_date, view_cnt " );
		sql.append("  from b_board ");
		sql.append("  where id = ? and category_name = ? ");
		sql.append("  order by board_no desc ");
		try(
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			
			pstmt.setString(1, id);
			pstmt.setString(2, category);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardVO board = new BoardVO();
				
				board.setBoard_no(rs.getInt("board_no"));
				board.setTitle(rs.getString("title"));
				board.setReg_date(rs.getString("reg_date"));
				board.setView_cnt(rs.getInt("view_cnt"));
				
				list.add(board);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void likeIt(int no) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("update b_board " );
		sql.append("  set like_cnt = like_cnt + 1 ");
		sql.append(" where board_no = ? ");
		try(
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			
			pstmt.setInt(1, no);
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
