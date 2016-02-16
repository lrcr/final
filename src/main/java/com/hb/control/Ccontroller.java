package com.hb.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Ccontroller {
	
	@RequestMapping("test.go")
	public String testnav() {
		
		return "navbar";
	}
	
	@RequestMapping(value="main.go")
	public String index() {
		
		return "";
	}
	
}
