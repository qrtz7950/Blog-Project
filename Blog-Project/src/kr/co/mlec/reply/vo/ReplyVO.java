package kr.co.mlec.reply.vo;

public class ReplyVO {

	private int reply_no;
	private int board_no;
	private String id;
	private String content;
	private int depth;
	private int parent;
	private int seq;
	private String reg_date;
		
	public ReplyVO() {
		
	}

	public ReplyVO(int reply_no, int board_no, String id, String content, int depth, int parent, int seq,
			String reg_date) {
		super();
		this.reply_no = reply_no;
		this.board_no = board_no;
		this.id = id;
		this.content = content;
		this.depth = depth;
		this.parent = parent;
		this.seq = seq;
		this.reg_date = reg_date;
	}

	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "ReplyVO [reply_no=" + reply_no + ", board_no=" + board_no + ", id=" + id + ", content=" + content
				+ ", depth=" + depth + ", parent=" + parent + ", seq=" + seq + ", reg_date=" + reg_date + "]";
	}
	
	
	
	
	
}
