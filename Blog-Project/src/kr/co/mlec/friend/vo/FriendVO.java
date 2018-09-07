package kr.co.mlec.friend.vo;

public class FriendVO {

	private String target_id;
	private String req_id;
	public FriendVO() {
		// TODO Auto-generated constructor stub
	}
	public FriendVO(String target_id, String req_id) {
		super();
		this.target_id = target_id;
		this.req_id = req_id;
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
	@Override
	public String toString() {
		return "FriendVO [target_id=" + target_id + ", req_id=" + req_id + "]";
	}
	
	
	
	
}
