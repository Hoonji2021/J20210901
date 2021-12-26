package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Pic;
import dao.PicDao;
import dao.Tag;
import dao.TagDao;

public class PicUpdatePro implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			
			
			try {
				request.setCharacterEncoding("utf-8");
				String id = request.getParameter("id");
				int pid = Integer.parseInt(request.getParameter("pid"));
				String pcomment = request.getParameter("pcomment");
				String tag = request.getParameter("tag");
				System.out.println("picUpdatePro.java id->"+id);
				System.out.println("picUpdatePro.java pid->"+pid);
				TagToken tt = new TagToken();
				List<String> tagToken = tt.split(tag);
				Iterator iter = tagToken.iterator();
				TagDao tagdao = TagDao.getInstance();
				Tag tg = new Tag();
				int i = 1;
				int result2 = 0;
				
				//pcomment 수정
				Pic pic = new Pic();
				pic.setPcomment(pcomment);
				PicDao pdao = PicDao.getInstance();
				int result = pdao.pcommentUpdate(pic,id,pid);
				tagdao.deleteTag(pid);
				//tag 수정
				if(pid>0) {
			         while(iter.hasNext()) {
			            
			            try {
			               tg.setPid(pid);
			               tg.setPseq(i++);
			               tg.setTag((String)iter.next());
			               result2 = tagdao.insertTag(tg);
			            } catch (SQLException e) {
			               // TODO Auto-generated catch block
			               e.printStackTrace();
			            }
			         }
				}
				
//				Tag tags = new Tag();
//				tags.setTag(tag);
//				TagDao tdao = TagDao.getInstance();
//				
//				int result2 = tdao.tagUpdate(tags,pid);
				
				request.setAttribute("id", id);
				request.setAttribute("pid", pid);
				request.setAttribute("result", result);
				request.setAttribute("result2", result2); 
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
//			List<String> taglist = pdao.
			
		
		return "picUpdatePro.jsp";
	}

}
