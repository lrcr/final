package com.hb.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class controller {
	
	@RequestMapping(value="main.go", method = RequestMethod.POST)//POST�� ����
	public String index() {
		
		return "";
	}
}
