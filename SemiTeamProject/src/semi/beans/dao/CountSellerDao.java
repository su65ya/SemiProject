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
import semi.beans.dto.MonthlyCountSellerDto;

public class CountSellerDao {
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
	
	// 판매자 데일리 일반조회
	public List<DailyCountSellerDto> getList_DCS() throws Exception {
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
	
	// 판매자 먼슬리 일반조회
	public List<MonthlyCountSellerDto> getList_MCS() throws Exception {
		Connection con = getConnection();
		
		String sql = "SELECT * FROM monthly_count_seller";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<MonthlyCountSellerDto> listS = new ArrayList<>();
		while(rs.next()) {
			MonthlyCountSellerDto mcsdto = new MonthlyCountSellerDto(rs);
			listS.add(mcsdto);
		}
		con.close();
		return listS;
	}
	
	// 판매자 데일리 가입 조회
	public List<DailyCountSellerDto> getList_dailySellerCount(String start, String finish) throws Exception {
		Connection con = getConnection();
		
		String sql = "SELECT * FROM daily_count_seller "
							+ "WHERE to_date(day, 'YYYY-MM-DD') "
							+ "between to_date(?, 'YYYY-MM-DD') and to_date(day, 'YYYY-MM-DD')";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, start);
		ps.setString(2, finish);
		ResultSet rs = ps.executeQuery();
		
		List<DailyCountSellerDto> list_dailySellerCount = new ArrayList<>();
		while(rs.next()) {
			DailyCountSellerDto dcsdto = new DailyCountSellerDto(rs);
			list_dailySellerCount.add(dcsdto);
		}
		con.close();
		return list_dailySellerCount;
	}
	
	// 판매자 먼슬리 가입 조회
	public List<MonthlyCountSellerDto> getList_monthlysellerCount(String start, String finish) throws Exception {
		Connection con = getConnection();
		
		String sql = "SELECT * FROM monthly_count_seller "
							+ "WHERE to_date(day, 'YYYY-MM') "
							+ "between to_date(?, 'YYYY-MM') and to_date(day, 'YYYY-MM')";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, start);
		ps.setString(2, finish);
		ResultSet rs = ps.executeQuery();
		
		List<MonthlyCountSellerDto> list_monthlySellerCount = new ArrayList<>();
		while(rs.next()) {
			MonthlyCountSellerDto mcsdto = new MonthlyCountSellerDto(rs);
			list_monthlySellerCount.add(mcsdto);
		}
		con.close();
		return list_monthlySellerCount;
	}
}
