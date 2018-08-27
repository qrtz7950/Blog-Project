package kr.co.mlec.login.vo;

public class LoginVO {
	
	private String id;
	private String pw;
	
	public LoginVO() {
		
	}
	
	public LoginVO(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	@Override
	public String toString() {
		return "LoginVO [id=" + id + ", pw=" + pw + "]";
	}
	
}

