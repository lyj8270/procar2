package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import car.dao.BbsDao;

public class BbsManager extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setAttribute("board", BbsDao.allViewBbs());
		request.getRequestDispatcher("board.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		System.out.println(1);
		request.setCharacterEncoding("utf-8");
		String bt = request.getParameter("bbsTitle");
		String bc = request.getParameter("bbsContent");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("logId");
		if(id==null){
			response.sendRedirect("write.jsp");
		} else {
		//현재시간 구하기
		String inDate   = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
		System.out.println(inDate);
		/////////////////////////////////////////////////////////////////////
		BbsDao.addBbs(bt,bc,id,inDate);
		request.setAttribute("board", BbsDao.allViewBbs());
		request.getRequestDispatcher("board.jsp").forward(request, response);
		}
	}
}
