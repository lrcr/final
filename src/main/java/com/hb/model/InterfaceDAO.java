package com.hb.model;

import java.util.List;

public interface InterfaceDAO {
	public List<StoreDTO> loadstore();
	public int emailchk(String email);
	public int nicknmchk(String nicknm);
	public void join(MemberDTO dto);
	public String login(MemberDTO dto);
	public StoreDTO detail(int no);
	public void addboard(BoardDTO dto);
	public List<BoardDTO> boardlist();
	public List<StoreDTO> listlink(String loc, String val);
}
