package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import car.dao.BookmarkDao;
import car.dto.StationDto;

public class Bookmark extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
	    response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(session != null){
			String logId = (String)session.getAttribute("logId");
			if(logId != null){
				List<StationDto> list = BookmarkDao.getBookmarkList(logId.trim());
				request.setAttribute("bookmarkList", list);
				request.getRequestDispatcher("bookmark.jsp").forward(request, response);
			} else {
				
				out.println("<script>");
				out.println("alert('로그인 후 이용해주시기 바랍니다');");
				out.println("history.back();");
				out.println("</script>");
				
				session.invalidate();
				session = null;
				//response.sendRedirect("index.jsp");
			}
		} else {
			out.println("<script>");
			out.println("alert('로그인 후 이용해주시기 바랍니다.');");
			out.println("history.back();");
			out.println("</script>");
			
			//response.sendRedirect("index.jsp");
		}
	
	}
}
