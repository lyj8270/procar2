package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import car.dao.MemberDao;

public class LoginCheck extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("Password");
		int result = MemberDao.loginCheck(id,pw);
		System.out.println(result);
		HttpSession session = request.getSession();
		if(result!=0){
			session.setAttribute("logId", id);
			response.sendRedirect("index.jsp");
		} else {
			response.sendRedirect("error.jsp");
		}
	}

}
