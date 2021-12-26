package service;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.Active;
import dao.ActiveDao;
import dao.Pic;
import dao.PicDao;
import dao.Tag;
import dao.TagDao;

public class UploadProAction implements CommandProcess {

	public UploadProAction() {}
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String upLoadFilename = "";
		String filename = "";
		
		request.setCharacterEncoding("utf-8");
		int maxSize = 5 * 1024 * 1024;
//		String img = "img";
		String realPath = request.getServletContext().getRealPath("img");
		MultipartRequest multi = new MultipartRequest(request,realPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
		Enumeration en = multi.getFileNames();
		while (en.hasMoreElements()) {
			String filename1 = (String) en.nextElement();
			filename = multi.getFilesystemName(filename1);
			String original = multi.getOriginalFileName(filename1);
			String type = multi.getContentType(filename1);
			
			if(filename!=null && !"".equals(filename)) {	
				int idx = realPath.lastIndexOf("\\");
				if(idx!=-1) {
					realPath = realPath.substring(idx+1, realPath.length());
					upLoadFilename = realPath + "/" + filename;
				}else {
					
					request.setAttribute("result", -1);
					return "uploadPro.jsp";
				}
			}
		}
		
		String tag = multi.getParameter("tag");
		String story = multi.getParameter("story");
		System.out.println(tag);
		TagToken tt = new TagToken();
		List<String> tagToken = tt.split(tag);
		System.out.println("이거들어오면 거의 겜 끝->"+tagToken);
		Iterator iter = tagToken.iterator();
		
		
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		Pic picVO = new Pic();
		picVO.setId(id);
		picVO.setPcomment(story);
		picVO.setPsave(upLoadFilename);
		
		Tag tg = new Tag();
		TagDao tagdao = TagDao.getInstance();
		
		
		PicDao picDao = PicDao.getInstance(); 
		int pid = picDao.insertPictures(picVO);
		Active active = new Active();
		ActiveDao activedao = ActiveDao.getInstance();
		
		int i = 1;
		int result = 0;
		if(pid>0) {
			while(iter.hasNext()) {
				
				try {
					tg.setPid(pid);
					tg.setPseq(i++);
					tg.setTag((String)iter.next());
					result = tagdao.insertTag(tg);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			active.setId((String)request.getSession().getAttribute("id"));
			active.setPid(pid);
			active.setType(2);
		}
		
		
		
		try {
			
			if(result>0) {
				result = activedao.insertActive(active);
			}
			request.setAttribute("result", result);
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		return "uploadPro.jsp";
	}

}
