package kr.co.mlec.board.service;


import java.util.List;

import kr.co.mlec.board.dao.BoardDAO;
import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.member.vo.MemberVO;

public class BoardService {
	
	private BoardDAO dao;

	public BoardService(BoardDAO dao) {
		this.dao = dao;
	}

	public void write(BoardVO board) {
		dao.write(board); 
	}
	
	public BoardVO selectDetailBoardByNo(int no, MemberVO userVO) {
		
		BoardVO board = dao.selectDetailBoardByNo(no);
		if(userVO!=null && userVO.getId().equals(board.getId())) {
				return board;
		}
		dao.upViewCnt(no);
		board = dao.selectDetailBoardByNo(no);
		
		return board;
	}

	public List<BoardVO> selectRecentBoard(MemberVO me) {
		
		List<BoardVO> list = dao.selectRecentBoard(me);
		return list;
	}

	public BoardVO selectPresentBoard(MemberVO member) {
		int preNo = dao.selectPresentBoard(member);
		BoardVO presentBoard = dao.selectDetailBoardByNo(preNo);
		return presentBoard;
	}

	public BoardVO selectPopularBoard(MemberVO me) {
		int popNo = dao.selectPoppularBoard(me);
		BoardVO presentBoard = dao.selectDetailBoardByNo(popNo);
		return presentBoard;
	}

	public List<BoardVO> selectPresentBoard() {
		List<BoardVO> list = dao.selectPresentBoard();
		return list;
	}
	
	public List<BoardVO> selectPopularBoard() {
		List<BoardVO> list = dao.selectPopularBoard();
		return list;
	}
	public List<String> getCategory(String id) {
		
		List<String> list = dao.getCategory(id);
		return list;
	}
	
	public List<BoardVO> selectByCategory(String category, String id){
		return dao.selectByCategory(category, id);
	}
	
	public List<BoardVO> selectByHashtag(String hashtag){
		return dao.selectByHashtag(hashtag);
	}
	
	public void likeIt(int no) {
		dao.likeIt(no);
	}

	public List<BoardVO> selectRecentBoardList(MemberVO blogHost) {
		return dao.selectRecentBoardList(blogHost);
	}

	public List<BoardVO> selectByRegDate(String ym, String blogHost) {
		return dao.selectByRegDate(ym, blogHost);
	}

	public List<String> boardListYM(String id) {
		return dao.boardListYM(id);
	}
}
