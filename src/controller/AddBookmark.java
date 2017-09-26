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
		
		String sId = (String)request.getParameter("sId");
		
		// 세션 존재 여부
		if(session != null){
			String logId = (String)session.getAttribute("logId");
			
			// 세션 id 확인, 정상 로그인
			if(logId != null){
				
				int overlap = BookmarkDao.removeOverlap(logId, sId);
				
				// 중복값 존재하는지 확인
				if(overlap != 1){
					
					int result = BookmarkDao.insert(logId.trim(), sId.trim());
					response.getWriter().println(result);
					
				} else {
					response.getWriter().println(0);
				}
				
			} else{
				response.getWriter().println(2);
			}
		} else {
			response.getWriter().println(2);
		}
	}
}
