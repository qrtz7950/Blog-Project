package kr.co.mlec.board.vo;

public class BoardVO {

	private String id;
	private int board_no;
	private int view_cnt;
	private String title;
	private String content;
	private String category_name;
	private int like_cnt;
	private String reg_date;

	public BoardVO() {
	}

	public BoardVO(String id, int board_no, int view_cnt, String title, String content, String category_name,
			int like_cnt, String reg_date) {
		super();
		this.id = id;
		this.board_no = board_no;
		this.view_cnt = view_cnt;
		this.title = title;
		this.content = content;
		this.category_name = category_name;
		this.like_cnt = like_cnt;
		this.reg_date = reg_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getView_cnt() {
		return view_cnt;
	}

	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public int getLike_cnt() {
		return like_cnt;
	}

	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "BoardVO [id=" + id + ", board_no=" + board_no + ", view_cnt=" + view_cnt + ", title=" + title
				+ ", content=" + content + ", category_name=" + category_name + ", like_cnt=" + like_cnt + ", reg_date="
				+ reg_date + "]";
	}
	
}
