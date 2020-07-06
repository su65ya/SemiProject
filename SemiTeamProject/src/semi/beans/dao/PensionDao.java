package semi.beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import semi.beans.dto.PensionDto;

public class PensionDao {
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

	
	//펜션 등록 메소드
	public void regist(PensionDto pdto) throws Exception{
		Connection con = getConnection();
		String sql = "INSERT INTO pension VALUES(pension_seq.nextval,?,?,?,?,?,sysdate,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, pdto.getPension_seller_no());
		ps.setString(2, pdto.getPension_name());
		ps.setString(3, pdto.getPension_post());
		ps.setString(4, pdto.getPension_basic_addr());
		ps.setString(5, pdto.getPension_detail_addr());
		ps.setString(6, pdto.getPension_phone());
		
		ps.execute();
		con.close();
	}
}
