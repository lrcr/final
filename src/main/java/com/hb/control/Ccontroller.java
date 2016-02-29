package com.hb.control;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hb.model.BoardDTO;
import com.hb.model.InterfaceDAO;
import com.hb.model.MemberDTO;
import com.hb.model.ReplyDTO;
import com.hb.model.ReserveDTO;
import com.hb.model.StoreDTO;

@Controller
public class Ccontroller {
	private static final Logger logger = LoggerFactory.getLogger(Ccontroller.class);
	@Autowired
	InterfaceDAO dao;

	@RequestMapping("/") // ����������
	public String main() {
		return "index";
	}

	@RequestMapping("/mobile") // �����������
	public String mobile() {
		return "index";
	}

	@RequestMapping("/cacao") // īī����ũ
	public String cacao(String nm, Model model) {
		List<StoreDTO> list = dao.cacaolink(nm);
		model.addAttribute("broadcast", list);
		return "main";
	}

	@RequestMapping("recommend")
	public String recommand(Model model) {
		List<BoardDTO> list = dao.reclist();
		model.addAttribute("list", list);
		return "community";
	}

	@RequestMapping(value = "upload", method = RequestMethod.POST) // ������õ�� �Խù� ��ǥ�̹��� ���ε�
	public String community(@RequestParam("imgfile") MultipartFile file, HttpServletRequest req) {
		// 		System.out.println(file.getOriginalFilename());
		if(!("".equals(file.getOriginalFilename())) || file.getOriginalFilename() != null){
			
			String realpath = req.getSession().getServletContext().getRealPath("/");//github local repository�� C>>git���� ��������!
//			String realpath=req.getSession().getServletContext().getRealPath("/resources")+"upload\\";
			System.out.println();
			String fnm = "/resources/upload/"+dao.getmaxno();
			File f = new File(realpath + fnm + ".png");
			try{
				file.transferTo(f);
			}catch(Exception e){
				e.printStackTrace();
			}

		}
		return "redirect:recommend";
	}

	@RequestMapping(value = "saverec", method = RequestMethod.POST) // ��õ�������� �۾���
	public void saverec(BoardDTO dto, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session = req.getSession();
		dto.setNicknm((String) session.getAttribute("nicknm"));
		dao.addrec(dto);
		int fno = dao.getmaxno();
		String fnm = req.getSession().getServletContext().getRealPath("/")+"/resources/recommend/" + fno + ".txt";
//		String fnm=req.getSession().getServletContext().getRealPath("/resources")+"recommend\\"+fno+".txt";
		File file = new File(fnm);
		OutputStream out = new FileOutputStream(file);
		out.write(dto.getContent().getBytes());
		out.close();
		PrintWriter result = resp.getWriter();
		StringBuffer st = new StringBuffer();
		st.append("done");
		result.write(st.toString());
	}

	@RequestMapping("addrechit")
	public void addrechit(BoardDTO dto) {
		dao.addrechit(dto);
	}

	@RequestMapping(value = "getrecdetail", method = RequestMethod.POST)
	public String getrecdetail(int no, Model model,HttpServletRequest req) throws Exception {
		BoardDTO dto = dao.getrecdetail(no);
//		String fnm = req.getSession().getServletContext().getRealPath("/")+"/resources/recommend/" + no + ".txt";
//		FileInputStream fi = new FileInputStream(fnm);
//		InputStreamReader ir = new InputStreamReader(fi, "MS949");
//		String content = "";
//		int i = 0;
//		while((i = ir.read()) != -1){
//			content = content + (char) i;
//		}
//		dto.setContent(content);
		model.addAttribute("recinfo", dto);
		return "sub/community_modal_tmp";
	}

	@RequestMapping(value = "bookmark", method = RequestMethod.POST) // ���ã�� �߰�
	public void bookmark(StoreDTO dto, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		HttpSession session = req.getSession();
		PrintWriter out = resp.getWriter();

		String nickname = (String) session.getAttribute("nicknm");
		if("".equals(nickname) || nickname == null){
			StringBuffer st = new StringBuffer();
			st.append("needlogin");
			out.write(st.toString());
		}else{
			int cntbm = dao.cntbm(dto);
			if(cntbm != 0){
				StringBuffer st = new StringBuffer();
				st.append("no");
				out.write(st.toString());
			}else{
				dto.setNm(nickname);
				dao.addbookmark(dto);
				StringBuffer st = new StringBuffer();
				st.append("ok");
				out.write(st.toString());
			}
		}
	}

	@RequestMapping("bookmarklist") // �ϸ�ũ ����Ʈ
	public String bmlist(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String nickname = (String) session.getAttribute("nicknm");
		List<StoreDTO> list_tmp = dao.getbmlist(nickname);
		List<StoreDTO> result = new ArrayList<StoreDTO>();
		StoreDTO dto;
		int no;
		for(int i = 0; i < list_tmp.size(); i++){
			no = list_tmp.get(i).getNo();
			dto = dao.getListOne(no);
			result.add(dto);
		}
		model.addAttribute("broadcast", result);
		return "main";
	}

	@RequestMapping(value = "addreply", method = RequestMethod.POST) // ����, ��۴ޱ�
	public String addreply(ReplyDTO dto, HttpServletRequest req, HttpServletResponse resp, Model model) throws IOException {
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		if(!"".equals(session.getAttribute("nicknm"))) dto.setNickname((String) session.getAttribute("nicknm"));
		int chk = dao.chkreply(dto);// ��� ����� ���� üũ
		if(chk > 0){// ���� ���
			return null;
		}else{// �Ƚ��� ���
			dao.addreply(dto);
			int cnt = dao.peoplecnt(dto.getNo());
			Double sum = dao.sumeval(dto.getNo());
			Double avg = (double) (sum / cnt);
			avg = ((int) (avg * 10)) / 10.0;
			dto.setEval(avg);
			dao.editeval(dto);
			StoreDTO storedto = dao.detail(dto.getNo());
			List<ReplyDTO> list = dao.getreply(dto);
			model.addAttribute("store", storedto);
			model.addAttribute("myno", dto.getNo());
			model.addAttribute("reply", list);
			return "sub/storedetail_tmp";
		}
	}

	@RequestMapping("search") // �˻����
	public String search(String text, Model model) {
		if("".equals(text)) text = "�λ�����";
		List<StoreDTO> list = dao.search(text);
		if(list.size() == 0){
			String not = "nothing";
			model.addAttribute("nothing", not);
		}else{
			model.addAttribute("broadcast", list);
		}
		return "main";
	}

	@RequestMapping("notify") // ��������
	public String gongzy(Model model) {
		List<BoardDTO> list = dao.boardlist();
		model.addAttribute("list", list);
		return "notifyform";
	}

	@RequestMapping("addhit") // �Խù� ��ȸ�� ����
	public void addhit(BoardDTO dto) {
		dao.addhit(dto);
	}

	@RequestMapping(value = "addboard", method = RequestMethod.POST) // �۾���
	public void addboard(BoardDTO dto, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		if(!("".equals(dto.getTitle()) || dto.getTitle() == null || "".equals(dto.getContent()) || dto.getContent() == null)){
			HttpSession session = req.getSession();
			String nicknm = (String) session.getAttribute("nicknm");
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
	public String broadcast(Model model) {// ��۸���
		List<StoreDTO> list = dao.loadstore();
		model.addAttribute("broadcast", list);
		return "main";
	}

	@RequestMapping(value = "detail", method = RequestMethod.POST) // ������ ��������
	public String detail(int no, ReplyDTO dto, Model model, HttpServletResponse resp) throws IOException {
		List<ReplyDTO> list = dao.getreply(dto);
		StoreDTO storedto = dao.detail(no);
		model.addAttribute("store", storedto);
		model.addAttribute("myno", dto.getNo());
		model.addAttribute("reply", list);
		return "sub/storedetail_tmp";
	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	public void join(MemberDTO dto) {// ȸ������
		dao.join(dto);
	}

	@RequestMapping(value = "login", method = RequestMethod.POST) // �α���
	public void login(MemberDTO dto, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		MemberDTO mdto = dao.login(dto);
		int success = 0;
		if(!("".equals(mdto.getNicknm()))){
			success = 1;
			HttpSession session = req.getSession();
			session.setAttribute("nicknm", mdto.getNicknm());
			session.setAttribute("email", mdto.getEmail());
			PrintWriter out = resp.getWriter();
			StringBuffer st = new StringBuffer();
			st.append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
			st.append("<item>");
			st.append("<login>" + success + "</login>");
			st.append("<nicknm>" + URLEncoder.encode(mdto.getNicknm(), "UTF-8") + "</nicknm>");
			st.append("<email>" + URLEncoder.encode(mdto.getEmail(), "UTF-8") + "</email>");
			st.append("</item>");
			out.write(st.toString());
		}
	}

	@RequestMapping(value = "logout") // �α׾ƿ�
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "emailchk", method = RequestMethod.POST) // �̸��� �ߺ�üũ
	public void emchk(HttpServletRequest req, HttpServletResponse resp, String em) throws IOException {
		int chkem = dao.emailchk(req.getParameter("email"));
		if(chkem > 0){
			PrintWriter out = resp.getWriter();
			StringBuffer st = new StringBuffer();
			st.append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
			st.append("<item>");
			st.append("<success>" + chkem + "</success>");
			st.append("</item>");
			out.write(st.toString());
		}
	}

	@RequestMapping(value = "nicknmchk", method = RequestMethod.POST) // �г��� �ߺ� üũ
	public void nicknmchk(HttpServletRequest req, HttpServletResponse resp, String nicknm) throws IOException {
		int chknicknm = dao.nicknmchk(nicknm);
		if(chknicknm > 0){ // �ߺ�üũ
			PrintWriter out = resp.getWriter();
			StringBuffer st = new StringBuffer();
			st.append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
			st.append("<item>");
			st.append("<success>" + chknicknm + "</success>");
			st.append("</item>");
			out.write(st.toString());
		}
	}

	@RequestMapping(value = "/myInfo", method = RequestMethod.POST) // ���� ����ȣ��
	public String myInfo(Model model, String nicknm) {
		logger.debug("nNm:{}" + nicknm);
		MemberDTO dto = dao.oneMember(nicknm);
		logger.debug("myinfo:{}" + dto);
		model.addAttribute("myinfo", dto);
		return "mypage";
	}

	@RequestMapping(value = "/goUpdate", method = RequestMethod.POST) // ���� ��������
	public String goUpdate(MemberDTO dto, Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.setAttribute("nicknm", dto.getNicknm());
		logger.debug("myinfoup:{}" + dto);
		dao.updateMember(dto);
		return "redirect:/";
	}

	@RequestMapping(value = "/reserve", method = RequestMethod.POST) // ����Ȯ��
	public String reserve(String storeno, String email, String no, Model model) {
		if(no == null) no = "0";
		logger.debug("storeno:{}" + storeno + ",email:{}" + email + ",no:{}" + no);
		int sno = Integer.parseInt(storeno);
		StoreDTO sdto = dao.detail(sno);
		MemberDTO mdto = dao.oneMeEmail(email);
		ReserveDTO rdto = dao.reserveOne(no);
		model.addAttribute("store", sdto);
		model.addAttribute("member", mdto);
		model.addAttribute("reserve", rdto);
		return "reserve";
	}

	@RequestMapping(value = "/reservechk", method = RequestMethod.POST) // ����/�����ϱ�
	public String reservechk(ReserveDTO dto, String reup, Model model) {
		logger.debug("reup:{}" + reup);
		if("chk".equals(reup) || reup == "chk"){
			dao.addReserve(dto);
			logger.debug("�Է¼���:{}");
		}else if("up".equals(reup) || reup == "up"){
			dao.updateReserve(dto);
			logger.debug("dto:{no}" + dto.getNo());
		}else logger.debug("����:{}");
		return "redirect:/reservelist";
	}

	@RequestMapping(value = "/reservelist") // ���� ���ฮ��Ʈ
	public String reservelist(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String semail = (String) session.getAttribute("email");
		List<ReserveDTO> list = dao.reservelist(semail);
		logger.debug("email:{}" + semail);
		if(list.size() == 0){
			return "redirect:/broadcast";
		}
		model.addAttribute("reserve", list);
		return "reservelist";
	}

	@RequestMapping(value = "/detailpage", method = RequestMethod.POST) // ������ ������
	public String detailpage(int storeno, Model model) {
		StoreDTO dto = dao.detail(storeno);
		model.addAttribute("dto", dto);
		return "sub/reservelistover";
	}

	@RequestMapping("admin") //������������
	public String admin() {

		return "admin/admin";
	}

	@RequestMapping("member") //ȸ������������
	public String adminmember(Model model) {
		List<MemberDTO> list = dao.memberlist();
		model.addAttribute("member", list);
		return "admin/member";
	}

	@RequestMapping(value = "modifyuser", method = RequestMethod.POST)
	public String modifyuser(MemberDTO dto) {
		dao.modifyuser(dto);
		return "redirect:member";
	}

	@RequestMapping("store") //���������� ������
	public String store(Model model) {
		List<StoreDTO> list = dao.storelist();
		model.addAttribute("store", list);
		return "admin/store";
	}

	@RequestMapping("board") //�������װ���
	public String board(Model model) {
		List<BoardDTO> list = dao.boardlist();
		model.addAttribute("list", list);

		return "admin/board";
	}
}