package com.hb.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class controller {
	
	@RequestMapping("test.go")
	public String testnav() {
		
		return "navbar";
	}
	
	@RequestMapping(value="main.go", method = RequestMethod.POST)//POST∑Œ ≈Î¿œ
	public String index() {
		
		return "";
	}
	
}
