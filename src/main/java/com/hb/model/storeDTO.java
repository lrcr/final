package com.hb.model;

public class storeDTO {
	String nm, addr, tel, info, site, keyword, tm, reserve, delivery, tv, link, loc;
	int no;
	double eval;
	
	public String getNm() {
		return nm;
	}
	public String getAddr() {
		return addr;
	}
	public String getTel() {
		return tel;
	}
	public String getInfo() {
		return info;
	}
	public String getSite() {
		return site;
	}
	public String getKeyword() {
		return keyword;
	}
	public String getTm() {
		return tm;
	}
	public String getReserve() {
		return reserve;
	}
	public String getDelivery() {
		return delivery;
	}
	public String getTv() {
		return tv;
	}
	public String getLink() {
		return link;
	}
	public String getLoc() {
		return loc;
	}
	public int getNo() {
		return no;
	}
	public double getEval() {
		return eval;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public void setSite(String site) {
		this.site = site;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public void setTm(String tm) {
		this.tm = tm;
	}
	public void setReserve(String reserve) {
		this.reserve = reserve;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	public void setTv(String tv) {
		this.tv = tv;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public void setEval(double eval) {
		this.eval = eval;
	}
	
	@Override
	public String toString() {
		return "storeDTO [no=" + no + ", nm=" + nm + ", addr=" + addr + ", tel=" + tel + ", info=" + info + ", site="
				+ site + ", keyword=" + keyword + ", tm=" + tm + ", reserve=" + reserve + ", delivery=" + delivery
				+ ", tv=" + tv + ", link=" + link + ", loc=" + loc + ", eval=" + eval + "]";
	}

}
