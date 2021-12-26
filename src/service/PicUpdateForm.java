package service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Pic;
import dao.PicDao;

public class PicUpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			
			
			try {
				String id = request.getParameter("id");
				int pid = Integer.parseInt(request.getParameter("pid"));
				System.out.println("PicUpdateForm.java id ->"+id);
				System.out.println("PicUpdateForm.java pid ->"+pid);
				
				PicDao pdao = PicDao.getInstance();
				Pic pic = pdao.select(pid);
				
//				MemberDao mdao = MemberDao.getInstance();
//				Member member = mdao.select(id);
				
				
				request.setAttribute("id", id);
				request.setAttribute("pid", pid);
				request.setAttribute("pic", pic);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		
		return "picUpdateForm.jsp";
	}

}
