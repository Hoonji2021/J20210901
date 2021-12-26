package service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;

public class LoginProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("id");
		//System.out.println("id->"+id);
		String passwd = request.getParameter("passwd");
		//System.out.println("passwd->"+passwd);
		MemberDao md = MemberDao.getInstance();
		
		//id와 pw가 맞으면 리턴 1,
		//id는 맞고 pw가 틀리면 리턴 0,
		//id가 틀리면 리턴 -1
		try {
			int result = md.memberCheck(id, passwd);   
			//System.out.println("result->"+result);
			request.setAttribute("result", result);
			if(result == 1 || result ==3) {
				HttpSession session = request.getSession();
				session.setAttribute("id", id);	
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
		
		
		return "loginPro.jsp";
	}

}
