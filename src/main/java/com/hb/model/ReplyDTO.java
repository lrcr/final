package com.hb.model;

import java.util.Date;

public class ReplyDTO {
	int seq, no;
	double eval;
	String ment, nickname;
	Date submit;
	public int getSeq() {
		return seq;
	}
	public int getNo() {
		return no;
	}
	public double getEval() {
		return eval;
	}
	public String getMent() {
		return ment;
	}
	public String getNickname() {
		return nickname;
	}
	public Date getSubmit() {
		return submit;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public void setEval(double eval) {
		this.eval = eval;
	}
	public void setMent(String ment) {
		this.ment = ment;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public void setSubmit(Date submit) {
		this.submit = submit;
	}
	@Override
	public String toString() {
		return "ReplyDTO [seq=" + seq + ", no=" + no + ", eval=" + eval + ", ment=" + ment + ", nickname=" + nickname
				+ ", submit=" + submit + "]";
	}


	
	
}
