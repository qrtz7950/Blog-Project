package kr.co.mlec.board.vo;

/**
 * @author rlawp
 *
 */
public class BoardVO {

	private String id;
	private int board_no;
	private String category_name;
	private String title;
	private String content;
	private String tag;
	private int view_cnt;
	private int like_cnt;
	private String reg_date;

	public BoardVO() {
	}
	
	public BoardVO(String id, int board_no, String category_name, String title, String content, String tag,
			int view_cnt, int like_cnt, String reg_date) {
		this.id = id;
		this.board_no = board_no;
		this.category_name = category_name;
		this.title = title;
		this.content = content;
		this.tag = tag;
		this.view_cnt = view_cnt;
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

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
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

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public int getView_cnt() {
		return view_cnt;
	}

	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
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
		return "BoardVO [id=" + id + ", board_no=" + board_no + ", category_name=" + category_name + ", title=" + title
				+ ", content=" + content + ", tag=" + tag + ", view_cnt=" + view_cnt + ", like_cnt=" + like_cnt
				+ ", reg_date=" + reg_date + "]";
	}
	
}
