package com.hb.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hb.model.interfaceDAO;
import com.hb.model.memberDTO;
import com.hb.model.storeDTO;

@Controller
public class Ccontroller {
	private static final Logger logger = LoggerFactory.getLogger(Ccontroller.class);
	@Autowired
	interfaceDAO dao;
	
	@RequestMapping("eval")
	public String eval() {
		
		return "eval";
	}
	@RequestMapping("index") // 메인페이지
	public String main() {
		return "index";
	}

	@RequestMapping("test") // 맛집리스트(임시)
	public String testnav() {
		return "main";
	}

	@RequestMapping("broadcast")
	public String broadcast(Model model) {// 방송맛집
		List<storeDTO> list = dao.loadstore();
		model.addAttribute("broadcast", list);

		return "main";
	}

	@RequestMapping("detail") // 상세페이지
	public void detail(int no) {
		System.out.println(no);
		storeDTO dto = dao.detail(no);
		
	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	public void join(memberDTO dto) {// 회원가입
		dao.join(dto);
	}

	@RequestMapping(value = "login", method = RequestMethod.POST) // 로그인
	public void login(memberDTO dto, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String nicknm = dao.login(dto);
		int success = 0;
		if (!("".equals(nicknm))) {
			success = 1;
			HttpSession session = req.getSession();
			session.setAttribute("nicknm", nicknm);
			PrintWriter out = resp.getWriter();
			StringBuffer st = new StringBuffer();
			st.append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
			st.append("<item>");
			st.append("<login>" + success + "</login>");
			st.append("<nicknm>" + URLEncoder.encode(nicknm, "UTF-8") + "</nicknm>");
			st.append("</item>");
			out.write(st.toString());
		}
	}

	@RequestMapping(value = "logout") // 로그아웃
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "index";
	}

	@RequestMapping(value = "emailchk", method = RequestMethod.POST) // 이메일 중복체크
	public void emchk(HttpServletRequest req, HttpServletResponse resp, String em) throws IOException {
		int chkem = dao.emailchk(req.getParameter("email"));
		if (chkem > 0) {
			PrintWriter out = resp.getWriter();
			StringBuffer st = new StringBuffer();
			st.append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
			st.append("<item>");
			st.append("<success>" + chkem + "</success>");
			st.append("</item>");
			out.write(st.toString());
		}
	}

	@RequestMapping(value = "nicknmchk", method = RequestMethod.POST) // 닉네임
																		// 중복체크
	public void nicknmchk(HttpServletRequest req, HttpServletResponse resp, String nicknm) throws IOException {
		int chknicknm = dao.nicknmchk(req.getParameter("nickname"));
		if (chknicknm > 0) {
			PrintWriter out = resp.getWriter();
			StringBuffer st = new StringBuffer();
			st.append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
			st.append("<item>");
			st.append("<success>" + chknicknm + "</success>");
			st.append("</item>");
			out.write(st.toString());
		}
	}

}