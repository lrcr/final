package com.hb.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository(value="dao")
public class DAO implements interfaceDAO {

   @Autowired
   SqlSession SqlSession;
   
   @Override
   public List<DTO> selectAll() {
      
      
      return null;
   }

   @Override
   public int emailchk(String email) {
      return SqlSession.selectOne("member.selectmail",email);
   }

@Override
public int nicknmchk(String nicknm) {
	return SqlSession.selectOne("member.selectnm",nicknm);
}

@Override
public void join(DTO dto) {
	SqlSession.insert("member.join",dto);
	
}

@Override
public String login(DTO dto) {
	return SqlSession.selectOne("member.login",dto);
}



}