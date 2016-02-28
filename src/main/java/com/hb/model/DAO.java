package com.hb.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository(value = "dao")
public class DAO implements InterfaceDAO {

	@Autowired
	SqlSession SqlSession;

	@Override
	public int emailchk(String email) {
		return SqlSession.selectOne("member.selectmail", email);
	}

	@Override
	public int nicknmchk(String nicknm) {
		return SqlSession.selectOne("member.selectnm", nicknm);
	}

	@Override
	public void join(MemberDTO dto) {
		SqlSession.insert("member.join", dto);
	}

	@Override
	public MemberDTO login(MemberDTO dto) {
		return SqlSession.selectOne("member.login", dto);
	}

	@Override
	public List<StoreDTO> loadstore() {
		return SqlSession.selectList("store.broadcast");
	}

	@Override
	public List<StoreDTO> listlink(HashMap<String, String> sch) {
		return SqlSession.selectList("store.listlink", sch);
	}

	@Override
	public StoreDTO detail(int no) {
		return SqlSession.selectOne("store.detail", no);
	}

	@Override
	public void addboard(BoardDTO dto) {
		SqlSession.insert("board.addboard", dto);
	}

	@Override
	public List<BoardDTO> boardlist() {
		return SqlSession.selectList("board.boardlist");
	}

	@Override
	public void addhit(BoardDTO dto) {
		SqlSession.update("board.addhit",dto);
	}

	@Override
	public List<StoreDTO> search(String text) {
		return SqlSession.selectList("store.search",text);
	}

	@Override
	public void addreply(ReplyDTO dto) {
		SqlSession.insert("board.addreply",dto);
	}
	
	@Override
	public int peoplecnt(int no) {
		return SqlSession.selectOne("board.cnt",no);
	}

	@Override
	public Double sumeval(int no) {
		return SqlSession.selectOne("board.sumeval",no);
	}

	@Override
	public int chkreply(ReplyDTO dto) {
		return SqlSession.selectOne("board.chkreply",dto);
	}

	@Override
	public void editeval(ReplyDTO dto) {
		SqlSession.update("store.editeval",dto);
	}

	@Override
	public List<StoreDTO> cacaolink(String nm) {
		return SqlSession.selectList("store.cacaolink",nm);
	}

	@Override
	public List<ReplyDTO> getreply(ReplyDTO dto) {
		return SqlSession.selectList("board.getreply",dto);
	}
	@Override
	public MemberDTO oneMember(String nNm) {
		return SqlSession.selectOne("member.oneMember", nNm);
	}

	@Override
	public void updateMember(MemberDTO dto) {
		SqlSession.update("member.infoUpdate", dto);
	}

	@Override
	public void addbookmark(StoreDTO dto) {
		SqlSession.insert("store.addbookmark", dto);
	}

	@Override
	public int cntbm(StoreDTO dto) {
		return SqlSession.selectOne("store.cntbm", dto);
	}

	@Override
	public List<StoreDTO> getbmlist(String nickname) {
		return SqlSession.selectList("store.getbmlist", nickname);
	}

	@Override
	public StoreDTO getListOne(int no) {
		return SqlSession.selectOne("store.getlistone", no);
	}
	
	@Override
	public MemberDTO oneMeEmail(String email) {
		return SqlSession.selectOne("member.oneMeEmail", email);
	}

	@Override
	public void addReserve(ReserveDTO dto) {
		SqlSession.insert("reserve.addreserve", dto);
		
	}

	@Override
	public void updateReserve(ReserveDTO dto) {
		SqlSession.insert("reserve.updatereserve", dto);
		
	}

	@Override
	public List<ReserveDTO> reservelist(String email) {
		return SqlSession.selectList("reserve.reservelist", email);
	}

	@Override
	public ReserveDTO reserveOne(String no) {
		return SqlSession.selectOne("reserve.reserveone", no);
	}

}