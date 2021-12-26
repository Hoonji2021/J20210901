package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Pic;
import dao.PicDao;
import dao.TagDao;

public class MyPageLikeAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String id = (String)request.getSession().getAttribute("id");
			
			String myPageNum = request.getParameter("myPageNum");
			if (myPageNum == null || myPageNum.equals(""))
				myPageNum = "1";
			
			int n = 1;
			PicDao picDao = PicDao.getInstance();
			TagDao tagDao = TagDao.getInstance();
			
			List<Pic> list = picDao.myPage(n, id, myPageNum); 
			int totPage = picDao.getTotalMyPage(n, id);
			List<String> tagList = tagDao.selectTag(list);
			
			request.setAttribute("myPageNum", myPageNum);
			
			request.setAttribute("myLikeList", list);
			request.setAttribute("totPage", totPage);
			request.setAttribute("tagList", tagList);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "myPageLike.jsp";
	}

}
