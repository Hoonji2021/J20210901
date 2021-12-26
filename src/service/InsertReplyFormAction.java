package service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReplyDao;

public class InsertReplyFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			
			try {
				System.out.println("여기는 InsertReplyFormAction");
				int pid = Integer.parseInt(request.getParameter("pid")); 
				String id = (String)request.getSession().getAttribute("id"); 
				String reply = request.getParameter("reply");
				ReplyDao rdao = ReplyDao.getInstance();
				int result = rdao.insertReply(id,pid,reply);
				
				request.setAttribute("result", result);
				request.setAttribute("pid", pid);
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		return "insertReplyProAction.jsp";
	}

}
