package service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.ActiveDao;
import dao.PicDao;


public class LikeAction implements CommandProcess {


	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		int pid = Integer.parseInt(request.getParameter("pid"));
		String id = request.getParameter("id");
		int acttype = Integer.parseInt(request.getParameter("acttype"));
		int adlike=0;
		int rmlike=0;
		int likeCnt = 0;
		int intype=0;
		int detype=0;
		
		//System.out.println("LikeAction pid->"+pid);
		//System.out.println("LikeAction id->"+id);
		//System.out.println("LikeAction acttype->"+acttype);
		
		PicDao pdao = PicDao.getInstance();
		ActiveDao adao = ActiveDao.getInstance();
		JSONObject jsonObj = new JSONObject();
		
		if(acttype==0) {//좋아요 최초 클릭
			try {
				adlike = pdao.addlike(pid); // pictures plike+1
				likeCnt = pdao.findLikeCnt(pid);
				jsonObj.put("likeCnt", likeCnt);
				adao.inserttype(pid,id); 
			} catch (SQLException e) {
			// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else if(acttype==1) {//이미 클릭 상태에서 또누름(취소)
			try {
				rmlike = pdao.remlike(pid);// pictures plike-1
				likeCnt = pdao.findLikeCnt(pid);
				jsonObj.put("likeCnt", likeCnt);
				adao.deletetype(pid,id);
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}
		
		request.setAttribute("adlike", adlike);
		request.setAttribute("rmlike", rmlike);
		
		request.setAttribute("id", id);
		request.setAttribute("pid", pid);
		
		String json = jsonObj.toJSONString();
		pw.write(json);
		pw.flush();
		System.out.println("zzzzz");
		
		
		return "ajax";
	}

}
