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

public class ReplyUpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
				System.out.println("여기는 replyUpdateForm.do");
			
			try {
				String id = (String)request.getSession().getAttribute("id");
				System.out.println("reply update id ->"+id);
				int pid = Integer.parseInt(request.getParameter("pid"));
				System.out.println("reply update pid ->"+pid);
				int prseq = Integer.parseInt(request.getParameter("prseq"));
				System.out.println("reply update prseq ->"+prseq);
				
				MemberDao md = MemberDao.getInstance();
				int state = md.member_state(id); 
				
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
				
				//조회수+1
				pdao.pcount(pid); 
				
				//좋아요
				ActiveDao adao = ActiveDao.getInstance();
				int acttype = adao.findlike(pid,id);
				
				//수정할 댓글 가져오기
				ReplyDao rdao = ReplyDao.getInstance();
				Reply reply = rdao.selectReply(prseq,id);
				
				//댓글 리스트 가져오기
				List<Reply> rlist = rdao.select(pid);
				
				//비밀번호 가져오기
				Member member = md.member_select(id);
				
				request.setAttribute("acttype", acttype); // 좋아요 활동
				request.setAttribute("tag", list); // 태그 리스트..
				request.setAttribute("state", state); 
				request.setAttribute("pic", pic); // 상세페이지 정보들
				request.setAttribute("pid", pid); 
				request.setAttribute("reply", reply); // 해당 댓글에 대한 정보들
				request.setAttribute("rlist",rlist); // 출력할 댓글 리스트
				request.setAttribute("member", member); // 비밀번호만 뽑아내서 사용할 것임.
				
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}

		return "replyUpdateForm.jsp";
	}

}
