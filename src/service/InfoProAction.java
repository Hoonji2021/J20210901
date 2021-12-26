package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Member;
import dao.MemberDao;

public class InfoProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			request.setCharacterEncoding("utf-8");
			
			MemberDao md = MemberDao.getInstance();
			Member member = new Member();
			
			member.setId(request.getParameter("id"));
			member.setPasswd(request.getParameter("passwd"));
			member.setName(request.getParameter("name"));
			member.setPhone(request.getParameter("phone"));
			member.setEmail(request.getParameter("email"));
			member.setNickname(request.getParameter("nickname"));
			
			int result = md.updateInfo(member); 
			
			request.setAttribute("result", result);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "infoPro.jsp";
	}

}
