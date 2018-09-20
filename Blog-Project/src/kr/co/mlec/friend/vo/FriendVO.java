package kr.co.mlec.friend.vo;

public class FriendVO {

	private String target_id;
	private String req_id;
	private String reg_date;
	private String req_no;
	
	public FriendVO() {
	}
	
	public FriendVO(String target_id, String req_id) {
		this.target_id = target_id;
		this.req_id = req_id;
	}
	
	public FriendVO(String target_id, String req_id, String reg_date, String req_no) {
		super();
		this.target_id = target_id;
		this.req_id = req_id;
		this.reg_date = reg_date;
		this.req_no = req_no;
	}

	public String getTarget_id() {
		return target_id;
	}

	public void setTarget_id(String target_id) {
		this.target_id = target_id;
	}

	public String getReq_id() {
		return req_id;
	}

	public void setReq_id(String req_id) {
		this.req_id = req_id;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getReq_no() {
		return req_no;
	}

	public void setReq_no(String req_no) {
		this.req_no = req_no;
	}

	@Override
	public String toString() {
		return "FriendVO [target_id=" + target_id + ", req_id=" + req_id + ", reg_date=" + reg_date + ", req_no="
				+ req_no + "]";
	}
	
}
