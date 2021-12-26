package service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ActiveDao;
import dao.PicDao;
import dao.TagDao;

public class DeletePicPro implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		
		
		try {
			request.setCharacterEncoding("utf-8");
			String id = request.getParameter("id");
			int pid = Integer.parseInt(request.getParameter("pid"));
			
			
			//actives테이블에서 id,pid,사용 -> 삭제됨
			ActiveDao adao = ActiveDao.getInstance();
			int Aresult = adao.deleteUtype(pid, id);  
			
			//tags 테이블에서 삭제 pid사용 ->삭제 됨
			TagDao tdao = TagDao.getInstance();
			int Tresult = tdao.deleteTag(pid);   
			
			//pictures테이블 에서 삭제 pid 사용
			PicDao pdao = PicDao.getInstance();
			int Presult = pdao.delete(pid);

			request.setAttribute("Presult", Presult);
			request.setAttribute("Tresult", Tresult);
			request.setAttribute("Aresult", Aresult);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return "deletePicPro.jsp";
	}

}
