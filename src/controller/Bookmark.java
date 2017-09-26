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
import car.dao.StationDao;
import car.dto.StationDto;

public class Bookmark extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(123);
		HttpSession session = request.getSession(false);
		
	    response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		if(session != null){
			String logId = (String)session.getAttribute("logId");
			if(logId != null){
				StringBuilder sb = new StringBuilder();
				List<StationDto> stationList = BookmarkDao.getBookmarkList(logId);
				
				sb.append("[");
				for (int i = 0; i < stationList.size(); i++) {

					sb.append("{\"sId\":\"");
					sb.append(String.valueOf(stationList.get(i).getsId()));

					sb.append("\",\"sName\":\"");
					sb.append(stationList.get(i).getsName());
					
					sb.append("\",\"addr\":\"");
					sb.append(stationList.get(i).getAddr());
					
					sb.append("\",\"type\":\"");
					sb.append(stationList.get(i).getType());
					
					sb.append("\",\"latitude\":\"");
					sb.append(stationList.get(i).getLatitude());
					
					sb.append("\",\"longitude\":\"");
					sb.append(stationList.get(i).getLongitude());

					if (i == stationList.size() - 1) {
						sb.append("\"}]");
					} else {
						sb.append("\"},");
					}
				}
				request.setAttribute("bookmarkJson", sb.toString());
				request.setAttribute("bookmarkList", stationList);
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
