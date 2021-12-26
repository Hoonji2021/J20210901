package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Pic;
import dao.PicDao;
import dao.TagDao;

public class IndexAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PicDao picDao = PicDao.getInstance();
		List<Pic> list = picDao.search(); 
		TagDao tagDao = TagDao.getInstance();
		try {
			List<String> tagList = tagDao.selectTag(list);
			
			request.setAttribute("picList", list);
			request.setAttribute("tagList", tagList);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		
		return "index.jsp";
	}
}