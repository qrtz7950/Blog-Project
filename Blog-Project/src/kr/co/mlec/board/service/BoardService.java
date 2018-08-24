package kr.co.mlec.board.service;


import kr.co.mlec.board.dao.BoardDAO;
import kr.co.mlec.board.vo.BoardVO;

public class BoardService {
	
	private BoardDAO dao;

	public BoardService(BoardDAO dao) {
		this.dao = dao;
	}

	public void write(BoardVO board) {
		dao.write(board); 
	}
	
//	public List<BoardVO> selectAll() {
//		return dao.selectAll();
//	}
}
