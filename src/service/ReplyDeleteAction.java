package service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReplyDao;

public class ReplyDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		
		try {
			String id = (String)request.getSession().getAttribute("id"); 
			int pid = Integer.parseInt(request.getParameter("pid"));
			int prseq = Integer.parseInt(request.getParameter("prseq"));
			
			//댓글 삭제
			ReplyDao rdao = ReplyDao.getInstance();
			int result = rdao.deleteReply(prseq);
			
			request.setAttribute("id", id);
			request.setAttribute("pid", pid);
			request.setAttribute("result", result);
			request.setAttribute("prseq", prseq);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "replyDeleteAction.jsp";
	}

}
