package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Member;
import dao.MemberDao;

public class InfoFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			
			String id = (String)request.getSession().getAttribute("id");
			
			MemberDao md = MemberDao.getInstance();
			Member member = md.member_select(id);  
			
			request.setAttribute("member", member);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "infoForm.jsp";
	}

}
