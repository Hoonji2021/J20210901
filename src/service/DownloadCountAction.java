package service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Active;
import dao.ActiveDao;
import dao.Pic;
import dao.PicDao;
import dao.TagDao;

public class DownloadCountAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int pid = Integer.parseInt(request.getParameter("pid"));
			String id = (String)request.getSession().getAttribute("id"); 
			PicDao pdao = PicDao.getInstance();
			
			//상세페이지 작성자,날짜,설명
			Pic pic = pdao.select(pid); 
			
			//****************다운로드 처리 *********************
			int type = 3; //type은 3(type=3은 다운로드)으로 고정
			ActiveDao ad = ActiveDao.getInstance();
			Active active = ad.select(id,pid,type);

			if(id!=null && active.getType()!=3) {//회원이면서 acttype이 3이 아니면(다운로드한적이 없다면)
				//pdown +1
				int result = pdao.downloadCount(pid); 
			
				//actives 테이블에 type 3번 추가
				ad.activeDownload(id,pid); 
				
				request.setAttribute("pic", pic);
				request.setAttribute("result", result);
				request.setAttribute("pid", pid);
	
			}else if(id!=null && active.getType()==3) {//회원이면서 acttype이 3이면
				//pdown +1 요고만
				int result = pdao.downloadCount(pid); 
				request.setAttribute("pic", pic);
				request.setAttribute("result", result);
				request.setAttribute("pid", pid);
			}
			
			//비회원pdown +1
			if(id==null) {
			int result = pdao.downloadCount(pid); 
			
			request.setAttribute("pic", pic);
			request.setAttribute("result", result);
			request.setAttribute("pid", pid);
			}
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "downloadCountPro.jsp";
	}

}
