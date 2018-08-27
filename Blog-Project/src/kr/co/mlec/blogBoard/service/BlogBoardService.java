package kr.co.mlec.blogBoard.service;

import kr.co.mlec.blogBoard.dao.BlogBoardDAO;
import kr.co.mlec.blogBoard.vo.BlogBoardVO;

public class BlogBoardService {
	
	private BlogBoardDAO dao;
	
	public BlogBoardService(BlogBoardDAO dao) {
		this.dao = dao;
	}
	
	public BlogBoardVO selectDetailBlogBoard(int no) {
		return dao.selectDetailBlogBoard(no);
	}
	
}
