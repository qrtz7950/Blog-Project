package kr.co.mlec.reply.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.mlec.member.vo.MemberVO;
import kr.co.mlec.reply.vo.ReplyVO;
import kr.co.mlec.util.ConnectionFactory;

public class ReplyDAO {
	
	public List<ReplyVO> selectReplyByBoardNo(int no){
		
		List<ReplyVO> replyList = new ArrayList<>();		
		StringBuilder sql = new StringBuilder();
		sql.append("select reply_no, board_no, id, content, depth, parent, seq, to_char(reg_date ,'yyyy-mm-dd') as reg_date");
		sql.append("  from reply ");
		sql.append("  where board_no = ? ");
		sql.append("  order by seq asc, reply_no asc ");
		
		try(
				Connection conn = ConnectionFactory.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			
			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReplyVO replyVo = new ReplyVO();
				
				replyVo.setReply_no(rs.getInt("reply_no"));
				replyVo.setBoard_no(rs.getInt("board_no"));
				replyVo.setId(rs.getString("id"));
				replyVo.setContent(rs.getString("content"));
				replyVo.setDepth(rs.getInt("depth"));
				replyVo.setParent(rs.getInt("parent"));
				replyVo.setSeq(rs.getInt("seq"));
				replyVo.setReg_date(rs.getString("reg_date"));
				
				replyList.add(replyVo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return replyList;
	}
	
	
	public void upload(ReplyVO reply) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("insert into reply(reply_no, board_no, id, content, depth, parent, seq) ");
		sql.append("  values(seq_reply_no.nextval, ?, ?, ?, ?, ?, ?) ");
		
		try(
				Connection conn = ConnectionFactory.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			
			pstmt.setInt(1, reply.getBoard_no());
			pstmt.setString(2, reply.getId());
			pstmt.setString(3, reply.getContent());
			pstmt.setInt(4, reply.getDepth());
			pstmt.setInt(5, reply.getParent());
			pstmt.setInt(6, reply.getSeq());
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	public List<ReplyVO> selectRecentReplyList(MemberVO blogHost) {
		
		List<ReplyVO> recentReplyList = new ArrayList<>();		
		StringBuilder sql = new StringBuilder();
		
		sql.append("select reply_no, board_no, id, content, depth, parent, seq, to_char(reg_date ,'yyyy-mm-dd') as reg_date");
		sql.append("  from reply ");
		sql.append("  where id = ? ");
		sql.append("  order by reply_no ");
		
		try(
				Connection conn = ConnectionFactory.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			
			pstmt.setString(1, blogHost.getId());
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReplyVO replyVo = new ReplyVO();
				
				replyVo.setReply_no(rs.getInt("reply_no"));
				replyVo.setBoard_no(rs.getInt("board_no"));
				replyVo.setId(rs.getString("id"));
				replyVo.setContent(rs.getString("content"));
				replyVo.setDepth(rs.getInt("depth"));
				replyVo.setParent(rs.getInt("parent"));
				replyVo.setSeq(rs.getInt("seq"));
				replyVo.setReg_date(rs.getString("reg_date"));
				
				recentReplyList.add(replyVo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return recentReplyList;
	}
}
