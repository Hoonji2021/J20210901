package service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;

public class PwFindProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			String passwd;
			System.out.println("PwFindProAction start..");
			request.setCharacterEncoding("utf-8");
			MemberDao md = MemberDao.getInstance();
	        String id = request.getParameter("id");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			passwd = md.findMember(id, phone, email);
			request.setAttribute("passwd", passwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
		return "pwFindPro.jsp";

	}

}
