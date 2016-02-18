package com.hb.model;

import java.util.List;

public interface interfaceDAO {
	public List<storeDTO> loadstore();
	public int emailchk(String email);
	public int nicknmchk(String nicknm);
	public void join(memberDTO dto);
	public String login(memberDTO dto); 
}
