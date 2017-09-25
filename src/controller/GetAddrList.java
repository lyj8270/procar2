package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import car.dao.AddressDao;
import car.dto.AddressDto;

public class GetAddrList extends HttpServlet {
	

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(1);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/x-json; charset=UTF-8");
		String command = request.getParameter("command").trim();

		StringBuilder sb = null;
		
		System.out.println(command);
		switch (command) {
		case "addr":
			sb = new StringBuilder();
			List<AddressDto> addrList = AddressDao.getAllList();
			System.out.println(addrList);
			System.out.println(addrList.size());
			sb.append("[");
			for (int i = 0; i < addrList.size() ; i++) {
				
				
				sb.append("{\"addrNum\":\"");
				sb.append(String.valueOf(addrList.get(i).getAddrNum()));
				System.out.println(addrList.get(i).getAddrNum());
				
				sb.append("\",\"addrName\":\"");
				sb.append(addrList.get(i).getAddrName());
				System.out.println(addrList.get(i).getAddrName());
				
				if (i == addrList.size() - 1) {
					sb.append("}]");
				} else {
					sb.append("\"},");
				}
			}
			break;
		}
		PrintWriter out = response.getWriter();
		out.println(sb.toString());
	}
}





