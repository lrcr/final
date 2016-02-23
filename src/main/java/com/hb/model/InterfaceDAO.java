package com.hb.model;

import java.util.HashMap;
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
	public List<StoreDTO> listlink(HashMap<String, String> sch);
	public void addhit(BoardDTO dto);
	public List<StoreDTO> search(String text);
	public void addreply(ReplyDTO dto);
	public int peoplecnt(int no);
	public Double sumeval(int no);
	public int chkreply(String nickname);
	public void editeval(ReplyDTO dto);
	public List<StoreDTO> cacaolink(String nm);
	public List<ReplyDTO> getreply(ReplyDTO dto);
	
}
