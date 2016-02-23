package com.hb.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
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

import com.hb.model.BoardDTO;
import com.hb.model.InterfaceDAO;
import com.hb.model.MemberDTO;
import com.hb.model.ReplyDTO;
import com.hb.model.StoreDTO;

@Controller
public class Ccontroller {
	private static final Logger logger = LoggerFactory.getLogger(Ccontroller.class);
	@Autowired
	InterfaceDAO dao;
	
	@RequestMapping("/") // 메인페이지
	public String main() {
		return "index";
	}
	
	@RequestMapping("test") // 맛집리스트(임시)
	public String testnav() {
		return "main";
	}
	
	@RequestMapping("/mobile") // 모바일페이지
 	public String mobile() {
 		return "index";
 	}
	
 	@RequestMapping("/cacao") // 카카오링크
 	public String cacao(String nm, Model model) {
 		List<StoreDTO> list=dao.cacaolink(nm);
 		model.addAttribute("broadcast",list);
 		return "main";
 	}
	
	@RequestMapping(value="addreply", method=RequestMethod.POST)//평점, 댓글달기
	public String addreply(ReplyDTO dto,HttpServletRequest req, HttpServletResponse resp,Model model) throws IOException {
		HttpSession session=req.getSession();
		if(!"".equals(session.getAttribute("nicknm"))) dto.setNickname((String)session.getAttribute("nicknm"));
		int chk=dao.chkreply(dto);//댓글 썼는지 유무 체크
		if(chk>0){//썼을 경우
			return null;
		}
		else {//안썼을 경우
			dao.addreply(dto);
			int cnt=dao.peoplecnt(dto.getNo());
			Double sum=dao.sumeval(dto.getNo());
			Double avg=(double)(sum/cnt);
			avg=((int)(avg*10))/10.0;
			dto.setEval(avg);
			dao.editeval(dto);
			StoreDTO storedto = dao.detail(dto.getNo());
			List<ReplyDTO> list=dao.getreply(dto);
			model.addAttribute("store",storedto);
			model.addAttribute("myno",dto.getNo());
			model.addAttribute("reply",list);
			return "tmp";
		}
	}
	
	@RequestMapping("search")
	public String search(String text,Model model) {
		if("".equals(text)) text="인생맛집";
		List<StoreDTO> list=dao.search(text);
		if(list.size()==0){
			String not="nothing";
			model.addAttribute("nothing",not);
		}
		else{
			model.addAttribute("broadcast",list);
		}
		return "main";
	}
	
	@RequestMapping("notify")//공지사항
	public String gongzy(Model model) {
		List<BoardDTO> list=dao.boardlist();
		model.addAttribute("list",list);
		return "notifyform";
	}
	
	@RequestMapping("addhit")
	public void addhit(BoardDTO dto) {
		dao.addhit(dto);
	}
	
	@RequestMapping(value="addboard", method=RequestMethod.POST)//글쓰기
	public void addboard(BoardDTO dto,HttpServletRequest req, HttpServletResponse resp) throws IOException {
		if(!("".equals(dto.getTitle())||"".equals(dto.getContent()))){
			HttpSession session=req.getSession();
			String nicknm=(String)session.getAttribute("nicknm");
			dto.setNicknm(nicknm);
			dao.addboard(dto);
		}
	}
	
	@RequestMapping(value = "listlink", method = RequestMethod.GET)
	public String listlink(String col, String val, Model model) {
		HashMap<String, String> sch = new HashMap<String, String>();
		sch.put("col", col);
		sch.put("val", val);
		List<StoreDTO> list = dao.listlink(sch);
		model.addAttribute("broadcast", list);
		return "main";
	}

	@RequestMapping("broadcast")
	public String broadcast(Model model) {// 방송맛집
		List<StoreDTO> list = dao.loadstore();
		model.addAttribute("broadcast", list);
		return "main";
	}

	@RequestMapping(value="detail", method=RequestMethod.POST) // 상세페이지
	public String detail(int no, ReplyDTO dto, Model model, HttpServletResponse resp) throws IOException {
		List<ReplyDTO> list=dao.getreply(dto);
		StoreDTO storedto = dao.detail(no);
		model.addAttribute("store",storedto);
		model.addAttribute("myno",dto.getNo());
		model.addAttribute("reply",list);
		return "tmp";
	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	public void join(MemberDTO dto) {// 회원가입
		dao.join(dto);
		
	}

	@RequestMapping(value = "login", method = RequestMethod.POST) // 로그인
	public void login(MemberDTO dto, HttpServletRequest req, HttpServletResponse resp) throws IOException {
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
		return "redirect:/";
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
	public void nicknmchk(HttpServletRequest req, HttpServletResponse resp, String nicknm) throws IOException {
		int chknicknm = dao.nicknmchk(req.getParameter("nickname"));
		if (chknicknm > 0) { //중복체크
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