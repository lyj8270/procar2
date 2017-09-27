package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import car.dao.StationDao;
import car.dto.StationDto;

public class GetAddrStationList extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		int addrNum = Integer.parseInt(request.getParameter("addr").trim());

		StringBuilder sb = new StringBuilder();
		List<StationDto> stationList = StationDao.getAddrList(addrNum);
		
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
		response.getWriter().println(sb.toString());
	}
}
