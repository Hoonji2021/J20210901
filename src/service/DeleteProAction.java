package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Member;
import dao.MemberDao;

public class DeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		try {
			
			
			String id = (String)request.getSession().getAttribute("id");
			String passwd = request.getParameter("passwd");
			MemberDao md = MemberDao.getInstance();
			Member member = md.member_select(id);
			int result = md.deletemember(id,passwd);    
			request.setAttribute("result", result);
			request.setAttribute("member", member);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "deletePro.jsp";
		
	}

}
