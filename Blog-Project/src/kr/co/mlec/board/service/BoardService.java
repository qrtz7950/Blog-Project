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

	public BoardVO selectPopularBoard() {
		int popNo = dao.selectPoppularBoard();
		BoardVO presentBoard = dao.selectDetailBoardByNo(popNo);
		return presentBoard;
	}

	public List<BoardVO> selectRecentReplyList(MemberVO me) {
		
		List<BoardVO> list = dao.selectRecentReplyList(me);
		return list;
	}
}
