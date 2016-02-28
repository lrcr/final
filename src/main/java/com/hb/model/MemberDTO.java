package com.hb.model;

public class MemberDTO {
	String email, pw, nicknm, agree, phone; 
	
	public String getEmail() {
		return email;
	}
	public String getNicknm() {
		return nicknm;
	}
	public String getPw() {
		return pw;
	}
	public String getAgree() {
		return agree;
	}
	public String getPhone() {
		return phone;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public void setAgree(String agree) {
		this.agree = agree;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setNicknm(String nicknm) {
		this.nicknm = nicknm;
	}
	@Override
	public String toString() {
		return "MemberDTO [email=" + email + ", pw=" + pw + ", nicknm=" + nicknm + ", phone=" + phone + ", agree="
				+ agree + "]";
	}
}
