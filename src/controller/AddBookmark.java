package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import car.dao.BookmarkDao;


public class AddBookmark extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		String id = (String)session.getAttribute("logId");
		String sId = (String)request.getParameter("sId");
		
		
		int result = BookmarkDao.insert(id.trim(), sId.trim());
		System.out.println(result);
		response.getWriter().println(result);
	}
}
