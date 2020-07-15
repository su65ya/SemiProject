package semi.beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import semi.beans.dto.DailyCountMemberDto;

public class DailyCountMemberDao {
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
	public List<DailyCountMemberDto> getList() throws Exception {
		Connection con = getConnection();
		
		String sql = "SELECT * FROM daily_count_member";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<DailyCountMemberDto> listM = new ArrayList<>();
		while(rs.next()) {
			DailyCountMemberDto dcmdto = new DailyCountMemberDto(rs);
			listM.add(dcmdto);
		}
		con.close();
		return listM;
	}
	
	// 기간조회
	public List<DailyCountMemberDto> getList(String start, String finish) throws Exception {
		Connection con = getConnection();
		
		String sql = "SELECT * FROM daily_count_member "
						+ "WHERE to_date(day, 'YYYY-MM-DD') "
						+ "between to_date(?, 'YYYY-MM-DD') and to_date(?, 'YYYY-MM-DD')";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, start);
		ps.setString(2, finish);
		ResultSet rs = ps.executeQuery();
		
		List<DailyCountMemberDto> listM = new ArrayList<>();
		while(rs.next()) {
			DailyCountMemberDto dcmdto = new DailyCountMemberDto(rs);
			listM.add(dcmdto);
		}						
		con.close();
		return listM;
	}
	
	// 기간조회
		public List<DailyCountMemberDto> getListM(String start, String finish) throws Exception {
			Connection con = getConnection();
			
			String sql = "SELECT * FROM daily_count_member "
							+ "WHERE to_date(day, 'YYYY-MM') "
							+ "between to_date(?, 'YYYY-MM-DD') and to_date(?, 'YYYY-MM')";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, start);
			ps.setString(2, finish);
			ResultSet rs = ps.executeQuery();
			
			List<DailyCountMemberDto> listM = new ArrayList<>();
			while(rs.next()) {
				DailyCountMemberDto dcmdto = new DailyCountMemberDto(rs);
				listM.add(dcmdto);
			}						
			con.close();
			return listM;
		}
	
}
