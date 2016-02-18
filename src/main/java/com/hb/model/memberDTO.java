package com.hb.model;

public class memberDTO {
	String email, pw, nicknm, agree; 
	int phone;
	
	public String getEmail() {
		return email;
	}
	
	public String getPw() {
		return pw;
	}
	public String getNicknm() {
		return nicknm;
	}
	public String getAgree() {
		return agree;
	}
	public int getPhone() {
		return phone;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public void setNicknm(String nicknm) {
		this.nicknm = nicknm;
	}
	public void setAgree(String agree) {
		this.agree = agree;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	
	@Override
	public String toString() {
		return "DTO [email=" + email + ", pw=" + pw + ", nicknm=" + nicknm + ", phone=" + phone + ", agree=" + agree
				+ "]";
	}
}
