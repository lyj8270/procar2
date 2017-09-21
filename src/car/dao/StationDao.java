package car.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import car.dto.StationDto;
import car.util.DBUtil;

public class StationDao {
	public static String sql;

	// 모든 충전소 리스트 담기
	public static ArrayList<StationDto> getAllList() {
		
		ArrayList<StationDto> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from station";
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				list.add(new StationDto(
						rset.getInt(1),
						rset.getString(2),
						rset.getString(3),
						rset.getString(4),
						rset.getString(5),
						rset.getString(6),
						rset.getInt(7)
				));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return list;
	}
	
	// sId(s_id)로 충전소 찾기, 1개 반환
	public static ArrayList<StationDto> getIdList(int sId) {
		
		ArrayList<StationDto> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from station where s_id=?";
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sId);
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				list.add(new StationDto(
						rset.getInt(1),
						rset.getString(2),
						rset.getString(3),
						rset.getString(4),
						rset.getString(5),
						rset.getString(6),
						rset.getInt(7)
				));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return list;
	}
	
	// addrNum(addr_num)으로 충전소 찾기 - 지역별
	public static ArrayList<StationDto> getAddrList(int addrNum) {
		
		ArrayList<StationDto> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from station where addr_num=?";
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, addrNum);
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				list.add(new StationDto(
						rset.getInt(1),
						rset.getString(2),
						rset.getString(3),
						rset.getString(4),
						rset.getString(5),
						rset.getString(6),
						rset.getInt(7)
				));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return list;
	}
	
	
	
}
