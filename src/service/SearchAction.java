package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Pic;
import dao.PicDao;

public class SearchAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	      PicDao pd = PicDao.getInstance();
	      String searchPageNum = request.getParameter("searchPageNum");
	      if (searchPageNum == null || searchPageNum.equals(""))
	         searchPageNum = "1";
	      //by 지훈, picInfo.jsp에서 날아온 해당 태그
	      String search = request.getParameter("search"); 
	      //by 지훈, 공백 없애기
	      search = search.replace(" ",""); 
	      
	      List<Pic> list = pd.search(search, searchPageNum,0);  
	      int totPage = pd.getTotalPage(search); 


	      
	      request.setAttribute("searchPageNum", searchPageNum);
	      request.setAttribute("search", search);
	      request.setAttribute("picList", list);
	      request.setAttribute("totPage", totPage);

	      return "main.jsp";
	}
}