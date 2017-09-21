package car.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import car.dto.AddressDto;
import car.util.DBUtil;

public class AddressDao {
	// 모든 지역 리스트 담기
		public static ArrayList<AddressDto> getAllList() {
			
			ArrayList<AddressDto> list = new ArrayList<>();
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = "select * from address";
			try {
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement(sql);
				rset = pstmt.executeQuery();
				
				while (rset.next()) {
					list.add(new AddressDto(
							rset.getInt(1),
							rset.getString(2)
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
