package com.hb.model;

import java.util.HashMap;
import java.util.List;

public interface InterfaceDAO {
	public List<StoreDTO> loadstore();
	public int emailchk(String email);
	public int nicknmchk(String nicknm);
	public void join(MemberDTO dto);
	public MemberDTO login(MemberDTO dto);
	public StoreDTO detail(int no);
	public void addboard(BoardDTO dto);
	public List<BoardDTO> boardlist();
	public List<StoreDTO> listlink(HashMap<String, String> sch);
	public void addhit(BoardDTO dto);
	public List<StoreDTO> search(String text);
	public void addreply(ReplyDTO dto);
	public int peoplecnt(int no);
	public Double sumeval(int no);
	public int chkreply(ReplyDTO dto);
	public void editeval(ReplyDTO dto);
	public List<StoreDTO> cacaolink(String nm);
	public List<ReplyDTO> getreply(ReplyDTO dto);
	public MemberDTO oneMember(String nNm);
	public void updateMember(MemberDTO dto);
	public void addbookmark(StoreDTO dto);
	public int cntbm(StoreDTO dto);
	public List<StoreDTO> getbmlist(String nickname);
	public StoreDTO getListOne(int no);
	public int getmaxno();
	public void addrec(BoardDTO dto);
	public List<BoardDTO> reclist();
	public void addrechit(BoardDTO dto);
	public BoardDTO getrecdetail(int no);
	public List<MemberDTO> memberlist();
	public void modifyuser(MemberDTO dto);
	public List<StoreDTO> storelist();
	public MemberDTO oneMeEmail(String email);
	public void addReserve(ReserveDTO dto);
	public void updateReserve(ReserveDTO dto);
	public List<ReserveDTO> reservelist(String email);
	public ReserveDTO reserveOne(String no);
}
