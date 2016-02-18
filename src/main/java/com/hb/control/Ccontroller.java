package com.hb.control;


import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hb.model.DTO;
import com.hb.model.interfaceDAO;


@Controller
public class Ccontroller {
   private static final Logger logger = LoggerFactory.getLogger(Ccontroller.class);
   @Autowired
   interfaceDAO dao;
   
   @RequestMapping("/index")
   public String main() {
      return "index";
   }
   @RequestMapping("test")
   public String testnav() {
      return "main";
   }
   
   @RequestMapping(value="join", method=RequestMethod.POST)
   public void join(DTO dto) {
	   dao.join(dto);
   }
   
   @RequestMapping(value="login", method=RequestMethod.POST)
   public void login(DTO dto, HttpServletRequest req, HttpServletResponse resp) throws IOException {
	   String nicknm=dao.login(dto);
	   int success=0;
	   if(!("".equals(nicknm))){
		success=1;
		HttpSession session=req.getSession();
		session.setAttribute("nicknm", nicknm);
		
		PrintWriter out = resp.getWriter();
		 StringBuffer st = new StringBuffer();
		 st.append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
		 st.append("<item>");
		 st.append("<login>"+success+"</login>");
		 st.append("<nicknm>"+URLEncoder.encode(nicknm , "UTF-8")+"</nicknm>");
		 st.append("</item>");
		 out.write(st.toString());
	   }
	   
   }
   
   @RequestMapping(value="emailchk", method = RequestMethod.POST)
   public void emchk(HttpServletRequest req, HttpServletResponse resp, String em) throws IOException {
      int chkem=dao.emailchk(req.getParameter("email"));
      if(chkem>0){
         PrintWriter out = resp.getWriter();
         StringBuffer st = new StringBuffer();
         st.append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
         st.append("<item>");
         st.append("<success>"+chkem+"</success>");
         st.append("</item>");
         out.write(st.toString());
      }
   }
   
   @RequestMapping(value="nicknmchk", method=RequestMethod.POST)
   public void nicknmchk(HttpServletRequest req, HttpServletResponse resp, String nicknm) throws IOException {
	int chknicknm=dao.nicknmchk(req.getParameter("nickname"));
	if(chknicknm>0){
        PrintWriter out = resp.getWriter();
        StringBuffer st = new StringBuffer();
        st.append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
        st.append("<item>");
        st.append("<success>"+chknicknm+"</success>");
        st.append("</item>");
        out.write(st.toString());
     }
}
   
      
}