package kr.co.mlec.login.service;

import kr.co.mlec.login.dao.LoginDAO;
import kr.co.mlec.login.vo.LoginVO;

public class LoginService {
	
	private LoginDAO dao;
	
	public LoginService(LoginDAO dao) {
		this.dao = dao;
	}
	
	public LoginVO login(LoginVO loginVO) {
		return dao.login(loginVO);
	}
	
}
