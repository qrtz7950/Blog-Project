package kr.co.mlec.reply.service;

import java.util.ArrayList;
import java.util.List;

import kr.co.mlec.reply.dao.ReplyDAO;
import kr.co.mlec.reply.vo.ReplyVO;

public class ReplyService {
	
	private ReplyDAO dao;

	public ReplyService(ReplyDAO dao) {
		this.dao = dao;
	}
	
	public List<ReplyVO> selectReplyByBoardNo(int no) {			
		return dao.selectReplyByBoardNo(no);
	}
	
	public void write(ReplyVO reply) {
		dao.upload(reply);
	}
}
