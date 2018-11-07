package kr.or.nextit.login.service;

import java.io.Serializable;

public class LoginVO implements Serializable{
	
	private String userName;
	private String userId;
	private String userPw;
	private String userEmail;
	private String userRemember;
	
	private boolean result;
	private String message;
	
	public LoginVO() {
		
	}
	
	public LoginVO(String name, String userId, String Pw, String userEmail) {
		this.userName =name;
		this.userId = userId;
		this.userPw = Pw;
		this.userEmail = userEmail;
	}
	
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public boolean isResult() {
		return result;
	}
	public void setResult(boolean result) {
		this.result = result;
	}
	public String getUserRemember() {
		return userRemember;
	}
	public void setUserRemember(String userRemember) {
		this.userRemember = userRemember;
	}
}
