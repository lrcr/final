package com.hb.model;

import java.util.List;

public interface interfaceDAO {
	public List<DTO> selectAll();
	public int emailchk(String email);
	public int nicknmchk(String nicknm);
	public void join(DTO dto);
	public List<DTO> login(DTO dto); 
}
