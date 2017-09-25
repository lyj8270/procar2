package car.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import car.dto.BbsDto;
import car.util.DBUtil;

public class BbsDao {
	private static String sql;
	
	//게시판 새글 DB에 저장
	public static void addBbs(String bt, String bc, String id, String inDate){
		BbsDto bbs = new BbsDto();
		Connection con = null;
		PreparedStatement pstmt = null;
		sql = "insert into board values (board_seq.nextval,?,?,?,?)";
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bt);
			pstmt.setString(2, bc);
			pstmt.setString(3, inDate);
			pstmt.setString(4, id);
			pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(con, pstmt);
		}
	}
	
	//게시판 목록 가져오기
	public static ArrayList allViewBbs(){
		ArrayList<BbsDto> list = new ArrayList<>();
		BbsDto bbs = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		sql = "select * from board";
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
			list.add(new BbsDto(rs.getInt(1),
			rs.getString(2),
			rs.getString(3),
			rs.getString(4),
			rs.getString(5)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(con, pstmt, rs);
		}
		return list;
	}
}
