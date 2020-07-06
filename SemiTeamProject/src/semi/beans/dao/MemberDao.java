package semi.beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import semi.beans.dto.MemberDto;

public class MemberDao {
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
	
	public void join(MemberDto mdto) throws Exception{
		Connection con = getConnection();
		
		String sql = "INSERT INTO member VALUES(member_seq.nextval,?,?,?,?,?,?,?,?,?,'일반',sysdate)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, mdto.getMember_id());
		ps.setString(2, mdto.getMember_pw());
		ps.setString(3, mdto.getMember_name());
		ps.setString(4, mdto.getMember_birth());
		ps.setString(5, mdto.getMember_mail());
		ps.setString(6, mdto.getMember_post());
		ps.setString(7, mdto.getMember_basic_addr());
		ps.setString(8, mdto.getMember_detail_addr());
		ps.setString(9, mdto.getMember_phone());
		
		ps.execute();
		
		con.close();
		
	}

}
