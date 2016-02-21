package com.hb.model;

import java.util.Date;

public class BoardDTO {
	int no, hits, rownum;
	String title, nicknm,content;
	Date submit;
	
	
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public int getNo() {
		return no;
	}
	public int getHits() {
		return hits;
	}
	public String getTitle() {
		return title;
	}
	public String getNicknm() {
		return nicknm;
	}
	public Date getSubmit() {
		return submit;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setNicknm(String nicknm) {
		this.nicknm = nicknm;
	}
	public void setSubmit(Date submit) {
		this.submit = submit;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Override
	public String toString() {
		return "boardDTO [no=" + no + ", rownum=" + rownum + ", title=" + title + ", content=" + content + ", nicknm="
				+ nicknm + ", submit=" + submit + ", hits=" + hits + "]";
	}

	
	

}
