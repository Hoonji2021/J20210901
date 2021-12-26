package service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Reply;
import dao.ReplyDao;

public class ReplyUpdatePro implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("여기는 ReplyUpdatePro");
		
		try {
			String id = request.getParameter("id");
			int pid = Integer.parseInt(request.getParameter("pid"));
			int prseq = Integer.parseInt(request.getParameter("prseq"));
			String reply = request.getParameter("reply");
			
			//수정한 댓글로 update
			ReplyDao rdao = ReplyDao.getInstance();
			int result = rdao.updateReply(reply,prseq); // 성공 시 1리턴
			
			request.setAttribute("id", id);
			request.setAttribute("pid", pid);
			request.setAttribute("result", result);
			request.setAttribute("prseq", prseq);
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return "replyUpdatePro.jsp";
	}

}
