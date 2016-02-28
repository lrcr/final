package com.hb.model;

public class ReserveDTO {
	private int no, storeno, inwon;
	private String email, name, nalja, sigan, opinion;

	public int getNo() {
		return no;
	}

	public int getStoreno() {
		return storeno;
	}

	public int getInwon() {
		return inwon;
	}

	public String getEmail() {
		return email;
	}

	public String getName() {
		return name;
	}

	public String getNalja() {
		return nalja;
	}

	public String getSigan() {
		return sigan;
	}

	public String getOpinion() {
		return opinion;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public void setStoreno(int storeno) {
		this.storeno = storeno;
	}

	public void setInwon(int inwon) {
		this.inwon = inwon;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setNalja(String nalja) {
		this.nalja = nalja;
	}

	public void setSigan(String sigan) {
		this.sigan = sigan;
	}

	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}

	@Override
	public String toString() {
		return "ReserveDTO [no=" + no + ", storeno=" + storeno + ", email=" + email + ", name=" + name + ", nalja=" + nalja + ", sigan=" + sigan + ", inwon="
				+ inwon + ", opinion=" + opinion + "]";
	}

}
