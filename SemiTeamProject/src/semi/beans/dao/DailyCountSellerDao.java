package semi.beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import semi.beans.dto.DailyCountSellerDto;

public class DailyCountSellerDao {
	private static DataSource src;

	static {
		try {
			Context ctx = new InitialContext();// 탐색파일
			Context env = (Context) ctx.lookup("java:/comp/env");
			src = (DataSource) env.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 연결메소드
	public Connection getConnection() throws Exception {
//		Class.forName("oracle.jdbc.OracleDriver");
//		return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","c##kh","c##kh");
		return src.getConnection();
	}
	
	// 일반조회
	public List<DailyCountSellerDto> getList() throws Exception {
		Connection con = getConnection();
		
		String sql = "SELECT * FROM daily_count_seller";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<DailyCountSellerDto> listS = new ArrayList<>();
		while(rs.next()) {
			DailyCountSellerDto dcsdto = new DailyCountSellerDto(rs);
			listS.add(dcsdto);
		}
		con.close();
		return listS;
	}
	
	// 기간조회
	public List<DailyCountSellerDto> getList(String start, String finish) throws Exception {
		Connection con = getConnection();
		
		String sql = "SELECT * FROM daily_count_seller "
							+ "WHERE to_date(day, 'YYYY-MM-DD') "
							+ "between to_date(?, 'YYYY-MM-DD') and to_date(day, 'YYYY-MM-DD')";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, start);
		ps.setString(2, finish);
		ResultSet rs = ps.executeQuery();
		
		List<DailyCountSellerDto> listS = new ArrayList<>();
		while(rs.next()) {
			DailyCountSellerDto dcsdto = new DailyCountSellerDto(rs);
			listS.add(dcsdto);
		}
		con.close();
		return listS;
	}
}
