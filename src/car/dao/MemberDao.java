package car.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import car.util.DBUtil;

public class MemberDao {
	static String sql;
	
	public static int loginCheck(String id,String pw){
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		sql = "select * from member where id=? and pw=?";
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(con, pstmt);
		}
		return result;
	}
}

