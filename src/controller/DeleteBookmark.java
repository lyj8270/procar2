package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import car.dao.BookmarkDao;
import car.dto.StationDto;

public class DeleteBookmark extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		response.setContentType("text/html; charset=UTF-8");
		
		if(session != null){
			String logId = (String)session.getAttribute("logId");
			
			if(logId != null){
				String sId = request.getParameter("sId").trim();
				int result = BookmarkDao.delete(logId, sId);
				
				if(result != 0){
					List<StationDto> list = BookmarkDao.getBookmarkList(logId);
					StringBuilder sb = new StringBuilder();
					
					sb.append("[");
					for (int i = 0; i < list.size(); i++) {

						sb.append("{\"sId\":\"");
						sb.append(String.valueOf(list.get(i).getsId()));

						sb.append("\",\"sName\":\"");
						sb.append(list.get(i).getsName());
						
						sb.append("\",\"addr\":\"");
						sb.append(list.get(i).getAddr());
						
						sb.append("\",\"type\":\"");
						sb.append(list.get(i).getType());
						
						sb.append("\",\"latitude\":\"");
						sb.append(list.get(i).getLatitude());
						
						sb.append("\",\"longitude\":\"");
						sb.append(list.get(i).getLongitude());

						if (i == list.size() - 1) {
							sb.append("\"}]");
						} else {
							sb.append("\"},");
						}
					}
					response.getWriter().print(sb.toString());
				} else {
					response.getWriter().println("<script>");
					response.getWriter().println("alert('로그인 후 이용해주시기 바랍니다');");
					response.getWriter().println("history.back();");
					response.getWriter().println("</script>");
				}
			}
		}
	}
}
