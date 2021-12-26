package service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;

public class IdFindProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			String id;
			request.setCharacterEncoding("utf-8");
			MemberDao md = MemberDao.getInstance();
	        String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			id = md.findMember(name, phone);
			request.setAttribute("id", id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
		return "idFindPro.jsp";

	}

}
