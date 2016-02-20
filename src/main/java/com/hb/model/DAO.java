package com.hb.model;

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
	public String login(MemberDTO dto) {
		return SqlSession.selectOne("member.login", dto);
	}

	@Override
	public List<StoreDTO> loadstore() {
		return SqlSession.selectList("store.broadcast");
	}
	@Override
	public List<StoreDTO> listlink(String col,String val) {
		String[] sch = {col,val};
		return SqlSession.selectList("store.listlink", sch);
	}

	@Override
	public StoreDTO detail(int no) {
		return SqlSession.selectOne("store.detail", no);
	}

}