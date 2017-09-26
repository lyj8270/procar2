package car.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import car.dto.BookmarkDto;
import car.dto.StationDto;
import car.util.DBUtil;

public class BookmarkDao {
	
	public static int insert(String id, String sId){
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "insert into bookmark values (bookmark_seq.nextval,?,?)";
		
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, sId);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
		} finally {
			DBUtil.close(con, pstmt);
		}
		return result;
	}
	
	public static List<StationDto> getBookmarkList(String id){
		List<StationDto> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select s.s_id, s.s_name, s.addr, s.type, s.latitude, s.longitude, s.addr_num from station s"
						+" inner join bookmark b on s.s_id = b.s_id"
						+" where b.id=?";
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			rset = pstmt.executeQuery();
			
			while(rset.next()){
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
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return list;
	}
}










