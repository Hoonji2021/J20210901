package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ActiveDao;
import dao.Member;
import dao.MemberDao;
import dao.Pic;
import dao.PicDao;
import dao.Reply;
import dao.ReplyDao;
import dao.TagDao;

public class PicInfoAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int pid=Integer.parseInt(request.getParameter("pid"));
		
		
		try {
			MemberDao md = MemberDao.getInstance();
			
			String id = (String)request.getSession().getAttribute("id"); 
			int state = md.member_state(id); 
			Member member = md.member_select(id);
			
			
			
			//상세페이지 작성자,날짜,설명
			PicDao pdao = PicDao.getInstance();
			Pic pic = pdao.select(pid);
			if(pic.getId().equals(id)) {//회원일때
				state = 1;
			}
			
			//상세페이지 태그
			TagDao tgdao = TagDao.getInstance();
			List<String> list = new ArrayList<String>();
			list = tgdao.select(pid);
			
			String search = list.get(0);
			String searchPageNum = "1";
			List pList = pdao.search(search, searchPageNum,pid); 
			
			//조회수+1
			pdao.pcount(pid); 
			
			//좋아요
			ActiveDao adao = ActiveDao.getInstance();
			int acttype = adao.findlike(pid,id);
			
			//댓글 가져오기
			ReplyDao rdao = ReplyDao.getInstance();
			List<Reply> rlist = rdao.select(pid);
			
			//회원 비밀번호 가져오기
			
			
			
			request.setAttribute("pic", pic);
			request.setAttribute("tag", list);
			request.setAttribute("state", state);
			request.setAttribute("acttype", acttype);
			request.setAttribute("pid", pid);
			request.setAttribute("rlist", rlist);
			request.setAttribute("member", member);
			request.setAttribute("pList", pList);
			request.setAttribute("search", search);
		
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return "picInfo.jsp";
	}

}
